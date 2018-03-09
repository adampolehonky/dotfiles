#!python3

import os
import errno


def createSymlink(file1, file2):
    try:
        os.symlink(file1, file2)
    except OSError, e:

    if e.errno == errno.EEXIST:
            os.remove(file2)
            os.symlink(file1, file2)
