image: mariadb:11.4.2 사용한 초기 설정 완료 작성

    environment:
      MYSQL_ROOT_PASSWORD: cocolabhub
      MYSQL_DATABASE: cocolabhub
      MYSQL_USER: cocolabhub
      MYSQL_PASSWORD: cocolabhub
    ports:
      - "3306:3306"
