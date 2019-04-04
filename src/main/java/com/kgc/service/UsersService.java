package com.kgc.service;

import java.util.List;
import java.util.Map;

/**
 * @Auther: 黄高层
 * @Date: 2019/4/3 10:59
 * @Description:
 */
public interface UsersService {
    List<Map<String,Object>> findUserByNameAndPwd(String userName,String pwd);
    List<Map<String,Object>> findProductList();
    boolean saveSale(float price, Integer quantity, Integer userId, Integer productId);
    List<Map<String,Object>> findSaleList(String tj,Integer pangNum,Integer pageSize);
    Map<String,Object> findProductById(Integer id);

}
