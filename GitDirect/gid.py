import sys
import webbrowser
import subprocess

def makepr(params):
    url = 'https://github.com/grofers/ios-consumer/compare/' + params['primary_branch'] + '...' + params['secondary_branch']  
    webbrowser.open_new(url)


def get_params(request):
    #to use current branch current_branch = subprocess.check_output(["git", "name-rev", "--name-only", "HEAD"]).strip()
    params = {
            'primary_branch'   : '',
            'secondary_branch' : '',
            'title'            : '',
            }

    index = 0

    if request[index + 1]:
        params['primary_branch'] = request[index + 1]

    try:
        params['secondary_branch'] = subprocess.check_output(["git", "name-rev", "--name-only", "HEAD"]).strip()
    except Exception as e:
        print e

    if index + 2 < len(request):
        if request[index + 2] == '-m':
            params['secondary_branch'] = subprocess.check_output(["git", "name-rev", "--name-only", "HEAD"]).strip()
        else:
            params['secondary_branch'] = request[index + 2]

    if index + 3 < len(request):
        if request[index + 3] == '-m': 
            params['title'] = request[index + 4]
        else:
            params['title'] = request[index + 3]

    return params


def main():
    params = get_params(sys.argv)
    makepr(params)


if __name__ == "__main__":
    main()
