package me.java.beans;

import java.util.Arrays;

public class PollItemBean {

	private int listnum; // 설문 번호
	private int itemnum; // 아이템 번호
	private String[] item; // 아이템 내용
	private int cnt; // 투표수
	
	public PollItemBean() {
		super();
	}
	public PollItemBean(int listnum, int itemnum) {
		super();
		this.listnum = listnum;
		this.itemnum = itemnum;
	}
	public PollItemBean(int listnum, int itemnum, String[] item, int cnt) {
		super();
		this.listnum = listnum;
		this.itemnum = itemnum;
		this.item = item;
		this.cnt = cnt;
	}
	public int getListnum() {
		return listnum;
	}
	public void setListnum(int listnum) {
		this.listnum = listnum;
	}
	public int getItemnum() {
		return itemnum;
	}
	public void setItemnum(int itemnum) {
		this.itemnum = itemnum;
	}
	public String[] getItem() {
		return item;
	}
	public void setItem(String[] item) {
		this.item = item;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "PollItemBean [listnum=" + listnum + ", itemnum=" + itemnum + ", item=" + Arrays.toString(item)
				+ ", cnt=" + cnt + "]";
	}
	
}