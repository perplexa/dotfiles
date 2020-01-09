#!/usr/bin/env python

import os
import struct
import sys

if __name__ == "__main__":
    import sys
    data = open(sys.argv[1], "rb").read()
    ans_out = ""
    for a in data:
        ans_out += chr(struct.unpack("B", a)[0]).decode('cp437')

    print(ans_out.encode('utf-8'))

