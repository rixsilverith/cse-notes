from cli import Command
from util import get_config
from pathlib import Path
from os import path, environ
import logging as log
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

class CompileCourse(Command):
    name = 'compile'
    arguments = ['compile_course']
    usage = f'{name} [course]'
    description = 'Compiles (a) course(s)'
    long_description = '''
        Compiles a given course. If no course is provided, all courses will be
        compiled by default, which may take a while.
    '''

    def __init__(self):
        super().__init__(self.name, self.arguments, self.usage, self.description, self.long_description)

    def compile_course(self, course):
        course      = str(course)
        course_dir  = path.join(root, course)
        course_path = Path(course_dir).expanduser()
        master_path = course_path / 'master.tex'

        if not course_path.is_dir():
            log.err(f'\nCourse {course} does not exists :(\n')
            return False

        if not master_path.is_file():
            log.err(f'\nCourse {course} does not have a master.tex file!\n')
            return False

        print()
        print(f'Compiling {course} course notes...')

        cmd  = [latex_compiler]
        args = compiler_arguments.split(' ')
        for arg in args:
            cmd.append(arg)

        cmd.append(master_path)

        result = subprocess.run(cmd,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            cwd=course_path
        )

        if not result:
            log.err(f'A fatal error ocurred during compilation. Check courses/{course}/master.log, solve the errors and try again.\n')
        else:
            log.ok(f'{course} course notes compiled successfully in {time.time() - start_time:.2f} seconds!\n')
