from termcolor import colored
from pathlib import Path
from os import path, environ
import yaml

def note(message):
    print(colored(' >', 'green'), message)

def success(message):
    print(colored(f' ✔ {message}', 'green'))

def warn(message):
    print(colored(f' ! {message}', 'yellow'))

def error(message):
    print(colored(f' ✖ {message}', 'red'))

def load_config():
    config_file = Path(path.join(environ.get('LECTURE_NOTES_HOME'), 'config.yaml')).expanduser()
    with open(config_file) as file:
        return yaml.load(file, Loader=yaml.FullLoader)

def get_config(key):
    config = load_config()
    if key in config:
        return config[key]

def set_config(key, value):
    config      = load_config()
    config[key] = value

    config_file = Path(path.join(environ.get('LECTURE_NOTES_HOME'), 'config.yaml')).expanduser()
    with open(config_file, 'w') as file:
        yaml.dump(config, file, sort_keys=True)
        return config

def load_yaml(path):
    with open(path, 'r') as file:
        return yaml.load(file, Loader=yaml.FullLoader)

def dump_yaml(path, content):
    with open(path, 'w') as file:
        yaml.dump(content, file, sort_keys=False)
