package pagination.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import pagination.entity.User;
import pagination.util.Paging;

@Repository
public interface UserRepo {

	@Select("SELECT * FROM tbuser LIMIT #{limit} OFFSET #{offset}")
	public ArrayList<User> findAll(Paging paging);
	
	@Select("SELECT COUNT(*) FROM tbuser")
	public Long count();
	
}
