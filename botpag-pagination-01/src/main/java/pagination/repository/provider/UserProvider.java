package pagination.repository.provider;

import org.apache.ibatis.jdbc.SQL;

import pagination.util.UserFilter;

public class UserProvider {
	
	public String findAll(UserFilter filter){
		return new SQL(){{
			SELECT("id, firstname, lastname, gender, email, role, status");
			FROM  ("tbuser");
			if(filter.getRoleName()!=null)
				WHERE ("LOWER(role) = LOWER(#{filter.roleName })");
			if(filter.getStatus()!=null)
				WHERE ("status = #{filter.status}");
			if(filter.getGender()!=null)
				WHERE ("gender = #{filter.gender}");
			if(filter.getFirstName()!=null)
				WHERE("LOWER(firstname) LIKE '%' || LOWER(#{filter.firstName}) || '%'");
			if(filter.getLastName()!=null)
				WHERE ("LOWER(lastname) LIKE '%' || LOWER(#{filter.lastName}) || '%'");
			ORDER_BY("id DESC LIMIT #{paging.limit} OFFSET #{paging.offset}");
		}}.toString();
	}
	
	public String count(UserFilter filter){
		return new SQL(){{
			SELECT("COUNT(*)");
			FROM  ("tbuser");
			if(filter.getRoleName()!=null)
				WHERE("LOWER(role) = LOWER(#{roleName })");
			if(filter.getStatus()!=null)
				WHERE("status = #{status}");
			if(filter.getGender()!=null)
				WHERE("gender = #{gender}");
			if(filter.getFirstName()!=null)
				WHERE("LOWER(firstname) LIKE '%' || LOWER(#{firstName}) || '%'");
			if(filter.getLastName()!=null)
				WHERE("LOWER(lastname) LIKE '%' || LOWER(#{lastName}) || '%'");
		}}.toString();
	}
}
