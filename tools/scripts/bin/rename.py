#!/bin/bash
#rename

import os


def main():
    path = ""

    for root, dirs, files in sorted(os.walk(path)):
        count = 1
        for i in sorted(files):
            os.rename(os.path.join(root, i), os.path.join(root, "IDC" + str(os.path.basename(root)) + "_p" + str("{:04d}".format(count)) + os.path.splitext(i)[1]))
            count += 1


if __name__ == '__main__':
    main()
