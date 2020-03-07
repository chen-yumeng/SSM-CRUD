import com.cg.crud.bean.Employee;
import com.cg.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.UUID;

/**
 * @program: SSM-CRUD->MapperTest
 * @description: 测试Dao层
 * @author: cg
 * @create: 2020-01-02 19:01
 **/
public class MapperTest {

    /**
     * 测试DepartmentMapper
     */
    @Test
    public void testCRUD() {
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        SqlSession sqlSession = ioc.getBean(SqlSession.class);
        //departmentMapper.insertSelective(new Department(null, "开发部"));
        //departmentMapper.insertSelective(new Department(null, "测试部"));

        //employeeMapper.insertSelective(new Employee(null, "jerry", "1", "jerry@cg.com",1));

        //批量插入
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null, uid, "M", uid + "@cg.com", 1));
        }
        System.out.println("完成");

    }
}
