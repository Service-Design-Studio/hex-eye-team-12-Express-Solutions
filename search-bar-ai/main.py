from flask import Flask, request, jsonify
from flask_cors import CORS
from model import search
import time

app = Flask(__name__)
CORS(app)

@app.route('/')
def index():
    return "Hexeye Search:D!"

@app.route('/predict', methods=['GET'])
def predict():
    start = time.time()
    args = request.args
    print("arg")
    # data = request.get_json() 
    print(args.items())
    query = args['query']
    print(query)
    top_result= search(query)
    print(time.time() - start)
    return top_result