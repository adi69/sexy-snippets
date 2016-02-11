#!/usr/bin/env python

import commands
import sys

pwd = commands.getstatusoutput('pwd')[1]

for i in sys.argv[1:-1]:
    file_full_path = pwd + '/' + i
    command = 'git add "' + file_full_path + '"'
    print "EXECUTE ===> ", command
    x = commands.getstatusoutput(command)

msg = sys.argv[-1]
command = 'git commit -m "' + msg + '"'
print "EXECUTE ===> ", command
y = commands.getstatusoutput(command)

print x[1]
print y[1]

