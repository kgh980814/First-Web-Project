package service;

import mapper.ContactMapper;
import model.ContactVO;

public class ContactServiceImpl implements ContactService {

	private ContactMapper mapper;
	
	public ContactServiceImpl() {
		mapper = new ContactMapper();
	}
	
	@Override
	public void create(ContactVO contact) {
		mapper.create(contact);		
	}

}
