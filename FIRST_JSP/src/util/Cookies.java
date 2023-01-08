package util;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {
   // 쿠키를<쿠키이름, Cookie 객체> 쌍 형태로 저장하는 맵을 생성합니다.
   private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();

   // Cookies 클래스의 생성자입니다.
   public Cookies(HttpServletRequest request) {
      // 파라미터로 전달받은 request로부터 Cookie 배열을 읽어와서
      Cookie[] cookies = request.getCookies();
      if (cookies != null) {
         // 각각의 Cookie 객체들을
         for (int i = 0; i < cookies.length; i++) {
            // 앞서 선언한 cookieMap에 저장 처리합니다.
            cookieMap.put(cookies[i].getName(), cookies[i]);
         }
      }
   }

   // cookieMap에서 지정한 이름의 Cookie 객체를 구합니다.
   // 지정한 이름의 쿠키가 존재하지 않으면 null을 리턴 합니다.
   public Cookie getCookie(String name) {
      return cookieMap.get(name);
   }

   // 지정한 이름을 갖는 쿠키의 값을 구하는 getValue() 메서드를 선언합니다.
   public String getValue(String name) throws IOException {
      Cookie cookie = cookieMap.get(name);
      if (cookie == null) {
         return null;
      }
      return URLDecoder.decode(cookie.getValue(), "utf-8");
   }

   // 지정한 이름의 Cookie가 존재하는 경우 true, 그렇지 않은 경우 false를 리턴합니다.
   public boolean exists(String name) {
      return cookieMap.get(name) != null;
   }

   // 이름이 name 이고 값이 value인 Cookie 객체를 생성해서 리턴 합니다.
   public static Cookie createCookie(String name, String value) throws IOException {
      return new Cookie(name, URLEncoder.encode(value, "utf-8"));
   }

   // 이름이 name, 값이 value, 경로가 path, 유효시간이 maxAge인 Cookie 객체를 생성해서 리턴합니다.
   public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException {
      Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
      cookie.setPath(path); // 쿠키 경로 설정
      cookie.setMaxAge(maxAge);// 쿠키 유효 시간 설정
      return cookie;
   }
}