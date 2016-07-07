import sys
import os


class color:
   PURPLE = '\033[95m'
   CYAN = '\033[96m'
   DARKCYAN = '\033[36m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   YELLOW = '\033[93m'
   RED = '\033[91m'
   BOLD = '\033[1m'
   UNDERLINE = '\033[4m'
   END = '\033[0m'


def print_list(items):
    counter = 0
    for sno, item in enumerate(items):
        if counter == 1:
            print ('')
            counter = 0
        else: counter += 1
        item = color.DARKCYAN + str(sno + 1) + '. ' + color.END + item
        print (item.ljust(70)), 


def pretty_print(D):
    others = []

    for key, items in D.items():
        if len(items) <= 1:
            others += items
            continue
        print (color.BOLD + color.RED + key.upper() + ':' + color.END)
        print_list(items)
        print ('\n')
    
    if others:
        print(color.BOLD + color.RED + 'OTHERS:' + color.END)
        print_list(others)


def arrange_by_type(dirs):
    file_map = {'directory':[]}
    for directory in dirs:
        try:
            os.chdir(os.path.expanduser(directory))
        except Exception as e:
            print Exception
            continue

        files = os.listdir('.')

        for file_name in files:
            if os.path.isfile(file_name):
                split_file_name = file_name.split('.')
                file_format = split_file_name[-1]\
                        if len(split_file_name) > 1 else ''
                if file_format not in file_map: 
                    file_map[file_format] = []
                file_map[file_format].append(file_name)
            else:
                file_map['directory'].append(file_name)

        pretty_print(file_map)


def main():
    dirs = [ os.getcwd() ]
    arrange_by_type(dirs)


if __name__ == '__main__':
    main()
