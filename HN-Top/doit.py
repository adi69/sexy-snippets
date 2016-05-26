import requests
from bs4 import BeautifulSoup
from highlights import Highlights as hls


def printf(*args):
    for arg in args:
        print arg,' === ',
    print '\n'


def main():
    soup = BeautifulSoup(requests.get('https://news.ycombinator.com/news').content)
    links=soup.find_all('span', attrs={'class':'deadmark'})
    for link in links:
        webpage = link.next_sibling.get('href')
        content = BeautifulSoup(requests.get(webpage).content).body.get_text()
        printf((webpage, hls().get(content))) 

if __name__ == "__main__":
    main()
