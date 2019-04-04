package com.kgc.contrlloer.admin;

import com.github.pagehelper.PageInfo;
import com.kgc.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;



/**
 * @Auther: 黄高层
 * @Date: 2019/4/3 10:50
 * @Description:
 */
@Controller
@RequestMapping("/SupermarketController")
public class SupermarketController {
    @Autowired
    private UsersService usersService;
    /**
     * 功能描述:用户登录
     * @return:
     */
    @RequestMapping("/Login")
    public @ResponseBody boolean Login(
            @RequestParam(required = true) String userName,
            @RequestParam(required = true)String pwd,
            HttpServletRequest request){
        if (userName==null||userName.trim().equals("")||pwd==null||pwd.trim().equals("")){
            return false;
        }
        List<Map<String, Object>> user = usersService.findUserByNameAndPwd(userName, pwd);
        boolean flag = user.size()==1;
        if (flag){
            request.getSession().setAttribute("userName",userName);
            request.getSession().setAttribute("userId",user.get(0).get("id"));
            return true;
        }
        return false;
    }
    /**
     * 功能描述:  安全退出
     * @return:
     */
    @RequestMapping("/exit")
    public String exit(HttpServletRequest request, HttpServletResponse response){
        request.getSession().removeAttribute("userName");
        return "redirect:/index.jsp";
    }
    /**
     * 功能描述:  获取商品列表
     * @return:
     */
    @RequestMapping("/getProductList")
    public @ResponseBody List<Map<String,Object>> getProductList(){
      return   usersService.findProductList();
    }
   /**
    * 功能描述:  添加销售信息并跟新库存
    * @return:
    */
    @RequestMapping("/addSale")
    public @ResponseBody boolean addSale(float price,Integer quantity,Integer userId,Integer productId){
        if (usersService.saveSale(price,quantity,userId,productId)){
            return true;
        }else return false;
    }
    /**
     * 功能描述:  查询所有销售信息列表分页展示
     * @return:
     */
    @RequestMapping("/getSaleList")
   public String getSaleList(
            @RequestParam(defaultValue = "0") String tj,
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "5") Integer pageSize,
            Model model){
        List<Map<String, Object>> saleList = usersService.findSaleList(tj, pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(saleList);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("tj",tj);
        return "/pages/admin/saleList.jsp";
    }
    @RequestMapping("/getProductById")
    public @ResponseBody  Map<String,Object> getProductById(Integer id){
        return usersService.findProductById(id);
    }

}
