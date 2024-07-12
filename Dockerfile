# Use the official Python image from the Docker Hub
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install langchain

# Copy the local_env file and set environment variables from it
COPY local_env /app/local_env
RUN export $(cat /app/local_env | xargs)

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.py when the container launches
CMD ["python", "app.py"]
