package it.cnr.istc.stlab.arco.harverster;

import java.util.Calendar;

public class Test {
	
	public static void main(String[] args) {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, 2021);
		c.set(Calendar.MONTH, 05);
		c.set(Calendar.DAY_OF_MONTH, 01);

		System.out.print(String.format("%d%02d%02d", c.get(Calendar.YEAR),c.get(Calendar.MONTH),c.get(Calendar.DAY_OF_MONTH)));
	}

}
