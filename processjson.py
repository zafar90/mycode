import json, sys

args = dict([arg.split('=') for arg in sys.argv[1:]])

jsonFile = open("config.json", "r")
data = json.load(jsonFile)

for key in data.keys():
    if data.get(key) == "" or data.get(key) == "null":
        data[key] = args.get(key)

jsonFile.close()

jsonFile = open("config.json", "w+")
jsonFile.write(json.dumps(data))
jsonFile.close()
