/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import models.Region;
import tools.HibernateUtil;

/**
 *
 * @author DELL
 */
public class RegionController<E> {

    private GeneralDao dao;

    public RegionController() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public RegionController(GeneralDao dao) {
        this.dao = dao;
    }

    public String save(String id, String name) {
      
       return dao.save(new Region(Integer.parseInt(id), name))==null ?"Failed":"Success";
    }
    

    public String delete(String id){
        return dao.delete(new Region(Integer.parseInt(id)))==null ?"Failed":"Success";
    }
    
    public List<Region> getAll(){
     return this.dao.select("Region");
    }
    public List<Region> search(String field, String key){
     return this.dao.search("Region", field, key);
    }
    
    public Region selectById(String id){
        return (Region) this.dao.selectByField(" Region "," regionId ", id);
    }
    public Region selectByName(String name){
        return (Region) this.dao.selectByField(" Region "," regionName ", name);
    }
    
//    public Region selectByname(String name){
//        return this.dao.selectByName(name);     
//    }
//    public List<Region> search(String key){
//        return this.dao.searchRegions(key);
//    }

}
