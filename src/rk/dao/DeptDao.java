package rk.dao;

import rk.po.Dept;

import java.util.List;

public interface DeptDao {
    public List<Dept> queryAllDepts();

    public Dept queryDeptById(Integer deptId);

    public int deleteDeptById(Integer deptId);

    public int updateDept(Dept dept);

    public int insertDept(Dept dept);
}
