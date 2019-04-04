package com.kgc.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * @Auther: 黄高层
 * @Date: 2019/4/3 10:56
 * @Description:
 */
public interface UsersMapper {
    /**
     * 功能描述:  通过用户名与密码验证用户是否存在
     * @return:
     */
    @Select("SELECT * FROM `users` WHERE userName=#{arg0} and password=#{arg1}")
    List<Map<String,Object>> selcetUserByNameAndPwd(String userName,String pwd);
    /**
     * 功能描述:  查询所有商品种类
     * @return:
     */
    @Select("SELECT * FROM `product`")
    List<Map<String,Object>> selectProductList();
    /**
     * 功能描述:  添加销售信息并更新商品库存表
     * @return:
     */
    void insertSale(@Param("price") float price, @Param("num")Integer quantity, @Param("totalPrice")float totalPrice, @Param("uId")Integer userId, @Param("pId")Integer productId);
    /**
     * 功能描述:  查询所有销售信息列表根据销售日期降序排列
     * @return:
     */
    @Select("SELECT sale.*,productName,users.realName FROM sale INNER JOIN product ON sale.productId=product.id INNER JOIN users ON sale.userId=users.id ORDER BY saleDate DESC")
    List<Map<String,Object>> selsectSaleListByDate();
    /**
     * 功能描述:  查询所有销售信息列表根据总销售金额降序排列
     * @return:
     */
    @Select("SELECT sale.*,productName,users.realName FROM sale INNER JOIN product ON sale.productId=product.id INNER JOIN users ON sale.userId=users.id ORDER BY totalPrice DESC")
    List<Map<String,Object>> selsectSaleListByTotalPrice();
    @Select(" SELECT * FROM product where id=#{arg0} ")
    /**
     * 功能描述:  通过商品ID查询商品信息
     * @return: java.util.Map<java.lang.String,java.lang.Object>
     */
    Map<String,Object> selectProductById(Integer id);


}
