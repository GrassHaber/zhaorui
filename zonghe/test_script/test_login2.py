import pytest

from zonghe.baw import Member
from zonghe.caw import DataRead, MySqlOp, Check


@pytest.fixture(params=DataRead.read_yaml(r'test_data\login.yaml'))
def login_data(request):
    return request.param

def test_login(login_data, baserequest, url, db_info):
    #MySqlOp.delete_user(db_info, login_data['regdata']['mobilephone'])
    # 注册用户
    Member.register(baserequest, url, login_data['regdata'])
    # 登录
    r = Member.login(baserequest, url, login_data['logindata'])
    # 检查结果
    Check.equal(r.json(), login_data['expect'], 'code,status,msg')
    # 删除注册用户
    MySqlOp.delete_user(db_info, login_data['regdata']['mobilephone'])

