from unittest import mock
import requests, pytest

cs = {
        # 注册成功
        {'data': {'mobilephone': '18791740218', 'pwd': '123456'},
         'expect': {'status': 1, 'code': '10001', 'msg': '注册成功'}}
}

@pytest.fixture(params=cs)
def register_data(request):
    return request.param


def register(data):
    url = 'http://jy001:8081/futureloan/mvc/api/member/register'
    r = requests.post(url, data=data)
    return r.json()


def login():
    url = 'http://jy001:8081/futureloan/mvc/api/member/login'
    r = requests.get(url, params=cs['data'])
    return r.json()


def chongzhi():
    url = 'http://jy001:8081/futureloan/mvc/api/member/recharge'
    param = {'mobilephone': '18791740218', 'amount':100000.0}
    r = requests.get(url, params=param)
    return r.json()

def quxian(data):
    r = requests.post('http://jy001:8081/futureloan/mvc/api/member//withdraw', data)
    return r.json()

def test_register(register_data):
    r = register(register_data['data'])
    assert r['status'] == register_data['expect']['status']
    assert r['code'] == register_data['expect']['code']
    assert r['msg'] == register_data['expect']['msg']

def test_login():
    pass

@mock.patch('test_012.quxian', return_value={"code":10001, "msg":"取现成功"})
def test_quxian(aa):
    data = {'mobilephone':'18791740218', 'amount': 50000.0}
    r = quxian(data)
    assert r['msg'] == '取现成功'


