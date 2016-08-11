package pagination.service;

import java.util.ArrayList;

import pagination.entity.User;
import pagination.util.Paging;
import pagination.util.UserFilter;	
	
public interface UserService {
	
	/***
	 * Get all users with filtering and pagination.
	 * Return ArrayList of users
	 * 
	 * @param filter
	 * @param paging
	 * @return
	 */
	public ArrayList<User> findAll(UserFilter filter, Paging paging);
	
	public ArrayList<User> findAll(Paging paging);
	
	
}
