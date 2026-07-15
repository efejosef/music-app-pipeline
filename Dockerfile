# Use an official, lightweight Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the distribution files created in the Build stage into the container
COPY dist/app /app

# The command that runs when the container starts up
CMD ["python3", "-c", "print('Music App Container Active and Running Python!')"]
