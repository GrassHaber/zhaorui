'''
requests.session 来保持状态。自动管理过程中产生的cookie，
下次请求时自动带上上一次的cookie
'''

import requests

s = requests.session()
print(s.cookies)
print('登录前的cookies:', requests.utils.dict_from_cookiejar(s.cookies))
# 登录接口
url = 'https://www.bagevent.com/user/login'
cs = {
        'account': '2780487875@qq.com',
        'password': 'qq2780487875',
        'access_type': '1',
        'emailLoginWay': '0',
        'loginType': '1',
        'remindme': '1',
        'remindmeBox': 'on'
}
r = s.post(url, data=cs)
print('登录后的cookies:', requests.utils.dict_from_cookiejar(s.cookies))
# print(r.text)

# dashboard接口
r = s.get('https://www.bagevent.com/account/dashboard')
# print(r.text)
assert '百格活动 - 账户总览' in r.text

# 退出登录接口
url = 'https://www.bagevent.com/user/login_out'
r = s.get(url)
print('退出登录后的cookies:', requests.utils.dict_from_cookiejar(s.cookies))