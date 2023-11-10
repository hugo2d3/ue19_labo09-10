import requests
import json


def main():
    r = requests.get("https://punapi.rest/api/pun")
    dico = json.loads(r.text)
    print(dico['pun'])


if __name__ == '__main__':
    main()
