FROM python:3.11

# OpenJDK 설치 (예시로 OpenJDK 17을 설치)
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk fonts-nanum && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# JAVA_HOME 환경 변수 설정
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

# 작업 디렉토리 설정
WORKDIR /app

# Git repository clone
RUN git clone -b main https://github.com/gocolab/co_data_analysis co_data_analysis

WORKDIR /app/co_data_analysis

# RUN pip install --no-cache-dir -r ./requirements.txt
RUN pip install -r ./requirements.txt

RUN rm -rf .git

