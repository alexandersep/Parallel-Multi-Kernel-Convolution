/* Test and timing harness program for developing a multichannel
   multikernel convolution (as used in deep learning networks)

   Note there are some simplifications around this implementation,
   in particular with respect to computing the convolution at edge
   pixels of the image.

Author: David Gregg
Date:   March 2022

Version 1.7 : Adjusted types for mixed-type computation

Version 1.6 : Modified the code so that the input tensor is float

Version 1.5 : Modified the code so that the input and kernel
are tensors of 16-bit integer values

Version 1.4 : Modified the random generator to reduce the range
of generated values;

Version 1.3 : Fixed which loop variables were being incremented
in write_out();
Fixed dimensions of output and control_output 
matrices in main function

Version 1.2 : Changed distribution of test data to (hopefully) 
eliminate random walk of floating point error;
Also introduced checks to restrict kernel-order to
a small set of values

Version 1.1 : Fixed bug in code to create 4d matrix
*/

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <assert.h>
#include <omp.h>
#include <math.h>
#include <stdint.h>
#include <x86intrin.h>

/* Source: https://stackoverflow.com/questions/3219393/stdlib-and-colored-output-in-c */
#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_YELLOW   "\x1b[33m"
#define ANSI_COLOR_BLUE     "\x1b[34m"
#define ANSI_COLOR_CYAN     "\x1b[36m"
#define ANSI_COLOR_MAGENTA  "\x1b[35m"
#define ANSI_COLOR_RESET    "\x1b[0m"

/* the following two definitions of DEBUGGING control whether or not
   debugging information is written out. To put the program into
   debugging mode, uncomment the following line: */
/*#define DEBUGGING(_x) _x */
/* to stop the printing of debugging information, use the following line: */
#define DEBUGGING(_x)


/* write 3d matrix to stdout */
void write_out(int16_t *** a, int dim0, int dim1, int dim2)
{
    int i, j, k;

    for ( i = 0; i < dim0; i++ ) {
        printf("Outer dimension number %d\n", i);
        for ( j = 0; j < dim1; j++ ) {
            for ( k = 0; k < dim2 - 1; k++ ) {
                printf("%d, ", a[i][j][k]);
            }
            // print end of line
            printf("%d\n", a[i][j][dim2-1]);
        }
    }
}


/* create new empty 4d float matrix */
// dim0 = 1, dim1 = width+kernel_order, dim2 = height+kernel_order, dim3 = nchannels 
float **** new_empty_4d_matrix_float(int dim0, int dim1, int dim2, int dim3)
{
    float **** result = malloc(dim0 * sizeof(float***));
    float *** mat1 = malloc(dim0 * dim1 * sizeof(float**));
    float ** mat2 = malloc(dim0 * dim1 * dim2 * sizeof(float*));
    float * mat3 = malloc(dim0 * dim1 * dim2 *dim3 * sizeof(float));
    int i, j, k;


    for ( i = 0; i < dim0; i++ ) {
        result[i] = &(mat1[i*dim1]);
        for ( j = 0; j < dim1; j++ ) {
            result[i][j] = &(mat2[i*dim1*dim2 + j*dim2]);
            for ( k = 0; k < dim2; k++ ) {
                result[i][j][k] = &(mat3[i*dim1*dim2*dim3+j*dim2*dim3+k*dim3]);
            }
        }
    }

    return result;
}

/* create new empty 3d matrix */
float *** new_empty_3d_matrix_float(int dim0, int dim1, int dim2)
{
    float **** mat4d;
    float *** mat3d;

    // create a 4d matrix with single first dimension
    mat4d = new_empty_4d_matrix_float(1, dim0, dim1, dim2);
    // now throw away out first dimension
    mat3d = mat4d[0];
    free(mat4d);
    return mat3d;
}

/* create new empty 4d int16_t matrix */
// dim0 = 1, dim1 = nchannels, dim2 = width, dim3 = height
// dim0 = nkernels, dim1 = nchannels, dim2 = kernel_order, dim3 = kernel_order
int16_t **** new_empty_4d_matrix_int16(int dim0, int dim1, int dim2, int dim3)
{
    int16_t **** result = malloc(dim0 * sizeof(int16_t***));        //1
    int16_t *** mat1 = malloc(dim0 * dim1 * sizeof(int16_t**));     // 1 * nchannels
    int16_t ** mat2 = malloc(dim0 * dim1 * dim2 * sizeof(int16_t*)); // 1 * nchannels * width
    int16_t * mat3 = malloc(dim0 * dim1 * dim2 *dim3 * sizeof(int16_t)); //1 * nchannels * width * height
    int i, j, k;


    for ( i = 0; i < dim0; i++ ) {
        result[i] = &(mat1[i*dim1]);
        for ( j = 0; j < dim1; j++ ) {
            result[i][j] = &(mat2[i*dim1*dim2 + j*dim2]);
            for ( k = 0; k < dim2; k++ ) {
                result[i][j][k] = &(mat3[i*dim1*dim2*dim3+j*dim2*dim3+k*dim3]);
            }
        }
    }

    return result;
}

