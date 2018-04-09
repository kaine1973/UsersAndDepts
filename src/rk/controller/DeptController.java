package rk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import rk.model.MessageModel;
import rk.po.Dept;
import rk.service.DeptService;

import java.util.List;

@Controller
@RequestMapping("dept")
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping("queryAllDepts")
    public ModelAndView queryAllDept(){
        List<Dept> list = deptService.queryAllDepts();
        return new ModelAndView("forward:/dept.jsp").addObject("depts",list);
    }

    @RequestMapping("deleteDept")
    @ResponseBody
    public MessageModel deleteDept(Integer deptId){
        return deptService.deleteDeptById(deptId)?new MessageModel():new MessageModel(300,"删除失败");
    }
    @RequestMapping("showUpdateDept")
    public ModelAndView showUpdateDept(int deptId){
        Dept dept = deptService.queryDeptById(deptId);
        return new ModelAndView("forward:/alterDept.jsp").addObject("dept",dept);
    }
    @RequestMapping("updateDept")
    public ModelAndView updateDept(Dept dept){
        MessageModel mm =  deptService.updateDept(dept)?new MessageModel():new MessageModel(300,"更新失败");
        return new ModelAndView("forward:/message.jsp").addObject("mm",mm);
    }

    @RequestMapping("showInsertDept")
    public ModelAndView showInsertDept(){
        return new ModelAndView("forward:/alterDept.jsp");
    }

    @RequestMapping("insertDept")
    public ModelAndView insertDept(Dept dept){
        MessageModel mm = deptService.insertDept(dept)?new MessageModel():new MessageModel(300,"添加失败");
        return new ModelAndView("forward:/message.jsp").addObject("mm",mm);
    }

}
