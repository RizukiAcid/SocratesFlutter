package com.example.spring_crud_api.repository;

import com.example.spring_crud_api.model.Item;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {
    // JpaRepository provides all CRUD methods out of the box.
}
