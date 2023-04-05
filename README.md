# Parallel-Multi-Kernel-Convolution

Written in C as an assignment for the module 
Concurrent Systems I - CSU33014, Assignment 2 in Trinity College Dublin.

## Code
1. To run c programme, ensure you are running on intel architecutre and
   have gcc installed, openmp, and SIMD SSE1-4.2 are used. 
2. Compile and run using `make run`
3. For graphing data, ensure python 3 is installed with pip and 
   install requirements of python `pip install -r requirements.txt`
4. Run graphing using `python graph.py -g file1.txt file2.txt` 
   or `python graph.py --graph`. Note the structure of the files must
   be taken from the /tests directory, where David's code is tested followed
   by our code in an interleave format and new lines after each number 
5. To uninstall python dependencies run `pip uninstall -r requirements.txt`

### Contributors

Alexander Sepelenco [sepelena@tcd.ie](mailto:sepelena@tcd.ie)

Niall Sauvage [sauvagen@tcd.ie](mailto:sauvagen@tcd.ie)

#### License

This repo is licensed under MIT License. You may have our work
and use it how you will making sure to follow the license and 
crediting us. 

Most of the code is not ours, and it is written by David Gregg, our professor.
The code that we have changed would be student\_conv. 
All rights reserved to [David Gregg](https://www.scss.tcd.ie/David.Gregg/).
