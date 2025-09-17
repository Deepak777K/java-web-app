## ✅ Minimal CRUD App with Java + Spring Boot (In-Memory Storage)

### 💬 Dear Future Me,

This is your quick reference to **revise the basics** of building web applications using **Java**, **Maven**, and **Spring Boot**.

**Goal:**
Build a simple RESTful web application that performs CRUD operations using Spring Boot and Java, with in-memory storage (like a `Map` or `List`).

**Use case example:**
Managing a list of "Users" with `id`, `name`, and `email`.

---

### 🛠️ Requirements

* Java Spring Boot starter project
* Here is the quick guide link for setup and docs:
  🔗 [https://github.com/Deepak777K/java-web-app/blob/dev/docs/start.md](https://github.com/Deepak777K/java-web-app/blob/dev/docs/start.md)

---

### 📁 Project Structure

```
src
└── main
    └── java
        └── com.example.demo
            ├── DemoApplication.java
            ├── controller
            │   └── UserController.java (+New file)
            ├── model
            │   └── User.java (+New file)
            └── service
                └── UserService.java (+New file)
```

---

### 📦 Step-by-Step

#### 1. **User Model**

```java
package com.example.demo.model;

public class User {

    private Long id;
    private String name;
    private String email;

    // Default constructor (no arguments)
    public User() {
    }

    // Parameterized constructor
    public User(Long id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }

    // Getters & Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
```

---

#### 2. **User Service (In-Memory Storage)**

```java
package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.demo.model.User;

@Service
public class UserService {

    private final Map<Long, User> users = new HashMap<>();
    private Long idCounter = 1L;

    public List<User> getAllUsers() {
        return new ArrayList<>(users.values());
    }

    public User getUserById(Long id) {
        return users.get(id);
    }

    public User createUser(User user) {
        user.setId(idCounter++);
        users.put(user.getId(), user);
        return user;
    }

    public User updateUser(Long id, User user) {
        if (users.containsKey(id)) {
            user.setId(id);
            users.put(id, user);
            return user;
        }
        return null;
    }

    public boolean deleteUser(Long id) {
        return users.remove(id) != null;
    }
}
```

---

#### 3. **User Controller**

```java
package com.example.demo.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@RestController
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/getAll")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @GetMapping("/getById/{id}")
    public User getUser(@PathVariable Long id) {
        return userService.getUserById(id);
    }

    @PostMapping("/create")
    public User createUser(@RequestBody User user) {
        return userService.createUser(user);
    }

    @PutMapping("/update/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody User user) {
        return userService.updateUser(id, user);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
    }
}
```

---

### ▶️ Run the App

using terminal:

```bash
mvn spring-boot:run
```
---

### 🛠️ Next Steps

* ✅ **Test the API Endpoints**
  Use the provided `curl` commands or the shell script to verify that each endpoint works as expected.

* 📘 **Quick Start & Documentation**
  For setup instructions and complete documentation, refer to the quick guide:
  🔗 [Quick Setup & API Docs](https://github.com/Deepak777K/java-web-app/blob/dev/docs/test1.md)
