from cli import Command

class PullCourses(Command):
    name = 'pull'
    arguments = ['get_info']
    usage = f'{name}'
    description = 'Pulls the latest changes from the repo'
    long_description = '''
        Compiles a given course. If no course is provided, all courses will be
        compiled by default, which may take a while.
    '''

    def get_info(self, course):
        print(f'Info {course}!')
