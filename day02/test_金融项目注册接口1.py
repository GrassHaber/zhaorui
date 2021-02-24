import pytest, random, requests


# 生成手机号
@pytest.fixture()
def get_phone():
    return str(random.randint(10000000000, 19999999999))


# 生成密码
@pytest.fixture()
def get_pwd():
    return random.randint(100000, 9999999999)


# 生成用户名
@pytest.fixture()
def get_regname():
    return 'rui' + str(random.randint(1, 1000))


# 注册数据
@pytest.fixture()
def get_regdata(get_phone, get_pwd, get_regname):
    return {'mobilephone': get_phone, 'pwd': get_pwd, 'regname': get_regname}


# 测试用例
def test_register(get_regdata):
    url = 'http://jy001:8081/futureloan/mvc/api/member/register'
    r = requests.get(url, params=get_regdata)
    rjson = r.json()
    assert rjson['status'] == 1
    assert rjson['code'] == '10001'
    assert rjson['msg'] == '注册成功'
    print(f'注册功能测试,注册的数据为：{get_regdata}')