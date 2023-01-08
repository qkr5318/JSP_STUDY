package util;

import java.text.DecimalFormat;

// 정수 숫자를 변환해 주는 기능을 제공하는 FormatUtil 클래스를 작성
// EL에서 클래스의 메서드를 사용하기 위해서는 클래스의 메서드를 
// static으로 정의해야 합니다.
public class FormatUtil {

	public static String number(long number, String pattern) {
		DecimalFormat format = new DecimalFormat(pattern);
		return format.format(number);
	}
}
