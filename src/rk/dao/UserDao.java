package rk.dao;

import rk.po.User;

import java.util.List;

public interface UserDao {
    public List<User> queryAllUsers();

    public int deleteUserById(Integer id);

    public int updateUserById(User user);

    public User queryUserById(Integer userId);

    public int insertUser(User user);
}
