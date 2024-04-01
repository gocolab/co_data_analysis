import pymysql

# 데이터베이스 연결 설정
conn = pymysql.connect(
    host='mysql',  # 컨테이너 이름 또는 IP
    user='cocolabhub',
    password='cocolabhub',
    db='python_mysql',  # 데이터베이스 이름
    charset='utf8mb4'
)

try:
    with conn.cursor() as cursor:
        # Create
        sql = "INSERT INTO TableName (column1, column2) VALUES (%s, %s)"
        cursor.execute(sql, ('value1', 'value2'))
        conn.commit()

        # Read
        sql = "SELECT * FROM TableName"
        cursor.execute(sql)
        data = cursor.fetchall()
        for row in data:
            print(row)  # 각 행 출력

        # Update
        sql = "UPDATE TableName SET column1=%s WHERE id=%s"
        cursor.execute(sql, ('newvalue1', 1))
        conn.commit()

        # Delete
        sql = "DELETE FROM TableName WHERE id=%s"
        cursor.execute(sql, (2,))
        conn.commit()

finally:
    conn.close()
