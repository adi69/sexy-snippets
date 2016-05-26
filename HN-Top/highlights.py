from stop_words import words

from itertools import product

hl_limit = 12

class Highlights(object):
    
    def get(self, S=''):
        self.S = S
        D = dict()
        s = ""
        arr = S.split(' ')
        
        if len(arr) < 50:
            return []

        for word in arr:
            word = self._trim(word)
            
            if word == "" or word == " ":
                continue
            
            s += word + " "

            if word not in words:
                if word in D:
                    D[word] += 1
                else:
                    D[word] = 1
        
        D = sorted(D.items(), key = lambda x: x[1], reverse = True)
        filtered_terms = []
        limit = hl_limit if len(D) > hl_limit else len(D)
        final_list = self._phrase_extraction(s, D[:limit])    
        return final_list
    
    def _trim(self, word):
        '''
        clean word from input string
        '''
        word = word.strip().lower()
        L = len(word)        
        i = 0
        
        while i < L and not word[i].isalnum():
            i += 1
        
        j = L - 1
        while j >= 0 and not word[j].isalnum():
            j -= 1
        
        return word[i:j+1]


    def _phrase_extraction(self, S, D):
        '''
        advanced biword extraction from the uniword list
        '''
        
        D = dict(D)
        E = dict(D)
        phrases = list(product(D.keys(),D.keys()))
        
        for tup in phrases:
            biword = "%s %s" % tup
            biword_count = S.count(biword)
            
            threshold = 0.6
            val = biword_count * 1.0 / max(E[tup[0]], E[tup[1]])

            if val >= threshold :
                if tup[0] in D.keys():
                    del D[tup[0]]
                if tup[1] in D.keys():
                    del D[tup[1]]
                D[biword] = 0

        return D.keys()


