package source09;

import java.util.HashMap;
import java.util.Map;

public class Thermometer {
	
//	String info;
	
	//[위치, 온도] 정보를 보관할 Map 타입의 필드를 정의합니다.
	private Map<String, Double> locationCelsiusMap = new HashMap<String, Double>();
	
	//[위치, 온도] 정보를 추가하는 setCelsius() 메서드를 정의합니다.
	// 리턴 타입이 void이고, 두개(위치, 온도)의 파라미터를 갖고 있습니다.
	public void setCelsius(String location, Double value) {
		locationCelsiusMap.put(location, value);
	}
	// location 파라미터 값에 해당하는 위치의 섭씨 온도를 구합니다.
	// 리턴 타입이 Double 이고, 한개(location)의 파라미터를 갖습니다.
	public Double getCelsius(String location) {
		return locationCelsiusMap.get(location);
	}
	
	// location 파라미터 값에 해당하는 위치의 화씨 온도를 구합니다.
	// 리턴 타입이 Double이고 한개(location)의 파라미터를 갖습니다.
	public Double getFahrenheit(String location) {
		Double celsius = getCelsius(location);
		if(celsius == null) {
			return null;
		}
		return celsius. doubleValue() * 1.8 + 32.0;
	}
	
	// 정보를 제공하는 getInfo() 메서드를 정의합니다. 리턴 타입이 String이고
	// 파라미터를 갖지 않은 전형적인 get() 메서드 입니다.
	public String getInfo() {
		return "온도계 변환기 ver 1.1";
	}
}
