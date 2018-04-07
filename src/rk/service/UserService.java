package rk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import rk.dao.UserDao;
import rk.model.MessageModel;
import rk.po.User;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public List<User> queryAllUsers() {
        return userDao.queryAllUsers();
    }

    public boolean deleteUser(Integer id) {
        return userDao.deleteUserById(id)==1;
    }

    public Boolean updateUser(User user) {
        return userDao.updateUserById(user)==1;
    }

    public User queryUserById(Integer userId) {
        return userDao.queryUserById(userId);
    }

    public Boolean insertUser(User user) {
        return userDao.insertUser(user)==1;

    }
}
