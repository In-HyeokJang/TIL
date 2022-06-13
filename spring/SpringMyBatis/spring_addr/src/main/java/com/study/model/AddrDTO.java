package com.study.model;

public class AddrDTO {

	private int addressnum    ;  
	private String name       ;  
	private String handphone  ; 
	private String zipcode    ;
	private String address    ; 
	private String address2   ;
	
	public AddrDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AddrDTO(int addressnum, String name, String handphone, String zipcode, String address, String address2) {
		super();
		this.addressnum = addressnum;
		this.name = name;
		this.handphone = handphone;
		this.zipcode = zipcode;
		this.address = address;
		this.address2 = address2;
	}

	public int getAddressnum() {
		return addressnum;
	}

	public void setAddressnum(int addressnum) {
		this.addressnum = addressnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHandphone() {
		return handphone;
	}

	public void setHandphone(String handphone) {
		this.handphone = handphone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	@Override
	public String toString() {
		return "AddrDTO [addressnum=" + addressnum + ", name=" + name + ", handphone=" + handphone + ", zipcode="
				+ zipcode + ", address=" + address + ", address2=" + address2 + "]";
	}   
	
	
	
}                             
