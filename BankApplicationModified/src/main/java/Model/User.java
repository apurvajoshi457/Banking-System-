package Model;

import java.math.BigDecimal;

public class User {
    private String firstName;
    private String middleName;
    private String lastName;
    private String accountNo;
    private String password;
    private BigDecimal balance;

    // Default Constructor
    public User() {
    }

    // Parameterized Constructor
    public User(String firstName, String middleName, String lastName, String accountNo, String password,BigDecimal balance) {
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.accountNo = accountNo;
        this.password = password;
        this.balance=balance;
    }

    // Getters and Setters
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", middleName=" + middleName + ", lastName=" + lastName + ", accountNo="
				+ accountNo + ", password=" + password + ", balance=" + balance + "]";
	}
    
   
    
    
}
