package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.ProfileDAO;
@Service
public class ProfileServiceImp implements ProfileService{
	
	@Autowired
	private ProfileDAO profileDao;

	
}
	
	
	
	
	
	
	
	
	
	
