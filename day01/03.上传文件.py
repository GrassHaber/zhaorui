import requests

# # 接口路径
# url = 'http://www.httpbin.org/post'
# # 本地存在的文件
# file = 'd:/test.png'
# with open(file, mode='rb') as f:
#     cs = {'filename': (file, f, 'image/png')}
#     r = requests.post(url,files=cs)
#     print(r.text)
# 上传租车图片
url = 'http://localhost:8080/carRental/file/uploadFile.action'
file = 'd:/car.png'
with open(file, mode='rb') as f:
    cs = {'mf': (file, f, 'image/png')}
    r = requests.post(url,files=cs)
    print(r.text)
    rjson = r.json()
    path = rjson['data']['src']
# # 服务器下载图片
# url = 'http://localhost:8080/carRental/file/downloadShowFile.action?path=2021-01-28/202101281429012079535.png_temp'
# requests.get(url)
# 添加车辆
url = 'http://localhost:8080/carRental/car/addCar.action'
cs = {
        'carimg': path,
        'carnumber': '12345',
        'cartype': '跑车',
        'color': '蓝色',
        'deposit': '1234',
        'description': '1234',
        'isrenting': 0,
        'price': '5000000',
        'rentprice': '1234'
}
head = {'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'}
r = requests.post(url, data=cs, headers=head)
print(r.text)