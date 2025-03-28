package Dao;

import java.math.BigDecimal;
import java.util.List;

import Model.User;

public interface UserDao {
	int createRecord(List<User> lst);
	int deleterecord(String accno);
	int updateRecord(BigDecimal new_bal, String accno);
	List<User> retriveRecord(String accno);
	List<User> displayAll();
	int sendtoaccno(String accno1,BigDecimal amt,String accno2);
	int recharge(String accno,BigDecimal bal);
	
}
