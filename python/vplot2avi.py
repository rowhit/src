#!/usr/bin/env python

import os, sys, time
import vplot2gif

def convert(infile,outfile):
    gif = 'gif.%s' %  time.time()    
    vplot2gif.convert(infile,gif)
    run = 'ffmpeg -f gif -i %s %s' % (gif,outfile)
    os.system(run)
    os.unlink(gif)

if __name__ == "__main__":
    argc = len(sys.argv)

    if argc < 2:
        print "No input"
        sys.exit(1)

    infile = sys.argv[1]
        
    if not os.path.isfile(infile):
        print "\"%s\" is not a file" % infile
        sys.exit(1)

    if argc < 3:
        outfile = os.path.splitext(infile)[0]+'.avi'
    else:
        outfile = sys.argv[2]

    convert(infile,outfile);   
    sys.exit(0)

    
