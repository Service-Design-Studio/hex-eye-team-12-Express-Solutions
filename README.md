# DBS Express Solutions

DBS Express Solutions (hereinafter ES) is a smart catalog of DBS banking services. It is a customer facing solution that reduces branch visits and integrates into the existing DBS website and deep links customers into iBanking services.

ES is the result of 4 month collaboration between Team HEX-EYE from SUTD, DBS Bank and Google as part of Service Design Studio 2022.

The members of the team are:
* [Joshua Ng](https://github.com/brutatoasta)
* [Jowie Ng]()
* [Lai Pin Nean (Jeff)]()
* [Raymond]()
* [Subesh Kumar]()
* [Yeo Ke Wei]()

## Table of Contents
* [Problem Description](#problem-description)
* [Features](#features)
* [Installation and Deployment](#installation-and-deployment)
* [License](#license)
* [Links](#links)
* [Technologies](#technologies)

## Problem Description

With over 100+ Digital banking services on mutliple platforms, DBS has embraced the digital transformation. However, DBS customers may not be **aware** of such changes and continue to make their journey to the Branch to have their needs met. This results in longer waiting times and an unpleasant customer experience. How can we help to **boost the awareness** of digital services to reduce the branch visit numbers?

## Features

* Display & Navigation for all Banking Services
* Dynamic Top Services Options (based on time & branch)
* Digital / Branch service options with Time-estimate for completion
* Pre-filled SMS for branch Queue number
* AI-powered Service Searchbar


## Installation and Deployment
Please read this section in full before attempting any development or deployment.

### Step 1: Setup your development environment
ES was developed on Windows and Mac, and deployed in a Docker container with a UNIX image. For a smooth deployment, clone the repository on a UNIX system or use the gcloud shell in Google Cloud Console, so that the EOL line endings are translated from CRLF to LF hassle-free.

### Step 1.1: Ruby and Python installation
ES is written in Ruby and Python, so ensure you have `Ruby 2.7.6` and a recent Python version such as `Python 3.8` installed. Optionally, if you have multiple Ruby installations, you can use a Ruby versioning program such as RVM. 

### Step 1.2: RVM installation for Ubuntu (optional)
Follow the steps in the official [documentation](https://rvm.io/rvm/install), which is also mirrored [here](guides/RVMSetup.md).

### Step 1.3 Gem installation
Next, clone this repository and run the following command in the root directory to install the required Ruby gems specified in the `Gemfile`. Then. change directory to `/search-bar-ai` and install the python dependencies from requirements.txt

    bundle install
    cd search-bar-ai
    python -m pip install -r requirements.txt

### Step 1.4: Docker Installation
ES is hosted in a Docker container on Google Cloud Platform, but before the final cloud deployment, you should always build and run the docker file locally. Here is a brief [guide](guides/DockerSetup.md), mirrored from the official Docker documentation.

### Step 1.5: Database Migration

ES is powered by Ruby on Rails and uses ActiveRecord Database. To migrate and seed the database using the relevant CSV files, run the following command:

    bundle exec rails db:drop:_unsafe db:create db:migrate db:seed db:test:prepare
For security purposes, this repository has been sanitised of sensitive information and relevant CSV files. Repopulate using the following [guide](guides/DBSetup.md).

### Step 2: Running the testing suite
ES was developed using Behavior Driven Development. User stories were written into Cucumber features and scenarios in `/features`. Testing was automated with Capybara and Selenium. 

Ensure you start the flask server that powers the searchbar before testing by running:

    cd search-bar-ai
    flask run
More info [here](guides/FlaskSetup.md).

To run all the feature files, use the following command:

    bundle exec cucumber
To run an individual feature file (e.g. sms.feature), use the following command:

    bundle exec cucumber features/sms.feature

To test the searchbar and time estimate features which rely on AJAX, use `selenium_chrome` driver defined in `/features/support.env` and add `@javascript` tag to the top of each feature that requires it. More info at the [JS testing guide](guides/testingJSguide.md).


### Step 3: Deployment to a Docker Container

Before buidling your docker container, you may need to clean the files especially if you are working on windows.
* Comment out or remove any `.exe` substrings in code
* Comment out `tzinfo` gem in the `Gemfile` and rerun `bundle install`
* Ensure all code are using LF line endings instead of CRLF. There are various ways to handle this such as `dos2unix` and [editing .gitattributes](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings#example), but the fastest way is to clone the repository onto a UNIX system.

Build your docker container from the Dockerfile. If necessary on a UNIX system, use sudo. Use the `-t` flag to name the image for easy reference.

    docker build -t [image name] .

Run the container. Use `-p` or `--publish` to link the container ports to the host system's ports. Use `--name` to name the container to kill the container easily. Use `--rm` to remove the container after killing it.

    docker run --name [container name] --publish 8080:8080 --rm [image name]


### Step 4: Deployment to cloud

For ease of deployment, environment variables for google cloud run are defined in `.env` and `cloudbuild.yaml`. Follow this [guide](https://cloud.google.com/ruby/rails/run) from the Google Cloud team to setup the Google Cloud project.

## Technologies
* CSS
* Docker
* Flask
* Google Cloud
* HTML
* JavaScript
* Python
* SQLite
* Ruby on Rails

## License


## Links
Useful code snippets compuled in [Code Bible](guides/codebible.md)

[Google Site](https://sites.google.com/mymail.sutd.edu.sg/hex-eye/home)

[Guides](/guides)

Others:

* Ruby version - 2.7.6-1
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...

