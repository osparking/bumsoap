package store;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bumsoap.store.repo.impl.SoapRepoMaria;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;

class TestUpdateStock {

	@Autowired
	SoapRepoMaria soapRepo;
	
	@Test
	void test() {
	}

}
