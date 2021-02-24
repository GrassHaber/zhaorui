import pytest, requests


cs = [
    # 注册成功
    {'data': {'mobilephone': 18791740219, 'pwd': 123456},
     'expect': {'status': 1, 'code': '10001', 'msg': '注册成功'}},
    # 密码长度不足6位
    {'data': {'mobilephone': 18791740220, 'pwd': 12345},
     'expect': {'status': 0, 'code': '20108', 'msg': '密码长度必须为6~18'}},
    # 密码长度超过18位
    {'data': {'mobilephone': 18791740220, 'pwd': 123453532262477858458483},
     'expect': {'status': 0, 'code': '20108', 'msg': '密码长度必须为6~18'}},
    # 密码为空
    {'data': {'mobilephone': 18791740290, 'pwd': ''},
     'expect': {'status': 0, 'code': '20103', 'msg': '密码不能为空'}},
    # 手机号已被注册
    {'data': {'mobilephone': 18791740290, 'pwd': 123456},
     'expect': {'status': 0, 'code': '20110', 'msg': '手机号码已被注册'}},
    # 手机号码格式不正确
    {'data': {'mobilephone': 1879174, 'pwd': 123456},
     'expect': {'status': 0, 'code': '20109', 'msg': '手机号码格式不正确'}}
]


@pytest.fixture(params=cs)
def register_data(request):
    return request.param


def register(data):
    url = 'http://jy001:8081/futureloan/mvc/api/member/register'
    r = requests.post(url, data=data)
    return r

# 数据驱动的测试模型
# test_register 测试脚本/测试逻辑，测试数据与测试逻辑分离，相同逻辑的数据放在一起，实现一个脚本即可
# 数据可以放到csv、yaml、xml...等中去维护
def test_register(register_data):
    print(f'测试数据：{register_data["data"]}')
    print(f'预期结果：{register_data["expect"]}')
    r = register(register_data['data'])
    print(f'实际结果：{r.text}')
    assert r.json()['status'] == register_data['expect']['status']
    assert r.json()['code'] == register_data['expect']['code']
    assert r.json()['msg'] == register_data['expect']['msg']


