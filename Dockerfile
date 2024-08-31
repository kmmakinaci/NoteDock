# Use an official Ubuntu as a parent image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    vim \
    nano \
    git \
    plantuml \
    graphviz \
    curl \
    wget \
    gnupg \
    imagemagick \
    && apt-get clean

# Create a directory for the notebook files
RUN mkdir /notebook
WORKDIR /notebook

# Initialize git repository
RUN git init

# Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/

# Make it executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set entrypoint to start the script
ENTRYPOINT ["entrypoint.sh"]
