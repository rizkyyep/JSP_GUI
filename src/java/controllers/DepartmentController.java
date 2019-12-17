/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDao;
import java.math.BigDecimal;
import java.util.List;
import models.Department;
import models.Employee;
import models.Location;
import tools.HibernateUtil;

/**
 *
 * @author HP
 */
public class DepartmentController<E> {

    private GeneralDao dao;

    public DepartmentController() {

        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public String save(String id, String name, String manid, String locid) {
        return dao.save(new Department(new Short(id), name, new Employee(new Integer(manid)), new Location(new BigDecimal(locid))))==null ?"Failed":"Success";
    }

//
    public String delete(String id) {
        return dao.delete(new Department(new Short(id)))==null ?"Failed":"Success";
    }

    public List<Department> getAll() {
        return this.dao.select("Department");
    }

    public List<Department> search(String cmb, String txt) {
        return this.dao.search("Department", cmb, txt);
    }

    public Department selectByName(String lname) {
        return (Department) this.dao.selectByField("Department", "departmentName", lname);
    }
}
