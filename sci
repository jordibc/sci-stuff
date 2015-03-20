#!/usr/bin/env python
# -*- mode: python -*-

"""
Scipion utilities.
"""

import sys
import os
import subprocess


def main():
   commands = 'projects runs data test'.split()

   if len(sys.argv) < 2:
      sys.exit('%s what? (%s)' % (sys.argv[0], ' '.join(commands)))

   if sys.argv[1] in ['help', '--help', '-h']:
      if len(sys.argv) < 3 or sys.argv[2] not in commands:
         sys.exit('usage: %s help <command>\nwhere command can be: %s' %
                  (sys.argv[0], ' '.join(commands)))
      run(sys.argv[2], ['--help'])
      sys.exit()

   if sys.argv[1] not in commands:
      sys.exit('Unknown command: %s\nRun "%s --help" for more info.' %
               (sys.argv[1], sys.argv[0]))

   run(sys.argv[1], sys.argv[2:])


def run(command, args):
   "Run sci-<command> within the scipion environment."
   try:
      subprocess.call(['scipion', 'run', './sci-%s' % command] + args)
   except OSError as e:
      print 'The scipion executable must be in PATH (%s)' % e



if __name__ == '__main__':
   main()
