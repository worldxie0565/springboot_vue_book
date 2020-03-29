package com.spingboot_vue.startlistbook.repository;

import com.spingboot_vue.startlistbook.entity.Book;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BookRepositoryTest {
    @Autowired
    private  BookRepository bookRepository;

    @Test
    void findAll(){
        PageRequest pageRequest = PageRequest.of(0,2);
        Page<Book> page = bookRepository.findAll(pageRequest);
    }

    @Test
    void save(){
        Book book = new Book();
        book.setName("不知道");
        book.setAuthor("鲁迅传记");
        bookRepository.save(book);
    }


}