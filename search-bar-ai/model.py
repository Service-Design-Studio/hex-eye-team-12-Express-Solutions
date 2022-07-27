import pandas as pd 
from sentence_transformers import SentenceTransformer, util
model_encoder = SentenceTransformer('all-MiniLM-L6-v2')
table = pd.read_csv('db/clean_txn.csv')
model = SentenceTransformer('multi-qa-MiniLM-L6-cos-v1')
desc = table['Service']+ ' '+ table['Service']+ ' '+ table['Details']
        
def search(query): 
    query = query.lower()
    query_embedding = model.encode(query)
    passage_embedding = model.encode(desc)
    result = util.dot_score(query_embedding, passage_embedding)
    result_array = result.numpy()
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

