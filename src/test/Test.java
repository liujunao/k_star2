import com.springmvc.dao.K_reDAO;
import com.springmvc.db.JdbcUtils;
import com.springmvc.model.K_re;
import com.springmvc.service.K_reService;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lenovo on 2017/10/6.
 */
public class Test {

    K_reService k_reService = new K_reService();
    JdbcUtils jdbcUtils = new JdbcUtils();

    @org.junit.Test
    public void test(){
//        String sql = "INSERT INTO k_re(k_reNumber,k_reName,k_rePhone)VALUES(?,?,?)";
//        Object[] objects = new Object[3];
//        objects[0] = "23";
//        objects[1] = "23";
//        objects[2] = "23";
        K_re k_re = new K_re();
        k_re.setK_reNumber("23");;
        k_re.setK_reName("23");
        k_re.setK_rePhone("23");
        k_re.setK_reText("23");
        k_re.setK_re_infoId(23);
        k_re.setK_infoName("23");
        k_re.setK_reStatus(2);
        k_re.setK_reTime("23");
        K_reDAO k_reDAO = new K_reDAO();
        System.out.println(k_reService.add(k_re));
    }
    @org.junit.Test
    public void timeTest(){
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String string = simpleDateFormat.format(date);
        System.out.println(simpleDateFormat.format(date));
        System.out.println(simpleDateFormat.format(date).length());
        String ymd = string.substring(0,10);
        String hm = string.substring(11,16);
        System.out.println(ymd);
        System.out.println(hm);
    }
}
