'''
Mock：1.接口测试时，有些场景不容易构造出来，用Mock模拟某个接口的返回值
      2.依赖其他项目的接口，但是该接口尚未开发完成，自己所在项目的接口已开发完成
'''
from unittest import mock

import pytest,requests

# 接口地址：http://www.zhifu.com/pay
# 方法：post
# 参数：{"订单号":1232, "支付金额":123, "支付方式":"余额宝"}
# 返回值：{"code":10001, "msg":"支付成功"}
#        {"code":10002, "msg":"支付失败"}
def zhifu(data):
    r = requests.post('http://www.zhifu.com/pay', data)
    return r.json()


def test_zhifu():
    data = {"订单号":1232, "支付金额":123, "支付方式":"余额宝"}
    zhifu = mock.Mock(return_value={"code":10001, "msg":"支付成功"})
    r = zhifu(data)
    assert r['msg'] == '支付成功'


# 模块名.方法名
# 模块名.类名.方法名
@mock.patch('test_011.zhifu', return_value={"code":10001, "msg":"支付成功"})
def test_zhifu2(aa): # 这里要传一个参数，虽然它不会被用到
    data = {"订单号": 1232, "支付金额": 123, "支付方式": "余额宝"}
    r = zhifu(data)
    assert r['msg'] == '支付成功'