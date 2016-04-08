ppl = [i for i in range(1,101)]
daggar = 0
while True:
    
    if daggar + 1 >= len(ppl): # people left after each round
        print ppl
    
    if len(ppl) == 1: #print survivor
        print "survivor = ", ppl[0]
        break
    
    to_kill = ppl[(daggar+1)%len(ppl)]
    daggar_next = (daggar + 1)%len(ppl)
    ppl.remove(to_kill)
    daggar = daggar_next
