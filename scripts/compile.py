#!/usr/bin/python3
from util import get_config, note, success, error
from pathlib import Path
from os import path, environ
import subprocess
import time
import sys

start_time = time.time()
root       = path.join(environ.get('LECTURE_NOTES_HOME'), 'courses')
s_course   = sys.argv[1]

# Fetch LaTeX compiler configuration
latex_config       = get_config('latex')
latex_compiler     = latex_config['compiler']
compiler_arguments = latex_config['compiler_arguments']

# Given the id (directory name) of a course compile its master.tex file.
def compile_master(course):
    course      = str(course)
    course_dir  = path.join(root, course)
    course_path = Path(course_dir).expanduser()
    master_path = course_path / 'master.tex'

    if not course_path.is_dir():
        error(f'\nCourse {course} does not exists :(\n')
        return False

    if not master_path.is_file():
        error(f'\nCourse {course} does not have a master.tex file!\n')
        return False

    print()
    note(f'Compiling {course} course notes...')

    cmd  = [latex_compiler]
    args = compiler_arguments.split(' ')
    for arg in args:
        cmd.append(arg)
    if len(sys.argv) > 2 and sys.argv[2] == '-w':
        cmd.append('-pvc')

    cmd.append(master_path)

    result = subprocess.run(cmd,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        cwd=course_path
    )

    if not result:
        error(f'A fatal error ocurred during compilation. Check courses/{course}/master.log, solve the errors and try again.\n')
    else:
        success(f'{course} course notes compiled successfully in {time.time() - start_time:.2f} seconds!\n')

# By default, when no course is specified we will compile all courses
if not s_course:
    courses = [i for i in Path(root).expanduser().itemdir() if i.is_dir()]
    for course in courses:
        compile_master(course)
else:
    compile_master(s_course)
