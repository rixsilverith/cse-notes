from cli import Script

class GetCourseInfo(Script):
    """
    Gets detailed information about a course.
    """
    name = 'info'
    arguments = ['course']
    requires_args = True
    usage = f'{name} <course>'
    description = 'Gets information about a course'

    def action(self, args):
        self.get_info()

    def get_info(self):
        print('\nWork in progress\n')
