package com.bootcamp.dao;

import com.bootcamp.model.Person;

import java.util.List;

public interface PersonDAO {
    void addPerson(Person p);
    void updatePerson(Person p);
    List<Person> listPersons();
    Person getPersonById(int id);
    void removePerson(int id);
}
