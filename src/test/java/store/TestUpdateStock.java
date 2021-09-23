package store;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bumsoap.store.repo.impl.MariaBumSoapRepo;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;

class TestUpdateStock {

	@Autowired
	MariaBumSoapRepo soapRepo;
	
	@Test
	void test() {
	}

}
