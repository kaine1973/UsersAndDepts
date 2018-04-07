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

    @RequestMapping("queryAllusers")
    public ModelAndView queryAllUsers(){
        List<User> list =  userService.queryAllUsers();
        return new ModelAndView("forward:/user.jsp").addObject("users",list);
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public MessageModel deleteUser(Integer id){
        return userService.deleteUser(id)?new MessageModel():new MessageModel(300,"删除失败");
    }

    @RequestMapping("updateUser")
    @ResponseBody
    public MessageModel updateUser(User user){
        return userService.updateUser(user)?new MessageModel():new MessageModel(300,"修改失败");
    }
    @RequestMapping("alterUser")
    public ModelAndView alterUser(Integer userId){
        User user = userService.queryUserById(userId);
        List<Dept> depts = deptService.queryAllDepts();
        Map<String, Object> params = new HashMap<>();
        params.put("user",user);
        params.put("depts",depts);
        return new ModelAndView("forward:/alterUser.jsp").addAllObjects(params);
    }

    @RequestMapping("insertUser")
    @ResponseBody
    public MessageModel insertUser(User user){
        return userService.insertUser(user)?new MessageModel():new MessageModel(300,"添加失败");
    }
}
