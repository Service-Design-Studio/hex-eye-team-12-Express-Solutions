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
    top_5_index =result_array.argsort()[-1][::-1][:5]
    top_5_index = top_5_index.tolist()
    print(top_5_index)
    output={'top_5_index': top_5_index,
    'top_5_services': table.iloc[top_5_index]['Service'].tolist()} 
    return output

