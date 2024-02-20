# java 사용(Okt 등)하는 package 위해 기본 ubuntu 사용
FROM openjdk:22-ea-11-jdk-slim

RUN apt-get update
RUN apt-get -y install fonts-nanum python3 python3-pip
# RUN fc-cache -fv
# RUN rm ~/.cache/matplotlib -rf

# 작업 디렉토리 설정
WORKDIR /app

# Git repository clone
RUN git clone -b main https://github.com/gocolab/co_data_analysis co_data_analysis

WORKDIR /app/co_data_analysis

RUN pip install -r ./requirements.txt

RUN rm -rf .git

