package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.kgc.mapper.UsersMapper;
import com.kgc.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Map;

/**
 * @Auther: 黄高层
 * @Date: 2019/4/3 10:59
 * @Description:
 */
@Service
public class UsersServiceImpl implements UsersService {
    @Autowired
    private UsersMapper usersMapper;
    @Override
    public List<Map<String,Object>> findUserByNameAndPwd(String userName, String pwd) {
        return usersMapper.selcetUserByNameAndPwd(userName,pwd);
    }

    @Override
    public List<Map<String, Object>> findProductList() {
        return usersMapper.selectProductList();
    }

    @Override
    public boolean saveSale(float price, Integer quantity, Integer userId, Integer productId) {
        float totalPrice =price*quantity;
        try {
            usersMapper.insertSale(price,quantity,totalPrice,userId,productId);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public List<Map<String, Object>> findSaleList(String tj,Integer pangNum,Integer pageSize) {
        PageHelper.startPage(pangNum,pageSize);
        if (tj.equals("0")){
            return  usersMapper.selsectSaleListByDate();
        }else return usersMapper.selsectSaleListByTotalPrice();
    }

    @Override
    public Map<String, Object> findProductById(Integer id) {
        return usersMapper.selectProductById(id);
    }


}
