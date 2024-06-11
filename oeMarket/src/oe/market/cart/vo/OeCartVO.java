package oe.market.cart.vo;

public class OeCartVO {
	private String ocnum;
	private String oid;
	private String bnum;
	private String olnum;
	private String deleteyn;
	
	
	 // Additional fields for joining with OeBoard
    private String btitle;
    private String bcontent;
    private String bphoto;
    private String bprice;
    private String insertdate;
    private String updatedate;
    
	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBphoto() {
		return bphoto;
	}

	public void setBphoto(String bphoto) {
		this.bphoto = bphoto;
	}

	public String getBprice() {
		return bprice;
	}

	public void setBprice(String bprice) {
		this.bprice = bprice;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public OeCartVO() {
		
	}
	
	public OeCartVO(String ocnum, String oid, String bnum, String olnum, String deleteyn) {	
		this.ocnum = ocnum;
		this.oid = oid;
		this.bnum = bnum;
		this.olnum = olnum;
		this.deleteyn = deleteyn;
	}
	public String getOcnum() {
		return ocnum;
	}
	public void setOcnum(String ocnum) {
		this.ocnum = ocnum;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getBnum() {
		return bnum;
	}
	public void setBnum(String bnum) {
		this.bnum = bnum;
	}
	public String getOlnum() {
		return olnum;
	}
	public void setOlnum(String olnum) {
		this.olnum = olnum;
	}
	public String getDeleteyn() {
		return deleteyn;
	}
	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}
	
	
}
