ARG GIT_BRANCH_NAME
ARG APP_DIR_NAME
ARG GIT_URI
ARG CUDA_VERSION
ARG LINUXOS_VERSION

FROM nvidia/cuda:${CUDA_VERSION}-devel-${LINUXOS_VERSION}

RUN apt-get update 

# 작업 디렉토리 설정
WORKDIR /apps

# Clone the Git repository. Here we dynamically specify the repository name using the variable defined earlier.
RUN git clone -b ${GIT_BRANCH_NAME} ${GIT_URI} ${APP_DIR_NAME}

# Changes the working directory to /app/${REPO_NAME}. This uses the variable to dynamically set the directory path.
WORKDIR /apps/${APP_DIR_NAME}/app

# RUN pip install --no-cache-dir -r ./requirements.txt
RUN pip install --no-cache-dir -r ./requirements.txt

RUN rm -rf .git

