package rk.controller;

import jdk.nashorn.internal.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import rk.model.MessageModel;
import rk.po.Dept;
import rk.po.User;
import rk.service.DeptService;
import rk.service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private DeptService deptService;

    //查看
    @RequestMapping("queryAllusers")
    public ModelAndView queryAllUsers(){
        List<Dept> depts = deptService.queryAllDepts();
        List<User> list =  userService.queryAllUsers();
        Map<String,Object> params = new HashMap<>();
        params.put("depts",depts);
        params.put("users",list);
        return new ModelAndView("forward:/user.jsp").addAllObjects(params);
    }

    //删除
    @RequestMapping("deleteUser")
    @ResponseBody
    public MessageModel deleteUser(Integer userId){
        return userService.deleteUser(userId)?new MessageModel():new MessageModel(300,"删除失败");
    }

    //更新
    @RequestMapping("showUpdateUser")
    public ModelAndView showUpdateUser(Integer userId){
        User user = userService.queryUserById(userId);
        List<Dept> depts = deptService.queryAllDepts();
        Map<String, Object> params = new HashMap<>();
        params.put("user",user);
        params.put("depts",depts);
        return new ModelAndView("forward:/alterUser.jsp").addAllObjects(params);
    }
    @RequestMapping("updateUser")
    public ModelAndView updateUser(User user){
        MessageModel mm = userService.updateUser(user)?new MessageModel():new MessageModel(300,"修改失败");
        return new ModelAndView("forward:/message.jsp").addObject("mm",mm);
    }

    //添加
    @RequestMapping("showInsertUser")
    public ModelAndView showInsertUser(Integer userId){
        List<Dept> depts = deptService.queryAllDepts();
        return new ModelAndView("forward:/alterUser.jsp").addObject("depts",depts);
    }

    @RequestMapping("insertUser")
    public ModelAndView insertUser(User user){
        MessageModel mm =  userService.insertUser(user)?new MessageModel():new MessageModel(300,"添加失败");
        return new ModelAndView("forward:/message.jsp").addObject("mm",mm);
    }
}
