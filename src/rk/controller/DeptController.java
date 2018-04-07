package rk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
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


}
