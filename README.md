### note : selenium 동작은 Chrome Drive 사용해 Docker Container 사용 시 별도 설정 필요
### open port 5500 for live server
#### Main package
- python:3.11
- mongo:7
- selenium
- Chrome Browser

#### connect remote Docker container
- @ mongodb://localhost:27017/ or mongodb://mongodb:27017/

#### samples
- [samples\sample_mongodb_connection.py](./samples/sample_mongodb_connection.py)
- [samples\sample_selenium.py](./samples/sample_selenium.py)