/* create new empty 3d matrix */
int16_t *** new_empty_3d_matrix_int16(int dim0, int dim1, int dim2)
{
    int16_t **** mat4d;
    int16_t *** mat3d;

    // create a 4d matrix with single first dimension
    mat4d = new_empty_4d_matrix_int16(1, dim0, dim1, dim2);
    // now throw away out first dimension
    mat3d = mat4d[0];
    free(mat4d);
    return mat3d;
}

/* take a copy of the matrix and return in a newly allocated matrix */
int16_t **** copy_4d_matrix(int16_t **** source_matrix, int dim0,
        int dim1, int dim2, int dim3)
{
    int i, j, k, l;
    int16_t **** result = new_empty_4d_matrix_int16(dim0, dim1, dim2, dim3);

    for ( i = 0; i < dim0; i++ ) {
        for ( j = 0; j < dim1; j++ ) {
            for ( k = 0; k < dim2; k++ ) {
                for ( l = 0; l < dim3; l++ ) {
                    result[i][j][k][l] = source_matrix[i][j][k][l];
                }
            }
        }
    }
    return result;
}

/* create a matrix and fill it with random numbers */
int16_t **** gen_random_4d_matrix_int16(int dim0, int dim1, int dim2, int dim3)
{
    int16_t **** result;
    int i, j, k, l;
    struct timeval seedtime;
    int seed;

    result = new_empty_4d_matrix_int16(dim0, dim1, dim2, dim3);

    /* use the microsecond part of the current time as a pseudorandom seed */
    gettimeofday(&seedtime, NULL);
    seed = seedtime.tv_usec;
    srandom(seed);

    /* fill the matrix with random numbers */
    const int range = 1 << 10; // 2^10
                               //const int bias = 1 << 16; // 2^16
    for ( i = 0; i < dim0; i++ ) {
        for ( j = 0; j < dim1; j++ ) {
            for ( k = 0; k < dim2; k++ ) {
                for ( l = 0; l < dim3; l++ ) {
                    // generate uniform random integer with mean of zero
                    long long rand = random();
                    // now cut down the range and bias the mean to reduce
                    // the likelihood of large floating point round-off errors
                    int reduced_range = (rand % range);
                    result[i][j][k][l] = reduced_range;
                }
            }
        }
    }

    return result;
}


/* create a matrix and fill it with random numbers */
float **** gen_random_4d_matrix_float(int dim0, int dim1, int dim2, int dim3)
{
    float **** result;
    int i, j, k, l;
    struct timeval seedtime;
    int seed;

    result = new_empty_4d_matrix_float(dim0, dim1, dim2, dim3);

    /* use the microsecond part of the current time as a pseudorandom seed */
    gettimeofday(&seedtime, NULL);
    seed = seedtime.tv_usec;
    srandom(seed);

    /* fill the matrix with random numbers */
    const int range = 1 << 12; // 2^12
    const int bias = 1 << 10; // 2^16
    for ( i = 0; i < dim0; i++ ) {
        for ( j = 0; j < dim1; j++ ) {
            for ( k = 0; k < dim2; k++ ) {
                for ( l = 0; l < dim3; l++ ) {
                    // generate uniform random integer with mean of zero
                    long long rand = random();
                    // now cut down the range and bias the mean to reduce
                    // the likelihood of large floating point round-off errors
                    int reduced_range = (rand % range);
                    result[i][j][k][l] = reduced_range + bias;
                }
            }
        }
    }

    return result;
}


/* create a matrix and fill it with random numbers */
float *** gen_random_3d_matrix_float(int dim0, int dim1, int dim2)
{
    float **** mat4d;
    float *** mat3d;

    // create a 4d matrix with single first dimension
    mat4d = gen_random_4d_matrix_float(1, dim0, dim1, dim2);
    // now throw away out first dimension
    mat3d = mat4d[0];
    free(mat4d);
    return mat3d;
}

/* create a matrix and fill it with random numbers */
int16_t *** gen_random_3d_matrix_int16(int dim0, int dim1, int dim2)
{
    int16_t **** mat4d;
    int16_t *** mat3d;

    // create a 4d matrix with single first dimension
    mat4d = gen_random_4d_matrix_int16(1, dim0, dim1, dim2);
    // now throw away out first dimension
    mat3d = mat4d[0];
    free(mat4d);
    return mat3d;
}

