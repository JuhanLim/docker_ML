import requests
import json
''' 
도커에서 flask 를 띄운 후 , 
주어진 data 를 띄워진 서버에 보내는 파일.
'''
url = "http://localhost:5001/predict" 

data = {
    "Cylinders": 8,
    "Displacement": 390.0,
    "Horsepower": 190,
    "Weight": 3850,
    "Acceleration": 8.5,
    "ModelYear": 2019,
    "Country": "USA",
}

input_data = json.dumps(data)
headers = {"Content-Type": "application/json"}
resposne = requests.post(url, input_data, headers=headers)
print(resposne.text)