import os
import pandas as pd
import argparse

def get_argument():
    """ Returns the arguments which was passed by terminal """
    parser = argparse.ArgumentParser()
    parser.add_argument("-g", "--graph", help="graph the csv", required=True)
    return vars(parser.parse_args())

def graph(file_names):
    """ Given a list of file names, graphs a box plot of information """
    
def main():
    get_argument()
    graph()

if __name__ == '__main__':
    main()
