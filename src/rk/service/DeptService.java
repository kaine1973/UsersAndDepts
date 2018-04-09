package rk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import rk.dao.DeptDao;
import rk.po.Dept;

import java.util.List;

@Service
public class DeptService {

    @Autowired
    private DeptDao deptDao;

    public List<Dept> queryAllDepts() {
        return deptDao.queryAllDepts();
    }

    public Dept queryDeptById(Integer deptId) {
        return deptDao.queryDeptById(deptId);
    }

    public boolean deleteDeptById(Integer deptId) {
        return deptDao.deleteDeptById(deptId)==1;
    }

    public boolean updateDept(Dept dept) {
        return deptDao.updateDept(dept) == 1;
    }

    public boolean insertDept(Dept dept) {
        return deptDao.insertDept(dept) == 1;
    }
}
