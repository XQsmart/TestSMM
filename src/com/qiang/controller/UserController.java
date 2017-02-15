package com.qiang.controller;

import com.qiang.bean.User;
import com.qiang.common.bean.ControllerResult;
import com.qiang.common.bean.Pager4EasyUI;
import com.qiang.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Xiao-Qiang on 2017/2/15.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("showUsers")
    public ModelAndView showUsers() {
       return new ModelAndView("users");
    }

    @ResponseBody
    @RequestMapping("queryByPager")
    public Pager4EasyUI<User> queryByPager(int page, int rows, User user) {
        Pager4EasyUI<User> pager = new Pager4EasyUI<User>();
        pager.setPageNo(page);
        pager.setPageSize(rows);
        User u = user;
        pager = userService.queryByPagerAndCriteria(pager, u);
        List<User> users = pager.getRows();
        return pager;
    }

    @ResponseBody
    @RequestMapping("add")
    public ControllerResult add(User user) {
        userService.add(user);
        ControllerResult result = ControllerResult.setSuccessResult("添加成功！");
        return result;
    }

    @ResponseBody
    @RequestMapping("update")
    public ControllerResult update(User user) {
        userService.update(user);
        ControllerResult result = ControllerResult.setSuccessResult("修改成功！");
        return result;
    }

    @ResponseBody
    @RequestMapping("delete")
    public ControllerResult delete(int id) {
        userService.deleteById(id);
        ControllerResult result = ControllerResult.setSuccessResult("删除成功!");
        return result;
    }

}
