import pytest_check as check

def equal(real, expect, keys):
    '''
    检查两个字典中，key对应的value是否一致
    不推荐直接判等，r.json() == fail_data['expect']
    1.结果中有一些不关键的信息，后面有变化时，会导致脚本执行不通过
    2.结果中有时间戳这类变化的信息，每次校验的结果不同，需要变更数据
    3.结果可能很长，顺序发生变化，不方便维护。比如查询所有用户，数据量巨大
    :param real: 实际结果，字典格式
    :param expect: 预期结果，字典格式
    :param keys: 对比的关键字
    :return:
    '''
    ks = keys.split(',')
    for k in ks:
        r = str(real.get(k))
        e = str(expect.get(k))
        try:
            check.equal(r, e)
            print(f'检验{k}成功')
        except Exception as e:
            print(f'检验{k}失败，异常信息为：{e}')