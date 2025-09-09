

## ✅ Features

We'll build:

* `GET /tasks` – Get all tasks
* `POST /tasks` – Create a task
* `PUT /tasks/{id}/complete` – Mark task as completed
* `DELETE /tasks/{id}` – Delete task

---

## 📁 Project Structure (Minimal)

```
todoapp/
├── model/
│   └── Task.java
├── controller/
│   └── TaskController.java
├── TodoAppApplication.java
└── application.properties (optional)
```

---

## 🧱 Step-by-Step Implementation

### 1. **Create the Spring Boot App**

Use [Spring Initializr](https://start.spring.io/) with just **Spring Web** as a dependency.

---

### 2. **Task Model**

```java
package com.example.todoapp.model;

public class Task {
    private Long id;
    private String title;
    private boolean completed;

    public Task() {}

    public Task(Long id, String title) {
        this.id = id;
        this.title = title;
        this.completed = false;
    }

    // Getters and setters

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public boolean isCompleted() { return completed; }
    public void setCompleted(boolean completed) { this.completed = completed; }
}
```

---

### 3. **Task Controller**

```java
package com.example.todoapp.controller;

import com.example.todoapp.model.Task;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.concurrent.atomic.AtomicLong;

@RestController
@RequestMapping("/tasks")
public class TaskController {

    private final Map<Long, Task> tasks = new HashMap<>();
    private final AtomicLong idCounter = new AtomicLong();

    // Get all tasks
    @GetMapping
    public List<Task> getAllTasks() {
        return new ArrayList<>(tasks.values());
    }

    // Create new task
    @PostMapping
    public Task createTask(@RequestBody Task task) {
        Long id = idCounter.incrementAndGet();
        Task newTask = new Task(id, task.getTitle());
        tasks.put(id, newTask);
        return newTask;
    }

    // Mark task as completed
    @PutMapping("/{id}/complete")
    public ResponseEntity<Task> completeTask(@PathVariable Long id) {
        Task task = tasks.get(id);
        if (task != null) {
            task.setCompleted(true);
            return ResponseEntity.ok(task);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // Delete task
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTask(@PathVariable Long id) {
        if (tasks.containsKey(id)) {
            tasks.remove(id);
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
```

---

### 4. **Main Application Class**

```java
package com.example.todoapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TodoAppApplication {
    public static void main(String[] args) {
        SpringApplication.run(TodoAppApplication.class, args);
    }
}
```

---

## 🧪 Testing the API

You can use Postman or `curl`:

### ➕ Create a task

```bash
curl -X POST http://localhost:8080/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Learn Spring Boot"}'
```

### 📋 Get all tasks

```bash
curl http://localhost:8080/tasks
```

### ✅ Complete a task

```bash
curl -X PUT http://localhost:8080/tasks/1/complete
```

### ❌ Delete a task

```bash
curl -X DELETE http://localhost:8080/tasks/1
```

---

## 💡 Note

This app:

* Stores data in memory — once you restart the app, the tasks are gone.
* Is ideal for **learning CRUD**, testing **API concepts**, or building a **frontend prototype**.

---
