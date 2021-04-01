
from MySQLdb import connect, OperationalError  # MYSQLdb라는 클래스에서 connect와 OperationalError 함수를 가져옴
from MySQLdb.cursors import DictCursor

try:
    # 연결
    db = connect(               # db는 객체가 저장 되어있는 주소를 나타냄.
        user='webdb',
        password='webdb',
        host='localhost',
        port=3306,
        db='webdb',
        charset='utf8')

    # cursor 생성
    cursor = db.cursor(DictCursor) # db를 보고 결과를 딕셔너리로 줘라. [{'칼럼이름' : '값'}, {'칼럼이름' : '값'}]

    # SQL 실행
    sql = 'select no, first_name, last_name, email from emaillist order by no desc'  # 이 쿼리를 날리겠다 !
    cursor.execute(sql)  # 위에서 알려준 sql 쿼리문으로 실행시켜라

    # 결과 받아오기
    results = cursor.fetchall()

    # 자원 정리
    cursor.close()
    db.close()

    # 결과 보기
    for result in results:
        print(result)       # print(result['no']) 라고 하면 no칼럽에 있는 값만 출력됨 (딕셔너리 데이터니까)

except OperationalError as e:   # 예외처리 (try ~ except 구문)
    print(f'error: {e}')
