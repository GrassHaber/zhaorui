'''
pytest命名约束：
1.文件用test_开头
2.类用Test开头
3.函数或方法用test_开头
'''
import requests

def test_login_001():
    url = 'http://jy001:8081/futureloan/mvc/api/member/login?mobilephone=18791740220&pwd=123456'
    r = requests.get(url)
    assert r.status_code == 200
    assert r.reason == 'OK'
    print('登录成功的脚本')

# def test_register_001():
#     url = 'http://jy001:8081/futureloan/mvc/api/member/register'
#     cs = {
#         'mobilephone': '18991740223',
#         'pwd': '123456',
#         'regname': 'zhangsi'
#     }
#     r = requests.get(url, params=cs)
#     print(r.text)
#     rjson = r.json()
#     assert rjson['status'] == 1
#     assert rjson['code'] == '10001'
#     assert rjson['msg'] == '注册成功'
#     print('注册成功的脚本')

def test_register_002():
    url = 'http://jy001:8081/futureloan/mvc/api/member/register'
    cs = {
        'mobilephone': '18991740220',
        'pwd': '123456',
        'regname': 'zhangsan'
    }
    r = requests.get(url, params=cs)
    rjson = r.json()
    assert rjson['status'] == 0
    assert rjson['code'] == '20110'
    assert rjson['msg'] == '手机号码已被注册'
    print('手机号码已被注册')

def test_register_003():
    url = 'http://jy001:8081/futureloan/mvc/api/member/register'
    cs = {
        'mobilephone': '18991740224',
        'pwd': '12345',
        'regname': 'zhangsan'
    }
    r = requests.get(url, params=cs)
    print(r.text)
    rjson = r.json()
    assert rjson['status'] == 0
    assert rjson['code'] == '20108'
    assert rjson['msg'] == '密码长度必须为6~18'
    print('密码不足6位')

def test_register_004():
    url = 'http://jy001:8081/futureloan/mvc/api/member/register'
    cs = {
        'mobilephone': '1899174022',
        'pwd': '123456',
        'regname': 'zhangsan'
    }
    r = requests.get(url, params=cs)
    print(r.text)
    rjson = r.json()
    assert rjson['status'] == 0
    assert rjson['code'] == '20109'
    assert rjson['msg'] == '手机号码格式不正确'
    print('手机号码格式不正确')