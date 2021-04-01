from MySQLdb import connect, OperationalError

try:
    # 연결
    db = connect(
        user='webdb',
        password='webdb',
        host='localhost',
        port=3306,
        db='webdb',
        charset='utf8')

    # cursor 생성
    cursor = db.cursor()        # 기본커서

    # SQL 실행
    sql = 'delete from emaillist where email = 'dalengel@gmail.com''
    count = cursor.execute(sql)  # sql실행 성공하면 count =  True(1), 실패하면 False(0)이 된다.

    # commit
    db.commit()         # insert, update, delete 후에는 꼭 commit을 해 줘야 적용이 된다.

    # 자원 정리
    cursor.close()
    db.close()

    # 결과 보기
    print(f'실행결과: {count==1}')

except OperationalError as e:
    print(f'error: {e}')
