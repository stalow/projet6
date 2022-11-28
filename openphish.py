import urllib3

import base64
import requests



""""
http = urllib3.PoolManager()
r = http.request('GET', "https://openphish.com/feed.txt")
with open("phifile.txt", 'wb') as out:
    out.write(r.data)

with open("phifile.txt", 'r') as out:
    for i in range(0,10):
        print(out.readline())

"""

print("git")


url = 'https://api.github.com/repos/mitchellkrogza/Phishing.Database/contents/phishing-links-NEW-today.txt'
req = requests.get(url,"""headers={'Authorization': 'token c7abb397c7abb397c7abb397'}""")
if req.status_code == requests.codes.ok:
    req = req.json()  # the response is a JSON
    # req is now a dict with keys: name, encoding, url, size ...
    # and content. But it is encoded with base64.
    content = base64.b64decode(req['content'])
    print(content)
    with open("phifile.txt", 'ab') as out:
        out.write(content)
else:
    print('Content was not found.')