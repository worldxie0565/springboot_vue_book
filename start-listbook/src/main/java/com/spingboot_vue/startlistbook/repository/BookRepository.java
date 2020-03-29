package com.spingboot_vue.startlistbook.repository;

import com.spingboot_vue.startlistbook.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Integer> {
}
