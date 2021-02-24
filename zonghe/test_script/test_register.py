'''
测试注册的脚本
'''

import pytest

from zonghe.baw import Member
from zonghe.caw import DataRead, MySqlOp, Check


@pytest.fixture(params=DataRead.read_yaml(r'test_data\register_fail.yaml'))
def fail_data(request):
    return request.param

@pytest.fixture(params=DataRead.read_yaml(r'test_data\register_pass.yaml'))
def pass_data(request):
    return request.param

@pytest.fixture(params=DataRead.read_yaml(r'test_data\register_repeat.yaml'))
def repeat_data(request):
    return request.param

def test_register_fail(fail_data, baserequest, url):
    '''
    注册失败的脚本
    :return:
    '''
    # 下发请求
    r = Member.register(baserequest, url, fail_data['data'])
    print(r.text)
    # 检查结果与预期结果是否一致
    #assert r.json()['code'] == fail_data['expect']['code']
    #assert r.json()['status'] == fail_data['expect']['status']
    #assert r.json()['msg'] == fail_data['expect']['msg']
    # 重复的代码，出现次数较多的代码，可以封装成方法，进行简化调用
    Check.equal(r.json(), fail_data['expect'], 'code,status,msg')

def test_register_pass(pass_data, baserequest, url, db_info):
    '''
    注册成功
    :return:
    '''
    # 初始化环境
    MySqlOp.delete_user(db_info, pass_data['data']['mobilephone'])
    # 下发请求
    r = Member.register(baserequest, url, pass_data['data'])
    print(r.text)
    # 检查结果与预期结果是否一致
    Check.equal(r.json(), pass_data['expect'], 'code,status,msg')
    # 检查用户在系统中注册成功(1.登录 2.数据库中查看记录 3.系统中的查询接口)
    r = Member.list(baserequest, url)
    assert pass_data['data']['mobilephone'] in r.text
    # 清理环境：删除用户
    MySqlOp.delete_user(db_info, pass_data['data']['mobilephone'])

    # 原则1：测试环境，在执行脚本前是什么状态，执行完脚本后要恢复到之前的状态（清理环境）
    # 原则2：脚本执行依赖的环境，要在脚本中自己构造
    # 脚本的健壮性、稳定性比较高


def test_register_repeat(repeat_data, baserequest, url, db_info):
    # 重复注册测试逻辑
    # 环境准备：下发注册请求
    # 测试步骤：下发注册请求，检查结果，报错重复注册
    # 恢复环境：删除用户
    # 初始化环境
    MySqlOp.delete_user(db_info, repeat_data['data']['mobilephone'])
    Member.register(baserequest, url, repeat_data['data'])
    # 再次下发请求，重复注册
    r = Member.register(baserequest, url, repeat_data['data'])
    print(r.text)
    # 检查结果与预期结果是否一致
    Check.equal(r.json(), repeat_data['expect'], 'code,status,msg')
    # 清理环境：删除用户
    MySqlOp.delete_user(db_info, repeat_data['data']['mobilephone'])