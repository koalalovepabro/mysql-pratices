# from emaillistapp.model import findall
from emaillistapp import model


def run_list():
    results = model.findall()
    for index, result in enumerate(results):  # 인덱스를 0부터 자동으로 생성시켜주는 함수
        print(f'{index+1}:{result["first_name"]}{result["last_name"]}:{result["email"]}')  # 1.둘리:dooly@gmail.com


def run_add():
    firstname = input('first name: ')
    lastname = input('last name: ')
    email = input('email: ')

    # if len(firstname) > 2:
    #     print('first name 입력값을 확인 해주세요.')

    model.insert(firstname, lastname, email)

    run_list()  # insert 완료 후, 그 결과값을 다시 보여주기 위해 run_list함수 호출


def run_delete():
    email = input('email: ')

    model.deletebyemail(email)

    run_list()


def main():
    while True:
        cmd = input(f'(l)list, (a)dd, (d)elete, (q)uit > ')

        if cmd == 'q' :
            break
        elif cmd == 'l' :
            run_list()
        elif cmd == 'a':
            run_add()
        elif cmd == 'd':
            run_delete()
        else :
            print('알 수 없는 메뉴입니다.')


if __name__ =='__main__':  # __name__ == '__main__' and main()과 같은 코드임 (and 조건)
    main()