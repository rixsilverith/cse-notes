from cli import Command

class ViewCourse(Command):
    name = 'view'
    arguments = []
    usage = f'{name} <course> [options]'
    description = 'Opens the compiled notes for a course'
    long_description = '''
        Compiles a given course. If no course is provided, all courses will be
        compiled by default, which may take a while.
    '''

    def __init__(self):
        #super().__init__(self, name, usage, description, long_description)
        self.init()

    def init(self):
        print('Coming soon: View course notes')
