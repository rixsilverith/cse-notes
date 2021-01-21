from cli import Script

class InitializeCourse(Script):
    """
    Creates the necessary LaTeX files, folders and info.yaml for a
    new course.
    """
    name = 'init'
    arguments = []
    usage = f'{name}'
    description = 'Initializes a new course'

    def action(self, args):
        self.init_course()

    def init_course():
        print('\nWork in progress\n')
