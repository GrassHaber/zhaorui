'''
接口测试：
    使用requests中的get、post方法调用接口，检查返回值是否正确
'''
import requests

url = 'http://jy001:8081/futureloan/mvc/api/member/list'
# 发送get请求，不带参数
r = requests.get(url)
# 打印响应，文本格式的
print(r.text)
# 检查结果是否与预期相同
assert r.status_code == 200
assert r.reason == 'OK'
rjson = r.json()
assert rjson['status'] == 1
assert rjson['code'] == '10001'
assert rjson['msg'] == '获取用户列表成功'
print(r.headers) # 打印响应头


#注册接口，参数拼接在URL的后面，?后面加参数，参数之间用&分隔
# url = 'http://jy001:8081/futureloan/mvc/api/member/register?mobilephone=18791740220&pwd=123456&regname=zhaorui'
# r = requests.get(url)
# print(r.text)
# assert r.status_code == 200
# assert r.reason == 'OK'
# print(r.headers)

#注册接口，使用param传参
url = 'http://jy001:8081/futureloan/mvc/api/member/register'
cs = {
    'mobilephone':'18991740220',
    'pwd':'123456',
    'regname':'zhangsan'
}
r = requests.get(url,params=cs)
print(r.text)
rjson = r.json()
assert rjson['status'] == 0
assert rjson['code'] == '20110'
assert rjson['msg'] == '手机号码已被注册'

# 登录接口
url = 'http://jy001:8081/futureloan/mvc/api/member/login?mobilephone=18791740220&pwd=123456'
r = requests.get(url)
print(r.text)
assert r.status_code == 200
assert r.reason == 'OK'
print(r.headers)

url = 'https://tcc.taobao.com/cc/json/mobile_tel_segment.htm'
param = {
    'tel':'18828490110'
}
r = requests.get(url,params=param)
print(r.text)
# assert '陕西移动' in r.text
