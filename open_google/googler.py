import sys
import webbrowser

if len(sys.argv) <= 1:
    webbrowser.open_new('https://www.google.co.in/')
else:
    q = ''
    for i in sys.argv[1:]:
        q += i + '+'

    webbrowser.open_new('https://www.google.co.in/search?q=' + q)
