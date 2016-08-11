package pagination.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pagination.entity.User;
import pagination.repository.UserRepo;
import pagination.repository.UserRepository;
import pagination.service.UserService;
import pagination.util.Paging;
import pagination.util.UserFilter;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserRepo userRepo;
	
	@Override	
	public ArrayList<User> findAll(UserFilter filter, Paging paging) {
		try{
			paging.setTotalCount(userRepository.count(filter));
			return userRepository.findAll(filter, paging);
			
		}catch(Exception e){	
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ArrayList<User> findAll(Paging paging) {
		paging.setTotalCount(userRepo.count());
		return userRepo.findAll(paging);
	}

	
}
