/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDao;
import java.math.BigDecimal;
import java.util.List;
import models.Country;
import models.Location;
import tools.HibernateUtil;

/**
 *
 * @author Rizky
 */
public class LocationController<E> {

    private GeneralDao dao;

    public LocationController() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public String save(String id, String address, String postal, String city, String province, String country) {
       return dao.save(new Location(new BigDecimal(id),
                address, postal, city, province, new Country(country)))==null ?"Failed":"Success";
        
    }

    public String delete(String id) {
     return   dao.delete(new Location(new BigDecimal(id)))==null ?"Failed":"Success";
    }

    public List<Location> getAll() {
        return this.dao.select("Location");
    }

    public List<Location> search(String cmb, String txt) {
        return this.dao.search("Location", cmb, txt);
    }

  

     public Location selectByName(String lname) {
        return (Location) this.dao.selectByField("Location", "city", lname);
    }

}
