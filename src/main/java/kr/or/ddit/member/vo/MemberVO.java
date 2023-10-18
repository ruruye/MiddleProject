package kr.or.ddit.member.vo;

public class MemberVO {
    private String mem_id;
    private String mem_pw;
    private String mem_name;
    private String mem_tel;
    private String mem_email;
    private String mem_adrs;
    private String mem_joindate;
    private String mem_bir;

    public MemberVO() {}

    // 생성자 - 전체
    public MemberVO(String mem_id, String mem_pw, String mem_name, String mem_tel, String mem_email, String mem_adrs, String mem_joindate, String mem_bir) {
        this.mem_id = mem_id;
        this.mem_pw = mem_pw;
        this.mem_name = mem_name;
        this.mem_tel = mem_tel;
        this.mem_email = mem_email;
        this.mem_adrs = mem_adrs;
        this.mem_joindate = mem_joindate;
        this.mem_bir = mem_bir;
    }

    public String getMem_id() {
        return mem_id;
    }

    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }

    public String getMem_pw() {
        return mem_pw;
    }

    public void setMem_pw(String mem_pw) {
        this.mem_pw = mem_pw;
    }

    public String getMem_name() {
        return mem_name;
    }

    public void setMem_name(String mem_name) {
        this.mem_name = mem_name;
    }

    public String getMem_tel() {
        return mem_tel;
    }

    public void setMem_tel(String mem_tel) {
        this.mem_tel = mem_tel;
    }

    public String getMem_email() {
        return mem_email;
    }

    public void setMem_email(String mem_email) {
        this.mem_email = mem_email;
    }

    public String getMem_adrs() {
        return mem_adrs;
    }

    public void setMem_adrs(String mem_adrs) {
        this.mem_adrs = mem_adrs;
    }

    public String getMem_joindate() {
        return mem_joindate;
    }

    public void setMem_joindate(String mem_joindate) {
        this.mem_joindate = mem_joindate;
    }

    public String getMem_bir() {
        return mem_bir;
    }

    public void setMem_bir(String mem_bir) {
        this.mem_bir = mem_bir;
    }
}
