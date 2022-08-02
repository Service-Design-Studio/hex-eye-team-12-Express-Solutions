from flask import Flask, request, jsonify
from flask_cors import CORS #comment out for deployment
import time
import os
import pandas as pd 
from sentence_transformers import SentenceTransformer, util
model_encoder = SentenceTransformer('all-MiniLM-L6-v2')
table = pd.read_csv('db/clean_txn.csv')
model = SentenceTransformer('multi-qa-MiniLM-L6-cos-v1')
desc = table['Service']+ ' '+ table['Service']+ ' '+ table['Details']

app = Flask(__name__)
CORS(app) #comment out for deployment

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



        
def search(query): 
    query = query.lower()
    query_embedding = model.encode(query)
    passage_embedding = model.encode(desc)
    result = util.dot_score(query_embedding, passage_embedding)
    order_result = result.sort()
    top_5_index = order_result[1].tolist()[0][::-1]
    top_5_result = order_result[0].tolist()[0][::-1]
    print(top_5_index)
    print(top_5_result)
    for i in range(len(top_5_result)):
        # print(top_5_index[i])
        print(top_5_result[i])
        if top_5_result[i] <0.2:
            top_5_result = top_5_result[0:i]
            break
            
    top_5_index= top_5_index[0:len(top_5_result)]
    print(top_5_result)
    # top_5_index =result_array.argsort()[-1][::-1][:5]
    # top_5_index = top_5_index.tolist()
    print(top_5_index)
    output={'top_5_index': top_5_index,
    'top_5_services': table.iloc[top_5_index]['Service'].tolist()} 
    return output



if __name__ == "__main__": 
    app.run(port=int(os.environ.get("PORT", 8080)),host='0.0.0.0',debug=True)