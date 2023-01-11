package article.service;

import java.util.Map;

import article.model.Writer;

public class WriteRequest {
	
		private Writer writer; // 작성자
		private String title; // 제목
		private String content; // 내용
		
		public WriteRequest(Writer writer, String title, String content) {
			this.writer = writer;
			this.title = title;
			this.content = content;
		}

		public Writer getWriter() {
			return writer;
		}

		public String getTitle() {
			return title;
		}

		public String getContent() {
			return content;
		}
		
		public void validate(Map<String, Boolean> errors) {
			if (title == null || title.trim().isEmpty()) {
				errors.put("title", Boolean.TRUE);
			}
		}
}

