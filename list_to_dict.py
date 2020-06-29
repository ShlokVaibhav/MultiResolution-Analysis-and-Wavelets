l1=[{"Name":"India","Form":"Parliamentary","Federal character":"50%"},{"Name":"USA","Form":"Presidential","Federal character":"75%"},{"Name":"China","Form":"Single-party","Federal character":"25%"}]
keys=l1[0].keys()
l2={}
import json
l2.fromkeys(keys)
for key in keys:
    l2.update({key:[]})

#or there is an more elegant way:
l2={key:[] for key in keys}


for line in l1:
    for key in keys:
        l2[key].append(line[key])

import pandas as po

df=po.DataFrame(l2)
first=df[df["Name"]=="India"]
print(first[["Name"]].values[0][0][0])
