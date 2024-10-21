# Base image with Python 3.11 (compatible with most Linux-based OS)
FROM python:3.11-slim-bullseye

# Update package manager and install necessary dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-nanum wget unzip curl git gnupg && \
    rm -rf /var/lib/apt/lists/*

# Install Chrome and dependencies
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y --no-install-recommends \
    google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# Ensure compatibility with multiple CPU architectures (amd64, arm64)
RUN ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "arm64" ]; then \
        apt-get install -y --no-install-recommends chromium-browser; \
    fi

# Install any other needed dependencies for Selenium and browser automation
RUN pip install --no-cache-dir selenium

# Set working directory for the application
WORKDIR /apps

# Git arguments for dynamic repository cloning
ARG GIT_BRANCH_NAME
ARG APP_DIR_NAME
ARG GIT_URI

# Clone Git repository into a dynamic directory
RUN git clone -b ${GIT_BRANCH_NAME} ${GIT_URI} ${APP_DIR_NAME}

# Change to the application directory
WORKDIR /apps/${APP_DIR_NAME}

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r ./requirements.txt

# Clean up unnecessary files
RUN rm -rf /var/lib/apt/lists/* && rm -rf .git

# Set an entrypoint (if needed) for running tests or application scripts
CMD ["python", "your_main_script.py"]
