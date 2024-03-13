## co_web_scrapings
CLI with Dockerfile and compose.xml : duration 150.4s
#### CLI with Dockerfile and compose.xml : duration 150.4s
```
# --project-name is docker container name
~$ docker-compose --project-name web_scrapings up -d --build
```
#### connect remote Docker container
@ http://localhost:8888/
@ mongodb://localhost:27017/ or mongodb://mongodb:27017/

#### samples
- [samples\sample_mongodb_connection.ipynb](./samples/sample_mongodb_connection.ipynb)
- [samples\sample_selenium.py](./samples/sample_selenium.py)