import requests
# 表单格式的数据：content-type：x-www-form-urlencoded，使用data传参
# 登录接口
url = 'http://jy001:8081/futureloan/mvc/api/member/login'
data = {
    'mobilephone':'18791740220',
    'pwd':'123456'
}
r = requests.post(url,data=data)
print(r.text)
rjson = r.json()
assert rjson['status'] == 1
assert rjson['code'] == '10001'
assert rjson['msg'] == '登录成功'

# json格式的数据：content-type：application/json，使用json传参
# 具体使用data还是json传参，要看接口是怎么定义的
# httpbin.org 是一个测试网站，不管发送什么类型的数据，这个接口将发送的请求，封装成json格式返回
url = 'http://www.httpbin.org/post'
cs = {
    'mobilephone':'18791740220',
    'pwd':'123456'
}
r = requests.post(url,data=cs)
print('data传参===',r.text)
r = requests.post(url,json=cs)
print('json传参===',r.text)

# 租车系统，添加车辆
url = 'http://localhost:8080/carRental/car/addCar.action'
cs = {
        'rentprice': 20000,
        'price': 2000000,
        'isrenting': 0,
        'description': 123,
        'deposit': 200000,
        'color': '黄色',
        'cartype': '轿车',
        'carnumber': '陕A12346',
        'carimg': 'images/defaultcarimage.jpg'
}
head = {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
r = requests.post(url, data=cs, headers=head)
print(r.text)
assert r.json()['code'] == 0
assert r.json()['msg'] == '添加成功'

