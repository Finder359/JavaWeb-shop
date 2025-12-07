package com.shop.dao;

import com.shop.entity.FrontUser;

public interface FrontUserDao {

    /**
     * 用户登录
     * @param username 用户名
     * @param password 密码
     * @return 用户对象，登录失败返回null
     */
    FrontUser login(String username, String password);

    /**
     * 用户注册
     * @param user 用户对象
     * @return 影响的行数
     */
    int register(FrontUser user);

    /**
     * 根据用户名查询用户
     * @param username 用户名
     * @return 用户对象
     */
    FrontUser findByUsername(String username);

    /**
     * 根据ID查询用户
     * @param id 用户ID
     * @return 用户对象
     */
    FrontUser findById(Integer id);

    /**
     * 更新用户信息
     * @param user 用户对象
     * @return 影响的行数
     */
    int update(FrontUser user);
}