/* check the sum of absolute differences is within reasonable epsilon */
void check_result(float *** result, float *** control,
        int dim0, int dim1, int dim2)
{
    int i, j, k;
    double sum_abs_diff = 0.0;
    const double EPSILON = 0.0625;

    //printf("SAD\n");

    for ( i = 0; i < dim0; i++ ) {
        for ( j = 0; j < dim1; j++ ) {
            for ( k = 0; k < dim2; k++ ) {
                double diff = fabs(control[i][j][k] - result[i][j][k]);
                assert( diff >= 0.0 );
                sum_abs_diff = sum_abs_diff + diff;
            }
        }
    }

    if ( sum_abs_diff > EPSILON ) {
        fprintf(stderr, ANSI_COLOR_RED "WARNING: ");
        fprintf(stderr, ANSI_COLOR_RESET "sum of absolute differences ");
        fprintf(stderr, ANSI_COLOR_RED "(%f) ", sum_abs_diff);
        fprintf(stderr, ANSI_COLOR_RESET "> EPSILON (%f)\n", EPSILON);
    }
    else {
        printf(ANSI_COLOR_GREEN "COMMENT: ");
        printf(ANSI_COLOR_RESET "sum of absolute differences ");
        printf(ANSI_COLOR_GREEN "(%f) ", sum_abs_diff);
        printf(ANSI_COLOR_RESET "within acceptable range (%f)\n", EPSILON);
    }
}

/* the slow but correct version of matmul written by David */
void multichannel_conv(float *** image, int16_t **** kernels,
        float *** output, int width, int height,
        int nchannels, int nkernels, int kernel_order)
{
    int h, w, x, y, c, m;
    //#pragma omp parallel for
    for ( m = 0; m < nkernels; m++ ) {
        for ( w = 0; w < width; w++ ) {
            for ( h = 0; h < height; h++ ) {
                double sum = 0.0;
                for ( c = 0; c < nchannels; c++ ) {
                    for ( x = 0; x < kernel_order; x++) {
                        for ( y = 0; y < kernel_order; y++ ) {
                            sum += image[w+x][h+y][c] * kernels[m][c][x][y];
                        }
                    }
                    output[m][w][h] = (float) sum;
                }
            }
        }
    }
}

static inline float hsum_ps_sse3(__m128 v4a) {
    __m128 shuf = _mm_movehdup_ps(v4a);
    __m128 sums = _mm_add_ps(v4a, shuf);
    shuf        = _mm_movehl_ps(shuf, sums);
    sums        = _mm_add_ss(sums, shuf);
    return _mm_cvtss_f32(sums);
}

/* the fast version of matmul written by the student */
void student_conv(float *** image, int16_t **** kernels, float *** output,
        int width, int height, int nchannels, int nkernels,
        int kernel_order)
{

    int h, w, x, y, c, m;
    float * image_1d = **image;
    int16_t * kernel = ***kernels;
    int ko2 = kernel_order * kernel_order;
    int width_offset = (height+kernel_order) * nchannels;
    int kernel_offset = nchannels * ko2;
    int kernel_offset_increase = ko2 << 3;
    int image_offset_precalc;
    int kernel_total_offset_precalc;
    int image_offset;
    double sum;
    int kernel_total_offset;
    int16_t * t_kernel = malloc(sizeof(int16_t) * nchannels * kernel_order * kernel_order * nkernels);
    
    // VERY BAD TRANSPOSE ALGORITHM
    // USE AT OWN RISK
    // MIGHT CAUSE YOUR CAT TO RUN AWAY
    // Variables for storing previous calculations
    int m_times_kernel_offset;
    int c_times_ko2;
    int x_times_kernel_order;
    #pragma omp parallel for // maybe this will numb the pain
    for(int m = 0; m < nkernels; m++){
        m_times_kernel_offset = m * kernel_offset;
        for(int c = 0; c < nchannels; c++){
            c_times_ko2 = c * ko2;
            for(int x = 0; x < kernel_order; x++){
                x_times_kernel_order = x * kernel_order;
                kernel_total_offset_precalc = m_times_kernel_offset + x_times_kernel_order + c_times_ko2; 
                for(int y = 0; y < kernel_order; y++){
                    t_kernel[m_times_kernel_offset + x_times_kernel_order * nchannels + y * nchannels + c] = kernel[kernel_total_offset_precalc + y];
                }
            }
        }
    }

    #pragma omp parallel for
    for ( m = 0; m < nkernels; m++ ) {
        for ( w = 0; w < width; w++ ) {
            for ( h = 0; h < height; h++ ) {
                sum = 0.0;
                for ( x = 0; x < kernel_order; x++ ) {
                    image_offset_precalc = (w+x) * width_offset;
                    kernel_total_offset_precalc = m * kernel_offset + x * kernel_order;
                    for ( y = 0; y < kernel_order; y++ ) {
                        image_offset = image_offset_precalc + (h+y) * nchannels;
                        kernel_total_offset = kernel_total_offset_precalc + y; 
                        #pragma GCC unroll 4
                        for ( c = 0; c < nchannels; c+=8 ) {

                            sum += image_1d[image_offset++] * kernel[kernel_total_offset]; 
                            sum += image_1d[image_offset++] * kernel[kernel_total_offset + ko2];
                            sum += image_1d[image_offset++] * kernel[kernel_total_offset + ko2 * 2];
                            sum += image_1d[image_offset++] * kernel[kernel_total_offset + ko2 * 3];
                            sum += image_1d[image_offset++] * kernel[kernel_total_offset + ko2 * 4];
                            sum += image_1d[image_offset++] * kernel[kernel_total_offset + ko2 * 5];
                            sum += image_1d[image_offset++] * kernel[kernel_total_offset + ko2 * 6];
                            sum += image_1d[image_offset++] * kernel[kernel_total_offset + ko2 * 7];

                            kernel_total_offset += kernel_offset_increase;
                        }
                    }
                }
                output[m][w][h] = (float) sum;
            }
        }
    }
}

