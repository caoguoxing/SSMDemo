package com.kkb.service;

import com.kkb.dao.UserMapper;
import com.kkb.pojo.User;
import com.kkb.pojo.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    public UserMapper userMapper;


    /**
     *
     * @param username
     * @param password
     * @return 0:登录失败；1：管理员；2：学生
     */
    public int userLogin(String username,String password){

        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        criteria.andPasswordEqualTo(password);

        List<User> users = userMapper.selectByExample(userExample);

        if (users.size() > 0 ){
            //判断是否为管理员
            if(username.equals("admin")){
                return 1;
            }else {
                return 2;
            }
        }
        return 0;



    }

    public User getUserByName(String username) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(username);

        List<User> users = userMapper.selectByExample(userExample);

        if (users.size() > 0 ){
            return users.get(0);
        }
        return null;

    }
}
