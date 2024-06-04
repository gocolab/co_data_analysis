# Dockerfile
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg apt-transport-https ca-certificates software-properties-common

# Install Docker (with ARM architecture support)
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=arm64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Java 17
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk

# Install Minikube (ARM architecture)
RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm64 && \
    chmod +x minikube && \
    mv minikube /usr/local/bin/

# Install kubectl (ARM architecture)
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Install Httpie
RUN apt-get update && \
    apt-get install -y httpie

# Install Grype
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin

# Install Tilt
RUN curl -fsSL https://github.com/tilt-dev/tilt/releases/download/v0.29.0/tilt.0.29.0.linux.arm64.tar.gz | tar -xzv tilt && \
    mv tilt /usr/local/bin/

# Install Octant
RUN curl -Lo octant.deb https://github.com/vmware-tanzu/octant/releases/download/v0.24.0/octant_0.24.0_Linux-ARM64.deb && \
    apt-get update && \
    apt-get install -y ./octant.deb && \
    rm octant.deb

# Install Kubeval
RUN curl -Lo kubeval https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-arm64 && \
    chmod +x kubeval && \
    mv kubeval /usr/local/bin/

# Install Knative CLI (kn)
RUN curl -L https://github.com/knative/client/releases/download/knative-v1.11.0/kn-linux-arm64 -o /usr/local/bin/kn && \
    chmod +x /usr/local/bin/kn

# Clone the specific branch of the repository
RUN apt-get update && \
    apt-get install -y git && \
    mkdir -p /apps && \
    git clone -b sb-3-main https://github.com/ThomasVitale/cloud-native-spring-in-action /apps/cloud-native-spring-in-action

# Set the working directory
WORKDIR /apps

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-arm64
ENV PATH=$JAVA_HOME/bin:$PATH

# Copy docker client configuration to the container (optional)
# COPY ~/.docker /root/.docker

# Expose Docker and Minikube daemon ports (if necessary)
EXPOSE 2375 8443

# Default command to run
CMD ["bash"]
