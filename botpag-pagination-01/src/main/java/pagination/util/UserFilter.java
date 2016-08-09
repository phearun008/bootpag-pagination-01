package pagination.util;

/**
 * @author PHEARUN
 * */
public class UserFilter{
	
	private String status;
	private String firstName;
	private String lastName;
	private String roleName;
	private String gender;
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

	@Override
	public String toString() {
		return "UserFilter [status=" + status + ", firstName=" + firstName + ", lastName=" + lastName + ", roleName="
				+ roleName + ", gender=" + gender + "]";
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
}
