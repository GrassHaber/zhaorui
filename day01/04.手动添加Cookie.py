'''
Cookie 用来识别用户
'''
import requests
# 没有登录时调用，返回跳转到登录页面
url = 'https://www.bagevent.com/account/dashboard'
r = requests.get(url)
print(r.text)

# 发送请求时，带上cookie信息
head = {
'Cookie': '_ga=GA1.2.339193007.1611729444; _gid=GA1.2.1407474854.1611729444; __auc=ecbe37fb177428fb0837d0dcbad; MEIQIA_TRACK_ID=1ndtu3WXoBpSScmFnfSvYYHBwYm; __asc=30dc78b717747dc060cb0919c2a; _gat=1; Hm_lvt_1fc37bec18db735c69ebe77d923b3ab9=1611729444,1611729535,1611732015,1611818338; BAGSESSIONID=2b569aef-21b0-4a18-b2d4-e6b4b77d3d2b; JSESSIONID=4DB663A4B09537C33A613A19990AA8D3; MEIQIA_VISIT_ID=1ngitw0ELNn8zrrDR3vHKtRm1fa; Hm_lpvt_1fc37bec18db735c69ebe77d923b3ab9=1611818358; BAG_EVENT_TOKEN_=02de735f68204d51009e7edda78e58c13a3fcdd1; BAG_EVENT_CK_KEY_="2780487875@qq.com"; BAG_EVENT_CK_TOKEN_=2440f5d17af838308ba4b390db81af38'
}
r = requests.get(url, headers=head)
print(r.text)

'''
缺点：
1.cookie会失效，失效后需要重新获取
2.登录后的每个接口，都需要带着cookie
'''

