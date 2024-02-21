# Specifies the base image from which you are building. Replace '_' with the name and tag of the base image you want to use (e.g., ubuntu:20.04).
FROM _?

# Updates the package lists for the package manager, installs the necessary packages, cleans up the cache to reduce the image size,
# and removes unnecessary files. Replace '_' with the name of the package(s) you want to install (e.g., git).
RUN apt-get update && \
    apt-get install -y _? && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set an environment variable. In this example, we're replacing the placeholder for setting a custom environment variable with a user-defined one.
# Replace '_Path' and '/_?' with the name of the environment variable and its value respectively. For example, 'REPO_PATH /app/co_main'.
ENV _Path /_?

# Sets the working directory inside the container to /app. If the directory does not exist, it will be created.
WORKDIR /app

# Declare a build-time variable for the Git repository name. This allows us to use a variable for the repository name throughout the Dockerfile.
ARG REPO_NAME=co_main

# Clone the Git repository. Here we dynamically specify the repository name using the variable defined earlier.
RUN git clone -b main https://github.com/gocolab/${REPO_NAME} ${REPO_NAME}

# Changes the working directory to /app/${REPO_NAME}. This uses the variable to dynamically set the directory path.
WORKDIR /app/${REPO_NAME}

# Removes the .git directory to reduce the container size.
RUN rm -rf .git
