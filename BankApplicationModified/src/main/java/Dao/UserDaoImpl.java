package Dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.User;

public class UserDaoImpl implements UserDao{

	@Override
	public int createRecord(List<User> lst) {
		int i=0;
		Connection con=DBConnection.myConnection();
		User user=lst.get(0);
		try {
			PreparedStatement pstate=con.prepareStatement("insert into bankuser values(?,?,?,?,?,?)");
			pstate.setString(1,user.getFirstName());
			pstate.setString(2, user.getMiddleName());
			pstate.setString(3, user.getLastName());
			pstate.setString(4, user.getAccountNo());
			pstate.setString(5, user.getPassword());
			pstate.setBigDecimal(6, user.getBalance());
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public int deleterecord(String accno) {
		Connection con=DBConnection.myConnection();
		int i=0;
		try {
			PreparedStatement pstate=con.prepareStatement("delete from bankuser where accountno=?");
			pstate.setString(1,accno);
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}

	@Override
	public int updateRecord(BigDecimal new_bal, String accno) {
		Connection con=DBConnection.myConnection();
		int i=0;
		try {
			PreparedStatement pstate = con.prepareStatement("UPDATE bankuser SET balance = ? WHERE accountno = ?");
			pstate.setBigDecimal(1, new_bal);
			pstate.setString(2, accno);
			i = pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return i;
	}

	@Override
	public List<User> retriveRecord(String accno) {
		ResultSet Result;
		User r=null;
		List<User> lst=new ArrayList<User>();
		Connection con=DBConnection.myConnection();
		try {
			PreparedStatement pstate=con.prepareStatement("select * from bankuser where accountno=?");
			pstate.setString(1, accno);
			Result=pstate.executeQuery();
			if(Result.next()) {
				r=new User(Result.getString(1),Result.getString(2),Result.getString(3),Result.getString(4),Result.getString(5),Result.getBigDecimal(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		lst.add(r);
		
		return lst;
	}

	@Override
	public List<User> displayAll() {
		ResultSet Result;
		List<User> lst=new ArrayList<User>();
		Connection con=DBConnection.myConnection();
		
		try {
			PreparedStatement pstate=con.prepareStatement("select * from bankuser");
			Result=pstate.executeQuery();
			while(Result.next()) {
				lst.add(new User(Result.getString(1),Result.getString(2),Result.getString(3),Result.getString(4),Result.getString(5),Result.getBigDecimal(6)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public int sendtoaccno(String accno1, BigDecimal amt, String accno2) {
		Connection con = null;
        PreparedStatement pstate = null;
        PreparedStatement pstate2 = null;
        PreparedStatement pstate3 = null;
        PreparedStatement pstate4 = null;
        ResultSet result = null;
        ResultSet result1 = null;
        int i = 0;

        try {
            con = DBConnection.myConnection();
            con.setAutoCommit(false); // Start transaction

            // Fetch sender's balance
            pstate = con.prepareStatement("SELECT balance FROM bankuser WHERE accountno = ?");
            pstate.setString(1, accno1);
            result = pstate.executeQuery();

            if (result.next()) {
                BigDecimal senderBalance = result.getBigDecimal("balance");

                if (senderBalance.compareTo(amt) >= 0) { // Use compareTo for BigDecimal
                    // Deduct from sender
                    pstate2 = con.prepareStatement("UPDATE bankuser SET balance = ? WHERE accountno = ?");
                    pstate2.setBigDecimal(1, senderBalance.subtract(amt));
                    pstate2.setString(2, accno1);
                    int senderUpdated = pstate2.executeUpdate();

                    if (senderUpdated > 0) {
                        // Fetch receiver's balance
                        pstate3 = con.prepareStatement("SELECT balance FROM bankuser WHERE accountno = ?");
                        pstate3.setString(1, accno2);
                        result1 = pstate3.executeQuery();

                        if (result1.next()) {
                            BigDecimal receiverBalance = result1.getBigDecimal("balance");

                            // Add to receiver
                            pstate4 = con.prepareStatement("UPDATE bankuser SET balance = ? WHERE accountno = ?");
                            pstate4.setBigDecimal(1, receiverBalance.add(amt));
                            pstate4.setString(2, accno2);
                            int receiverUpdated = pstate4.executeUpdate();

                            if (receiverUpdated > 0) {
                                con.commit(); // Commit transaction
                                i = 1; // Success
                            } else {
                                con.rollback(); // Rollback if receiver update fails
                            }
                        } else {
                            con.rollback(); // Rollback if receiver not found
                        }
                    } else {
                        con.rollback(); // Rollback if sender update fails
                    }
                } else {
                    System.out.println("Insufficient balance for transfer");
                }
            } else {
                System.out.println("Sender account not found");
            }
        } catch (SQLException e) {
            try {
                if (con != null) {
                    con.rollback(); // Rollback transaction in case of error
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // Close all resources
            try {
                if (result != null) result.close();
                if (result1 != null) result1.close(); // Fixed incorrect result close
                if (pstate != null) pstate.close();
                if (pstate2 != null) pstate2.close();
                if (pstate3 != null) pstate3.close();
                if (pstate4 != null) pstate4.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return i;
	}

	@Override
	public int recharge(String accno, BigDecimal bal) {
		Connection con = null;
        PreparedStatement pstate = null;
        PreparedStatement pstate2 = null;
        ResultSet result = null;
        int i = 0;

        try {
            con = DBConnection.myConnection();
            con.setAutoCommit(false); // Start transaction

            // Fetch current balance
            pstate = con.prepareStatement("SELECT balance FROM bankuser WHERE accountno = ?");
            pstate.setString(1, accno);
            result = pstate.executeQuery();

            if (result.next()) {
                BigDecimal currentBalance = result.getBigDecimal("balance");
                System.out.println("Current Balance: " + currentBalance + ", Recharge Amount: " + bal);

                BigDecimal newBalance = currentBalance.add(bal); // ADD the recharge amount
                System.out.println("New Balance: " + newBalance);

                // Update the balance
                pstate2 = con.prepareStatement("UPDATE bankuser SET balance = ? WHERE accountno = ?");
                pstate2.setBigDecimal(1, newBalance);
                pstate2.setString(2, accno);

                i = pstate2.executeUpdate();
                if (i > 0) {
                    con.commit(); // Commit transaction if successful
                    System.out.println("Recharge successful! Updated balance: " + newBalance);
                } else {
                    con.rollback(); // Rollback on failure
                    System.out.println("Recharge failed! Rolling back.");
                }
            } else {
                System.out.println("No record found for Account No: " + accno);
            }
        } catch (SQLException e) {
            try {
                if (con != null) {
                    con.rollback(); // Rollback in case of error
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // Close all resources
            try {
                if (result != null) result.close();
                if (pstate != null) pstate.close();
                if (pstate2 != null) pstate2.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return i;
	}

}
