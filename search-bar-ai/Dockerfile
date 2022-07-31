# # Python image to use.
# FROM python:3.10

# # Set the working directory to /app
# WORKDIR /app

# # copy the requirements file used for dependencies
# COPY requirements.txt .

# # Install any needed packages specified in requirements.txt
# RUN pip install --trusted-host pypi.python.org -r requirements.txt

# # Copy the rest of the working directory contents into the container at /app
# COPY . .

# # Run app.py when the container launches
# ENTRYPOINT ["python", "app.py"]
FROM python:3.9.1

# Install production dependencies.
ADD requirements.txt .
RUN pip install -r requirements.txt

# Copy local code to the container image.
WORKDIR /app
COPY . .

# Service must listen to $PORT environment variable.
# This default value facilitates local development.
ENV PORT 8080

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 app:app