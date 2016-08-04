package pagination.restcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import pagination.entity.User;
import pagination.service.UserService;
import pagination.util.Console;
import pagination.util.Paging;
import pagination.util.UserFilter;

@RestController
@RequestMapping("/api")
public class UserController {

	@Autowired
	private UserService userService;
	
	
	/***
	 * Find all users with pagination
	 * 
	 * @param user
	 * @param page
	 * @param limit
	 * @return Array list of user
	 */	

	/**
	 * http://localhost:7777/api/user?status=&gender=&firstName=&lastName=&roleName=&page=1&limit=5 
	 */
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> findAll(UserFilter filter, Paging paging) {
		
		Console.log(filter);
		Console.log(paging);
		
		ArrayList<User> users = userService.findAll(filter, paging);
		Map<String, Object> map = new HashMap<>();
		map.put("DATA", users);
		map.put("PAGING", paging);
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
}
