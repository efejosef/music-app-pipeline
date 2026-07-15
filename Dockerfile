# Use a lightweight Linux base image
FROM alpine:latest
# Copy the distribution files created in Step 5 into the container
COPY dist/app /app
# Keep the container running or specify a startup command
CMD ["echo", "Music App Container Active"]
