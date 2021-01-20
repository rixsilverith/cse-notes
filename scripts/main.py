import logging as log
from cli import CLI

from compile import CompileCourse
from info import GetCourseInfo
from init import InitializeCourse
from edit import EditCourse
from view import ViewCourse
from pull import PullCourses
from list import ListCourses
from configure import Configuration

cli = CLI(name='cse-notes',
    description='Computer Science and Engineering course notes manager',
    usage='[script] [<args>...]'
)

cli.command(InitializeCourse)
cli.command(ListCourses)
cli.command(PullCourses)
cli.command(GetCourseInfo)
cli.command(CompileCourse)
cli.command(EditCourse)
cli.command(ViewCourse)
cli.command(Configuration)

def main():
    # Entry point of the CLI. This function will look for the different
    # scripts (subcommands) and execute the correspoding with its
    # arguments.
    # This will print help if no arguments are supplied to cse-notes
    args = vars(cli.parse_args())

    subcommand = cli.subcommands[args['subcommand']]
    args.pop('subcommand')

    try:
        subcommand().execute(args)
    except Exception as e:
        log.err(e)
        exit(1)

if __name__ == '__main__':
    main()
