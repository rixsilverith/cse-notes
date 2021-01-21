import logging as log
from cli import CLI

from init import InitializeCourse as init
from list import ListCourses as list
from pull import PullCourses as pull
from info import GetCourseInfo as info
from compile import CompileCourse as compile
from edit import EditCourse as edit
from view import ViewCourseNotes as view
from configure import Configuration as configure

cli = CLI(name='cse-notes',
    description='Scripts for managing CSE notes',
    usage='[script] [<args>...]'
)

cli.add_script(init)
cli.add_script(list)
cli.add_script(pull)
cli.add_script(info)
cli.add_script(compile)
cli.add_script(edit)
cli.add_script(view)
cli.add_script(configure)

def main():
    args = vars(cli.parse_args())
    script = cli.scripts[args['script']]

    try:
        script().run(args['arguments'])
    except Exception as e:
        log.err(e)
        exit(1)

if __name__ == '__main__':
    main()
