package com.service;

import java.util.List;

import com.dao.HouseDao;
import com.entity.House;

public class HouseService {
	private HouseDao houseDao = new HouseDao();
	
	//add house
	public boolean add(House house, String uid){
		return houseDao.addHouse(house, uid);
	}
	
	//edit house
	public boolean edit(House house){
		return houseDao.editHouse(house);
	}
	public boolean delete(String hid) {
		return houseDao.deleteHouse(hid);
	}
	
	//search house
	public List<House> search(String where) {
		return houseDao.searchHouse(where);
	}
	
	public int getHouseCount(String where) {
		return houseDao.houseCount(where);
	}
	
	//back office
	
	public boolean active(String hid) {
		return houseDao.activeHouse(hid);
	}
	
	public boolean block(String hid) {
		return houseDao.blockHouse(hid);
	}
	
	public boolean advertise(String hid) {
		return houseDao.advertiseHouse(hid);
	}
	
	public boolean offAdvertise(String hid) {
		return houseDao.offAdvertiseHouse(hid);
	}
}
