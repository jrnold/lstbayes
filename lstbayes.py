import json
import re
import sys

import pystache

SRC = sys.argv[1]

N = 2

with open("stan-mode/stan-lang/stan_lang.json", "r") as f:
    data = json.load(f)

keywords = sorted(data['keywords']
                  + data['pseudo_keywords']
                  + data['function_like_keywords'])

functions = sorted([x for x in data['functions']
                    if not re.match("^operator", x)
                    and x not in keywords])
distributions = sorted(data['distributions'])
    


def tolist(l, n):
    x = [','.join(l[i:i+n]) + ',' for i in range(0, len(l), n)]
    x[len(x) - 1] = x[len(x) - 1][:-1] # remove last comma
    return x

keywords3 = tolist(functions + distributions, N)


with open(SRC, 'r') as f:
    print(pystache.render(f.read(), {'keywords3': keywords3}))

