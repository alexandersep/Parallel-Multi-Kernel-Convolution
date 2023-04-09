# Created by: Alexander Sepelenco 20335014, Niall Sauvage 20334203
import os
from sys import argv
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

def_dict = {'Image Size': 0, 'Kernel Order': 2, 'Num. Channels':3, 'Num. Kernels': 4}

def graph(file_names):
    dir = argv[1]
    metric = argv[2]
    fnames = argv[3:]
    d_tuple_list = []
    s_tuple_list = []
    for fname in fnames:
        attributes = fname.split('-')
        fcontent = open(dir+'stoker-output-'+fname).read()
        lines = fcontent.split('\n')
        david_list = []
        student_list = []
        for i, line in enumerate(lines):
            if line == '':
                break
            if not i % 2:
                david_list.append(int(line))
            else:
                student_list.append(int(line))
        d_tuple = (attributes[def_dict[metric]], np.mean(david_list))
        s_tuple = (attributes[def_dict[metric]], np.mean(student_list))
        d_tuple_list.append(d_tuple)
        s_tuple_list.append(s_tuple)
    plt.plot(*zip(*s_tuple_list), label='Student Conv')
    plt.plot(*zip(*d_tuple_list), label='David Conv')
    plt.legend()
    plt.title(metric + ' vs Time')
    plt.xlabel(metric)
    plt.ylabel('Time in microseconds')
    plt.show()
    



    """ Given a list of file names, graphs a box plot of information """
    
def main(argv):
    graph(argv)
    print('Finished')

if __name__ == '__main__':
    main(argv)
