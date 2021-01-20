from cli import Command

class ListCourses(Command):
    name = 'list'
    arguments = []
    usage = f'{name}'
    description = 'Lists all courses'
    long_description = '''
        Compiles a given course. If no course is provided, all courses will be
        compiled by default, which may take a while.
    '''

    def __init__(self):
        #super().__init__(self, name, usage, description, long_description)
        self.init()

    def init(self):
        print('Coming soon: List course')
