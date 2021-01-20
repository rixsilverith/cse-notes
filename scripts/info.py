from cli import Command

class GetCourseInfo(Command):
    name = 'info'
    arguments = ['get_info']
    usage = f'{name} <course>'
    description = 'Gets information about a course'
    long_description = '''
        Compiles a given course. If no course is provided, all courses will be
        compiled by default, which may take a while.
    '''

    def get_info(self, course):
        print(f'Info {course}!')
