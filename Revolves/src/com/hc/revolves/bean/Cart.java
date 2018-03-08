package com.hc.revolves.bean;

import java.util.Date;

public class Cart {
	private Integer indextId;
	private Integer userId;
	private Integer goodsId;
	private Integer status;
	private Date buyDate;
	private Integer num;
	private Integer collect;
	private Integer pay;
	private Integer shipments;
	private Integer addrid;

	public Cart() {

	}

	public Integer getIndextId() {
		return indextId;
	}

	public void setIndextId(Integer indextId) {
		this.indextId = indextId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getCollect() {
		return collect;
	}

	public void setCollect(Integer collect) {
		this.collect = collect;
	}

	public Integer getPay() {
		return pay;
	}

	public void setPay(Integer pay) {
		this.pay = pay;
	}

	public Integer getShipments() {
		return shipments;
	}

	public void setShipments(Integer shipments) {
		this.shipments = shipments;
	}

	public Integer getAddrid() {
		return addrid;
	}

	public void setAddrid(Integer addrid) {
		this.addrid = addrid;
	}

	public Cart(Integer indextId, Integer userId, Integer goodsId, Integer status, Date buyDate, Integer num,
			Integer collect, Integer pay, Integer shipments, Integer addrid) {
		super();
		this.indextId = indextId;
		this.userId = userId;
		this.goodsId = goodsId;
		this.status = status;
		this.buyDate = buyDate;
		this.num = num;
		this.collect = collect;
		this.pay = pay;
		this.shipments = shipments;
		this.addrid = addrid;
	}

}
