from cli import Script

class ViewCourseNotes(Script):
    """
    Opens the compiled notes of the specified course in a PDF viewer
    of choice.
    """
    name = 'view'
    arguments = ['pdf_viewer', 'picker']
    usage = f'{name} <course> [options]'
    description = 'Opens the compiled notes for a course'

    def action(self, args):
        self.open_notes()

    def open_notes(self):
        print('\nWork in progress\n')
