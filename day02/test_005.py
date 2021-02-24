'''
fixture 类级别的
'''
import pytest


@pytest.fixture(scope='class')
def db():
    print('前置：连接数据库')
    yield
    print('后置：断开数据库')


@pytest.fixture(scope='class')
def login():
    print('前置：在首次调用login的地方执行')
    yield
    print('后置：模块所有用例执行完执行')


class TestRegister:
    def test_001(self):
        print('注册用例1')

    def test_002(self, db):  # 类里面，首次调用db的地方执行前置
        print('注册用例2')

    def test_003(self):
        print('注册用例3')

    def test_004(self):  # 类里面所有用例执行完，执行后置
        print('注册用例4')


class TestLogin:
    def test_001(self, login):
        print('登录用例1')

    def test_002(self, db, login):
        print('登录用例2')

    def test_003(self):
        print('登录用例3')
