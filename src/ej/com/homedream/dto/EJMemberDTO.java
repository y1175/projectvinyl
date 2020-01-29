package ej.com.homedream.dto;

public class EJMemberDTO {
private int memNo;
private String id;
private String pwd;
private String name;
private String birth;
private String phone;
private String addr;
private int zipcode;
private int total;
private int point;
public int getMemNo() {
	return memNo;
}
public int getTotal() {
	return total;
}
public void setTotal(int total) {
	this.total = total;
}
public void setMemNo(int memNo) {
	this.memNo = memNo;
}
public String getId() {
	return id;
}
public int getPoint() {
	return point;
}
public void setPoint(int point) {
	this.point = point;
}
public void setId(String id) {
	this.id = id;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getBirth() {
	return birth;
}
public void setBirth(String birth) {
	this.birth = birth;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getAddr() {
	return addr;
}
public void setAddr(String addr) {
	this.addr = addr;
}
public int getZipcode() {
	return zipcode;
}
public void setZipcode(int zipcode) {
	this.zipcode = zipcode;
}
}
