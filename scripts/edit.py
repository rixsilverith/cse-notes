from cli import Script

class EditCourse(Script):
    """
    Opens the notes for the specified course in an editor of choice.
    """
    name = 'edit'
    arguments = []
    usage = f'{name} <course> [topic]'
    description = 'Edits the notes for a course'

    def action(self, args):
        self.edit()

    def edit():
        print('\nWork in progress\n')
