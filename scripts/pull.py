from cli import Script

class PullCourses(Script):
    """
    Pull the latests changes from the assigned repo.
    """
    name = 'pull'
    arguments = []
    usage = f'{name}'
    description = 'Pulls the latest changes from the repo'

    def action(self, args):
        self.pull_changes()

    def pull_changes(self):
        print('\nWork in progress\n')
