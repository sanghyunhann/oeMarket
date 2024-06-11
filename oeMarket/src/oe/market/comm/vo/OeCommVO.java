package oe.market.comm.vo;

public class OeCommVO {

	private String cnum;
	private String bnum;
	private String oid;
	private String ccontent;
	private String insertdate;
	private String deleteyn;

	// 생성자
	public OeCommVO() {
		
	}

	public OeCommVO(String cnum, String bnum, String oid, String ccontent, String insertdate, String deleteyn) {
		
		this.cnum = cnum;
		this.bnum = bnum;
		this.oid = oid;
		this.ccontent = ccontent;
		this.insertdate = insertdate;
		this.deleteyn = deleteyn;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public String getBnum() {
		return bnum;
	}

	public void setBnum(String bnum) {
		this.bnum = bnum;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}
	
	
	
	
	

}