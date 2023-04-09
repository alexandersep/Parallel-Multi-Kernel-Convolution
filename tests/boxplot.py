import os
import pandas as pd
import sys
import matplotlib.pyplot as plt
import numpy as np

def boxplot(david_student_interleaved_list):
    """ Given a list of file names, graphs a box plot of information """
    plt.ticklabel_format(style="plain")
    plt.title(f"Speed of multiple Stoker 64 height 64 width")
    plt.ylabel("microseconds")
    plt.xlabel("Algorithms")
    plt.boxplot(david_student_interleaved_list)
    names = []
    for i in range(0,len(david_student_interleaved_list), 2):
        names.append("D")
        names.append("S")
    plt.xticks(list(range(1,len(david_student_interleaved_list)+1)), names)
    plt.show()

def read_interleave_file(list_files):
    """ Reads in file name, interleaves into david then student lists
        and returns a tuple of the two lists of information """
    david_student_interleaved_list = []
    for file_name in list_files:
        david_list = []
        student_list = []
        with open(file_name, 'r') as fp:
            for i, line in enumerate(fp): 
                if i % 2 == 0:
                    david_list.append(int(line.strip()))
                else:
                    student_list.append(int(line.strip()))
        david_student_interleaved_list.append(david_list)
        david_student_interleaved_list.append(student_list)
    return david_student_interleaved_list 

def read_file_with_files(file_name):
    list_files = []
    with open(file_name, 'r') as fp:
        for i, file in enumerate(fp):
            list_files.append(file.strip())
    return list_files

def main():
    file_name = sys.argv[1]
    file_name_lists = read_file_with_files(file_name)
    david_student_interleaved_list = read_interleave_file(file_name_lists)
    boxplot(david_student_interleaved_list)

if __name__ == '__main__':
    main()
