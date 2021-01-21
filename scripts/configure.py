from cli import Script

class Configuration(Script):
    """
    Updates the CLI configuration, such as the PDF viewer or the
    compiler options, without the need to directly modify the
    config.yaml file.
    """
    name = 'configure'
    arguments = []
    usage = f'{name} <[options]...>'
    description = 'Updates CLI configuration'

    def action(self, args):
        self.set_config()

    def set_config(self):
        print('\nWork in progress\n')
