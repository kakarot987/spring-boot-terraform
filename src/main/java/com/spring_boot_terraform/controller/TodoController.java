package com.spring_boot_terraform.controller;

import com.spring_boot_terraform.model.Todo;
import com.spring_boot_terraform.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("/api/todos")
public class TodoController {
    @Autowired
    private TodoService service;

    @GetMapping
    public Flux<Todo> getAll() {
        return service.getAll();
    }

    @GetMapping("/{id}")
    public Mono<Todo> getById(@PathVariable Long id) {
        return service.getById(id);
    }

    @PostMapping
    public Mono<Todo> create(@RequestBody Todo todo) {
        return service.create(todo);
    }

    @DeleteMapping("/{id}")
    public Mono<Void> delete(@PathVariable Long id) {
        return service.delete(id);
    }
}
