FROM python:3.11

# 작업 디렉토리 설정
WORKDIR /app

# Git repository clone
RUN git clone https://github.com/gocolab/co_data_analysis

WORKDIR /app/co_data_analysis

RUN rm -rf .git

RUN pip install -r ./requirements.txt

