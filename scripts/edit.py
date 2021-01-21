from cli import Script

class EditCourse(Script):
    """
    Opens the notes for the specified course in an editor of choice.
    """
    name = 'edit'
    requires_args = True
    arguments = []
    usage = f'{name} <course> [topic]'
    description = 'Edits the notes for a course'

    def action(self, args):
        self.edit()

    def edit(self):
        print('\nWork in progress\n')
