
from MySQLdb import connect, OperationalError  # MYSQLdb라는 클래스에서 connect와 OperationalError 함수를 가져옴

try:
    db = connect(               # db는 객체가 저장 되어있는 주소를 나타냄.
        user='webdb',
        password='webdb',
        host='localhost',
        port=3306,
        db='webdb',
        charset='utf8')

    print('ok')

except OperationalError as e:   # 예외처리 (try ~ except 구문)
    print(f'error: {e}')
