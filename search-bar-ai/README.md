## Steps to run the searchbar flask locally

1. Use pip install the relevant libraries into your python (working for v3.10)

    Navigate to search-bar-ai directory and run this in terminal

        py -m pip3 install -r requirements.txt

    OR 

        py -m pip install -r requirements.txt
        
    If it fails, then install manually with reference to requirements.txt

        py -m pip install [insert module to install here]

2. Run the flask locally using your terminal in the search-bar-ai directory.

        flask run
    


## deployment of flask app to GCP 

1. app.py - the logic of the prediction 

2. requirements.txt - all the requirements for the flask app and the AI model 

3. Dockerfile - reference to the docker image to be used for deployment 

4. db/clean_txns - the small database file to be used for AI model training and prediction

