import pytest

from zonghe.baw import Member
from zonghe.caw import DataRead, MySqlOp, Check


# 前置条件，注册的数据
@pytest.fixture(params=DataRead.read_yaml(r'test_data\login_setup.yaml'))
def setup_data(request):
    return request.param

# 登录的测试数据
@pytest.fixture(params=DataRead.read_yaml(r'test_data\login_data.yaml'))
def login_data(request):
    return request.param

# 测试前置与后置，环境准备与清理
@pytest.fixture()
def register(setup_data, baserequest, url, db_info):
    MySqlOp.delete_user(db_info, setup_data['data']['mobilephone'])
    # 注册用户
    Member.register(baserequest, url, setup_data['data'])
    yield
    # 删除注册用户
    MySqlOp.delete_user(db_info, setup_data['data']['mobilephone'])

def test_login(register, login_data, baserequest, url):
    # 下发登录的请求
    r = Member.login(baserequest, url, login_data['data'])
    # 检查结果
    Check.equal(r.json(), login_data['expect'], 'code,status,msg')

