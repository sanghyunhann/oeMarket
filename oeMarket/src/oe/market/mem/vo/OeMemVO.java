package oe.market.mem.vo;

public class OeMemVO {
	private String onum;
	private String oname;
	private String oid;
	private String opw;
	private String ohp;
	private String ogender;
	private String ozonecode;
	private String oroad;
	private String oroaddetail;
	private String ojibun;
	private String master;
	private String insertdate;
	private String updatedate;
	private String deleteyn;
	private String oemail;
	
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	private String startDate;		// 검색기간 시작일
	private String endDate;			// 검색기간 종료일
	
	
	
	public OeMemVO() {

	}
	
	public OeMemVO(String onum, String oname, String oid, String opw, String ohp, String ogender, String ozonecode,
			String oroad, String oroaddetail, String ojibun, String master, String insertdate, String updatedate,
			String deleteyn, String keyword, String searchFilter, String startDate, String endDate, String oemail) {

		this.onum = onum;
		this.oname = oname;
		this.oid = oid;
		this.opw = opw;
		this.ohp = ohp;
		this.ogender = ogender;
		this.ozonecode = ozonecode;
		this.oroad = oroad;
		this.oroaddetail = oroaddetail;
		this.ojibun = ojibun;
		this.master = master;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		this.keyword = keyword;
		this.searchFilter = searchFilter;
		this.startDate = startDate;
		this.endDate = endDate;
		this.oemail = oemail;
	}
	
	public String getOemail() {
		return oemail;
	}

	public void setOemail(String oemail) {
		this.oemail = oemail;
	}

	public String getOnum() {
		return onum;
	}
	public void setOnum(String onum) {
		this.onum = onum;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getOpw() {
		return opw;
	}
	public void setOpw(String opw) {
		this.opw = opw;
	}
	public String getOhp() {
		return ohp;
	}
	public void setOhp(String ohp) {
		this.ohp = ohp;
	}
	public String getOgender() {
		return ogender;
	}
	public void setOgender(String ogender) {
		this.ogender = ogender;
	}
	public String getOzonecode() {
		return ozonecode;
	}
	public void setOzonecode(String ozonecode) {
		this.ozonecode = ozonecode;
	}
	public String getOroad() {
		return oroad;
	}
	public void setOroad(String oroad) {
		this.oroad = oroad;
	}
	public String getOroaddetail() {
		return oroaddetail;
	}
	public void setOroaddetail(String oroaddetail) {
		this.oroaddetail = oroaddetail;
	}
	public String getOjibun() {
		return ojibun;
	}
	public void setOjibun(String ojibun) {
		this.ojibun = ojibun;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
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
	public String getDeleteyn() {
		return deleteyn;
	}
	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchFilter() {
		return searchFilter;
	}
	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}
