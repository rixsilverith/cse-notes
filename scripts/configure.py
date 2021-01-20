from cli import Command

class Configuration(Command):
    name = 'configure'
    arguments = []
    usage = f'{name} <[options]...>'
    description = 'Updates CLI configuration'
    long_description = '''
        Compiles a given course. If no course is provided, all courses will be
        compiled by default, which may take a while.
    '''

    def __init__(self):
        #super().__init__(self, name, usage, description, long_description)
        self.init()

    def init(self):
        print('Coming soon: Config')
