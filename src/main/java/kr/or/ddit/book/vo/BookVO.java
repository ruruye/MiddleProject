package kr.or.ddit.book.vo;

import java.sql.Date;

public class BookVO {
	private String book_id;
	private String book_tit;
	private String book_author;
	private String book_publi;
	private Date book_publidate;
	private String book_genre;
	private String book_isbn;
	private String book_yn;
	private int book_price;
	private String book_callsign;
	private String book_img;

	public BookVO() {}

	// 생성자
	public BookVO(String book_id, String book_tit, String book_author, String book_publi, Date book_publidate, String book_genre, String book_isbn, int book_price, String book_callsign) {
		this.book_id = book_id;
		this.book_tit = book_tit;
		this.book_author = book_author;
		this.book_publi = book_publi;
		this.book_publidate = book_publidate;
		this.book_genre = book_genre;
		this.book_isbn = book_isbn;
		this.book_price = book_price;
		this.book_callsign = book_callsign;
	}
	
	public BookVO(String book_tit, String book_author, String book_publi, Date book_publidate, String book_genre, String book_isbn, int book_price, String book_callsign) {
		this.book_tit = book_tit;
		this.book_author = book_author;
		this.book_publi = book_publi;
		this.book_publidate = book_publidate;
		this.book_genre = book_genre;
		this.book_isbn = book_isbn;
		this.book_price = book_price;
		this.book_callsign = book_callsign;
	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public String getBook_tit() {
		return book_tit;
	}

	public void setBook_tit(String book_tit) {
		this.book_tit = book_tit;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_publi() {
		return book_publi;
	}

	public void setBook_publi(String book_publi) {
		this.book_publi = book_publi;
	}

	public Date getBook_publidate() {
		return book_publidate;
	}

	public void setBook_publidate(Date book_publidate) {
		this.book_publidate = book_publidate;
	}

	public String getBook_genre() {
		return book_genre;
	}

	public void setBook_genre(String book_genre) {
		this.book_genre = book_genre;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getBook_yn() {
		return book_yn;
	}

	public void setBook_yn(String book_yn) {
		this.book_yn = book_yn;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public String getBook_callsign() {
		return book_callsign;
	}

	public void setBook_callsign(String book_callsign) {
		this.book_callsign = book_callsign;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
}
