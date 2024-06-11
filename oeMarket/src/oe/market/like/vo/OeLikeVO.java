package oe.market.like.vo;

public class OeLikeVO {

		private String olnum;
		private String bnum;
		private String onum;
		private String likecnt;
		private String insertdate;
		private String updatedate;
		private String deleteyn;
		
		// 생성자
		public OeLikeVO() {
			
		}

		public OeLikeVO(String olnum, String bnum, String onum, String likecnt, String insertdate, String updatedate,
				String deleteyn) {
			
			this.olnum = olnum;
			this.bnum = bnum;
			this.onum = onum;
			this.likecnt = likecnt;
			this.insertdate = insertdate;
			this.updatedate = updatedate;
			this.deleteyn = deleteyn;
		}
		
		// getter / setter
		public String getOlnum() {
			return olnum;
		}
		public String getBnum() {
			return bnum;
		}
		public String getOnum() {
			return onum;
		}
		public String getLikecnt() {
			return likecnt;
		}
		public String getInsertdate() {
			return insertdate;
		}
		public String getUpdatedate() {
			return updatedate;
		}
		public String getDeleteyn() {
			return deleteyn;
		}
		public void setOlnum(String olnum) {
			this.olnum = olnum;
		}
		public void setBnum(String bnum) {
			this.bnum = bnum;
		}
		public void setOnum(String onum) {
			this.onum = onum;
		}
		public void setLikecnt(String likecnt) {
			this.likecnt = likecnt;
		}
		public void setInsertdate(String insertdate) {
			this.insertdate = insertdate;
		}
		public void setUpdatedate(String updatedate) {
			this.updatedate = updatedate;
		}
		public void setDeleteyn(String deleteyn) {
			this.deleteyn = deleteyn;
		}
		
		
}