int main(int argc, char ** argv)
{
    //float image[W][H][C];
    //float kernels[M][C][K][K];
    //float output[M][W][H];

    float *** image;
    int16_t **** kernels;
    float *** control_output, *** output;
    long long mul_time_david, mul_time_student;
    int width, height, kernel_order, nchannels, nkernels;
    struct timeval start_time;
    struct timeval stop_time;

    if ( argc != 6 ) {
        fprintf(stderr, "Usage: conv-harness <image_width> <image_height> <kernel_order> <number of channels> <number of kernels>\n");
        exit(1);
    }
    else {
        width = atoi(argv[1]);
        height = atoi(argv[2]);
        kernel_order = atoi(argv[3]);
        nchannels = atoi(argv[4]);
        nkernels = atoi(argv[5]);
    }
    switch ( kernel_order ) {
        case 1:
        case 3:
        case 5:
        case 7: break;
        default:
                fprintf(stderr, "FATAL: kernel_order must be 1, 3, 5 or 7, not %d\n",
                        kernel_order);
                exit(1);
    }

    /* allocate the matrices */
    image = gen_random_3d_matrix_float(width+kernel_order, height + kernel_order,
            nchannels);
    kernels = gen_random_4d_matrix_int16(nkernels, nchannels, kernel_order, kernel_order);
    output = new_empty_3d_matrix_float(nkernels, width, height);
    control_output = new_empty_3d_matrix_float(nkernels, width, height);

    //DEBUGGING(write_out(A, a_dim1, a_dim2));

    /* record starting time of David code*/
    gettimeofday(&start_time, NULL);
    /* use a simple multichannel convolution routine to produce control result */
    multichannel_conv(image, kernels, control_output, width,
            height, nchannels, nkernels, kernel_order);

    /* record finishing time of David code*/
    gettimeofday(&stop_time, NULL);
    mul_time_david = (stop_time.tv_sec - start_time.tv_sec) * 1000000L +
        (stop_time.tv_usec - start_time.tv_usec);

    /* record starting time of student's code*/
    gettimeofday(&start_time, NULL);

    /* perform student's multichannel convolution */
    student_conv(image, kernels, output, width,
            height, nchannels, nkernels, kernel_order);

    /* record finishing student time */
    gettimeofday(&stop_time, NULL);
    mul_time_student = (stop_time.tv_sec - start_time.tv_sec) * 1000000L +
        (stop_time.tv_usec - start_time.tv_usec);
      
    printf(ANSI_COLOR_CYAN "David conv time: ");
    printf(ANSI_COLOR_YELLOW "%lld microseconds\n", mul_time_david);
    printf(ANSI_COLOR_BLUE "Student conv time: ");
    printf(ANSI_COLOR_YELLOW "%lld microseconds\n", mul_time_student);

    double percent = mul_time_david / (double) mul_time_student;
    printf(ANSI_COLOR_RESET "The ");
    printf(ANSI_COLOR_GREEN "total speed up time ");
    printf(ANSI_COLOR_RESET "was ");
    printf(ANSI_COLOR_MAGENTA "%.2fx ", percent);
    printf(ANSI_COLOR_RESET "and ");
    printf(ANSI_COLOR_YELLOW "%lld microseconds ", mul_time_david - mul_time_student);
    printf(ANSI_COLOR_RESET "less\n");

    DEBUGGING(write_out(output, nkernels, width, height));

    /* now check that the student's multichannel convolution routine
       gives the same answer as the known working version */
    check_result(output, control_output, nkernels, width, height);

    return 0;
}
