# 베이스 이미지로 Ubuntu 20.04 사용
FROM ubuntu:20.04

# 비대화형 모드 설정
# ENV DEBIAN_FRONTEND=noninteractive

# 필요한 패키지 업데이트 및 설치
RUN apt-get update && apt-get install -y wget

# OpenJDK 18 다운로드 및 설치
RUN wget https://download.oracle.com/java/18/latest/jdk-18_linux-x64_bin.deb && \
    apt-get install -y ./jdk-18_linux-x64_bin.deb && \
    rm ./jdk-18_linux-x64_bin.deb

# JAVA_HOME 환경 변수 설정 및 PATH에 추가
ENV JAVA_HOME=/usr/lib/jvm/jdk-18
ENV PATH="$JAVA_HOME/bin:$PATH"

WORKDIR /apps

RUN git clone -b main https://github.com/microservices-patterns/ftgo-application
    
# sed 명령어로 Dockerfile의 FROM 명령어를 수정합니다
RUN sed -i 's/FROM python:2.7.16-alpine3.9/FROM python:3-alpine3.11/' ./dynamodblocal-init/Dockerfile

# 기본 명령어 설정 (bash로 접속)
CMD ["bash"]
