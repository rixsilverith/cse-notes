from cli import Command

class InitializeCourse(Command):
    name = 'init'
    arguments = []
    usage = f'{name}'
    description = 'Initializes a new course'
    long_description = 'Compiles a given course. If no course is provided, all courses will be \n  compiled by default, which may take a while.'

    def __init__(self):
        super().__init__(
            self.name,
            self.arguments,
            self.usage,
            self.description,
            self.long_description
        )

    def init(self):
        print('Coming soon: Initialize course')
