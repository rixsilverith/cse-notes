#!/usr/bin/python3
from termcolor import colored
from pathlib import Path
import yaml

def note(message):
    print(colored('>', 'green'), message)

def success(message):
    print(colored(f'✔ ${message}', 'green'))

def warn(message):
    print(colored(f'! ${message}', 'yellow'))

def error(message):
    print(colored(f'✖ ${message}', 'red'))

def load_config():
    config_file = Path('~/Uni/config.yaml').expanduser()
    with open(config_file) as file:
        return yaml.load(file, Loader=yaml.FullLoader)

def get_config(key):
    config = load_config()
    if key in config:
        return config[key]

def set_config(key, value):
    config      = load_config()
    config[key] = value

    config_file = Path('~/Uni/config.yaml').expanduser()
    with open(config_file, 'w') as file:
        yaml.dump(config, file, sort_keys=True)
        return config
