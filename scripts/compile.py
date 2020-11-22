#!/usr/bin/python3
from util import get_config, note, success, error
from pathlib import Path
import subprocess
import sys
import os

courses_dir = Path(os.path.join(os.getcwd(), 'courses')).expanduser()
s_course    = sys.argv[1]

# Fetch LaTeX compiler configuration
latex_config       = get_config('latex')
latex_compiler     = latex_config['compiler']
compiler_arguments = latex_config['compiler_arguments']

def compile_course(course):
    # Just a sanity check
    course = str(course)
    # Do not compile if there is some problem with the
    # course files
    course_dir = os.path.join(courses_dir, course)
    if course_exception(course_dir):
        return False

    note(f'Compiling ${course} course notes...')
    # master.tex bundles all the LaTeX files in a course
    master = os.path.join(course_dir, 'master.tex')

    cmd = [].append(latex_compiler).append(compiler_arguments).append(master)
    result = subprocess.run(cmd,
        stdout=subprocess.DEVNULL,
        #stderr=subprocess.DEVNULL,
        cwd=course_dir
    )

    if not result:
        error(f'A fatal error ocurred during compilation. Check courses/${course}/master.log, solve the errors and try again.')
    else
        success(f'${course} course notes compiled successfully!')

def course_exception(course_dir):
    # Ensure that the directory for the course exists
    if not os.is_dir(course_dir):
        error(f'Course ${course} not found :(')
        return True

    # Ensure that the master.tex file exists inside the course directory
    master = path.join(course_dir, 'master.tex')
    if not os.is_file(master):
        error(f'${course} does not have a master.tex file!')
        return True

# By default, when no course is specified we will compile all courses
if not s_course:
    courses = [i for i in courses_dir.itemdir() if i.is_dir()]
    for course in courses:
        compile_course(course)
else:
    compile_course(s_course)
