package pagination.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;

import pagination.entity.User;
import pagination.repository.provider.UserProvider;
import pagination.util.Paging;
import pagination.util.UserFilter;

@Repository
public interface UserRepository {
	
	/***
	 * Get All User with filter pagination
	 * @param filter
	 * @param paging
	 * @return
	 */
	@SelectProvider(type=UserProvider.class, method = "findAll")
	@Results({
		@Result(property="id", column="id"),
		@Result(property="firstName", column="firstname"),
		@Result(property="lastName", column="lastname"),
		@Result(property="gender", column="gender"),
		@Result(property="email", column="email"),
		@Result(property="role", column="role"),
		@Result(property="status", column="status")
	})
	public ArrayList<User> findAll(@Param("filter") UserFilter filter, @Param("paging") Paging paging);
	
	/***
	 * Count user with filter
	 * @param filter
	 * @return
	 */
	@SelectProvider(type=UserProvider.class, method = "count")
	public Long count(UserFilter filter);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/***
	 * SQL Factory!!!
	 */
	interface SQL { // select provider instead
		
		/***
		 * 
		 */
		String COUNT = ""
				+ "	SELECT "
				+ " 	COUNT (*)"
				+ "	FROM"
				+ "		tbuser"
				
				+ "	WHERE"
				+ "		LOWER(role) LIKE '%' || LOWER(#{roleName}) || '%'"
				+ "	AND "
				+ "		status LIKE '%' || #{status} || '%'"
				+ " AND "
				+ "		gender LIKE '%' || #{gender} || '%'"
				+ "	AND "
				+ "	("
				+ "			lastname LIKE '%'|| #{lastName} || '%' "
				+ "		AND "
				+ "			firstname LIKE '%' || #{firstName} || '%' "
				+ "	)";
		
	
		/***
		 * 
		 * 
		 */
		String SELECT_PAGING = ""
				
				+ "	SELECT "
				+ "		id,				"
				+ "		firstname,		"
				+ "		lastname,		"
				+ "		gender,			"
				+ "		email,			"
				+ "		role,			"
				+ "		status			"
				
				+ "	FROM					"
				+ "		tbuser 			"
				
				+ "	WHERE"
			
				+ "	LOWER(role) LIKE '%' || LOWER(#{filter.roleName }) || '%' "
				
				+ "	AND "
				+ "		status LIKE '%' || #{filter.status} || '%' "
				+ " AND "
				+ "		gender LIKE '%' || #{filter.gender} || '%'	"
				
				+ "	AND "
				+ "	("
				+ "		LOWER(lastname) LIKE '%' || LOWER(#{filter.lastName}) || '%'"
				+ "		AND "
				+ "		LOWER(firstname) LIKE '%' || LOWER(#{filter.firstName}) || '%'"
				+ "	)"
				
				+ "	ORDER BY				"
				+ "		id DESC	"
				
				+ "	LIMIT "
				+ "		#{paging.limit} "
				
				+ "	OFFSET "
				+ "		#{paging.offset}";
		
	}
}
