from cli import Script

class ListCourses(Script):
    """
    Gets a list including some information about the courses.
    """
    name = 'list'
    arguments = []
    usage = f'{name}'
    description = 'Lists all courses'

    def action(self, args):
        self.list()

    def list(self):
        print('\nWork in progress\n')
