package com.hc.revolves.bean;

import java.util.Date;

public class Goods {
	private Integer goodsId;
	private String cname;
	private String ename;
	private String xtype;
	private Integer price;
	private String consistence;
	private String brand;
	private String filed;
	private Integer spec;
	private String prev;
	private String centre;
	private String back;
	private String descri;
	private Date catadate;
	private Integer counts;
	private Integer sellnum;
	private Integer examstatus;
	private String imgurl;
	private Integer type;

	public Goods() {

	}

	public Goods(String cname, String ename, String xtype, Integer price, String consistence, String brand,
			Integer spec, String prev, String centre, String back, String descri, Date catadate, Integer counts,
			Integer sellnum, Integer examstatus, String imgurl, Integer type) {
		this.cname = cname;
		this.ename = ename;
		this.xtype = xtype;
		this.price = price;
		this.consistence = consistence;
		this.brand = brand;
		this.spec = spec;
		this.prev = prev;
		this.centre = centre;
		this.back = back;
		this.descri = descri;
		this.catadate = catadate;
		this.counts = counts;
		this.sellnum = sellnum;
		this.examstatus = examstatus;
		this.imgurl = imgurl;
		this.type = type;
	}

	public Goods(Integer goodsId, String cname, String ename, String xtype, Integer price, String consistence,
			String brand, Integer spec, String prev, String centre, String back, String descri, Date catadate,
			Integer counts, Integer sellnum, Integer examstatus, String imgurl, Integer type) {
		this.goodsId = goodsId;
		this.cname = cname;
		this.ename = ename;
		this.xtype = xtype;
		this.price = price;
		this.consistence = consistence;
		this.brand = brand;
		this.spec = spec;
		this.prev = prev;
		this.centre = centre;
		this.back = back;
		this.descri = descri;
		this.catadate = catadate;
		this.counts = counts;
		this.sellnum = sellnum;
		this.examstatus = examstatus;
		this.imgurl = imgurl;
		this.type = type;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getXtype() {
		return xtype;
	}

	public void setXtype(String xtype) {
		this.xtype = xtype;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getConsistence() {
		return consistence;
	}

	public void setConsistence(String consistence) {
		this.consistence = consistence;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getFiled() {
		return filed;
	}

	public void setFiled(String filed) {
		this.filed = filed;
	}

	public Integer getSpec() {
		return spec;
	}

	public void setSpec(Integer spec) {
		this.spec = spec;
	}

	public String getPrev() {
		return prev;
	}

	public void setPrev(String prev) {
		this.prev = prev;
	}

	public String getCentre() {
		return centre;
	}

	public void setCentre(String centre) {
		this.centre = centre;
	}

	public String getBack() {
		return back;
	}

	public void setBack(String back) {
		this.back = back;
	}

	public String getDescri() {
		return descri;
	}

	public void setDescri(String descri) {
		this.descri = descri;
	}

	public Date getCatadate() {
		return catadate;
	}

	public void setCatadate(Date catadate) {
		this.catadate = catadate;
	}

	public Integer getCounts() {
		return counts;
	}

	public void setCounts(Integer counts) {
		this.counts = counts;
	}

	public Integer getSellnum() {
		return sellnum;
	}

	public void setSellnum(Integer sellnum) {
		this.sellnum = sellnum;
	}

	public Integer getExamstatus() {
		return examstatus;
	}

	public void setExamstatus(Integer examstatus) {
		this.examstatus = examstatus;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
}
