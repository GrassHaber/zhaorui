import pytest

from zonghe.baw import Member
from zonghe.caw import DataRead, MySqlOp, Check


@pytest.fixture(params=DataRead.read_yaml(r'test_data\recharge.yaml'))
def recharge_data(request):
    return request.param

def test_recharge(recharge_data, baserequest, url, db_info):
    # 初始化环境
    MySqlOp.delete_user(db_info, recharge_data['regdata']['mobilephone'])
    # 注册用户
    Member.register(baserequest, url, recharge_data['regdata'])
    # 用户登录
    Member.login(baserequest, url, recharge_data['logindata'])
    # 充值
    r = Member.recharge(baserequest, url, recharge_data['recdata'])
    # 检查结果
    Check.equal(r.json(), recharge_data['expect'], 'code,status,msg')
    # 清理环境
    MySqlOp.delete_user(db_info, recharge_data['regdata']['mobilephone'])
