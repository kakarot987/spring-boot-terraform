package com.spring_boot_terraform.service;

import com.spring_boot_terraform.model.Todo;
import com.spring_boot_terraform.repository.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Service
public class TodoService {
    @Autowired
    private TodoRepository repository;

    public Flux<Todo> getAll() {
        return repository.findAll();
    }

    public Mono<Todo> getById(Long id) {
        return repository.findById(id);
    }

    public Mono<Todo> create(Todo todo) {
        return repository.save(todo);
    }

    public Mono<Void> delete(Long id) {
        return repository.deleteById(id);
    }
}
