# Use the official Python image from the Docker Hub
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install langchain

# Copy the local_env.txt file
COPY local_env.txt /app/local_env.txt

# Set environment variables from local_env.txt
RUN set -a && . /app/local_env.txt && set +a

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.py when the container launches
CMD ["python", "app.py"]
