import logging as log
from cli import cli, Script
from typing import List

from init import InitializeCourse
from list import ListCourses
from pull import PullCourses
from info import GetCourseInfo
from compile import CompileCourse
from edit import EditCourse
from view import ViewCourseNotes
from configure import Configuration

scripts: List[Script] = [
    InitializeCourse,
    ListCourses,
    PullCourses,
    GetCourseInfo,
    CompileCourse,
    EditCourse,
    ViewCourseNotes,
    Configuration
]

for script in scripts:
    cli.add_script(script)

def main():
    args = vars(cli.parse_args())
    script: Script = cli.scripts[args['script']]

    try:
        script().run(args['arguments'])
    except Exception as e:
        log.err(e)
        exit(1)

if __name__ == '__main__':
    main()
