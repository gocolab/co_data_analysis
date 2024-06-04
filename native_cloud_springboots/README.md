## co_templates
#### Main package
- 컴퓨터 환경은 M1 chip
- Java 17, minikube,  kubectl
- docker OS는 ubuntu22
- Httpie, grype, Tilt, Octant, Kubeval, Knative
- /apps 폴더에 git clone -b sb-3-main https://github.com/ThomasVitale/cloud-native-spring-in-action

#### CLI with Dockerfile and compose.xml : duration 150.4s
```
# --project-name is docker container name
~$ docker build -t ubuntu-java-minikube .
~$ docker-compose up -d
~$ docker exec -it ubuntu /bin/bash
// ~$ docker-compose --project-name co_templates up -d --build
```
#### connect remote Docker container
- 

#### samples
- 
