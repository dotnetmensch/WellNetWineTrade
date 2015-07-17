package wellnet.dao;

import java.util.*;

public class ImportOrder {
	
	private int orderId = 0;
	private int accountId = 0;
	private List<OrderItem> orderItems = new ArrayList<OrderItem>();
	
	public static String[] ColumnNames = {
		"ORDER_ID",
		"ACCOUNT_ID"
	};
	

	public ImportOrder(){
		
	}
	
	public ImportOrder(int id, int accountId, List<OrderItem> items){
		this.orderId = id;
		this.accountId = accountId;
		this.orderItems = items;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public List<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	
}
