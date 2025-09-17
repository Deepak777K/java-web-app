
# 📌 *Building a Web Application with Java + Maven + Spring Boot – Revising the Basics*

### 💬 Dear Future Me,

This is your quick reference to **revise the basics** of building web applications using **Java**, **Maven**, and **Spring Boot**.

---

## Step One: Machine Setup

### 🔧 Description:

A simple web application stack using:

* Windows machine
* **Java** – programming language
* **Maven** – build and dependency management
* **Spring Boot** – framework for web development

---

### ✅ Step-by-Step Setup:

#### 1. **Install Java JDK**

* Required: **Java 17 or later**

* Check installation:

  ```bash
  java -version
  ```

* Download from: [https://www.oracle.com/java/technologies/javase-downloads.html](https://www.oracle.com/java/technologies/javase-downloads.html)

---

#### 2. **Install Maven**

* Required for managing dependencies and building the project.

* Check installation:

  ```bash
  mvn -v
  ```

* Download from: [https://maven.apache.org/download.cgi](https://maven.apache.org/download.cgi)

---

#### 3. **Install an IDE**

* VS Code (recommended with Java extensions)

---

## Step Two

#### 4. **Generate Your Spring Boot Project**

Use **Spring Initializr** to bootstrap your project:
➡️ [https://start.spring.io](https://start.spring.io)

### Spring Initializr Setup

* **Project:** Maven
* **Language:** Java
* **Spring Boot:** 3.5.5 (or latest stable version)

**Project Metadata:**

* **Group:** com.example
* **Artifact:** demo
* **Name:** demo
* **Description:** Demo project for Spring Boot
* **Package name:** com.example.demo

**Packaging:** Jar
**Java version:** 20

**Dependencies:**

* **Spring Web**
  Build web, including RESTful applications using Spring MVC. Uses Apache Tomcat as the default embedded container.

Click **Generate**, then unzip and open the project in your IDE.

---

#### 5. **Run Your Application**

Find the main class with the `@SpringBootApplication` annotation (usually `YourAppNameApplication.java`).

In your IDE, **Right-click → Run**, or use terminal:

```bash
mvn spring-boot:run
```

Once it starts, visit:
🌐 `http://localhost:8080`

If you see an error-free blank page or a default error page — you’re ready to build!

---


