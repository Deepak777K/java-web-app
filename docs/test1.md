
# 📘 Testing the RESTful CRUD API

This guide provides two simple ways to test your backend API:

* **Method 1**: Manual testing using `curl` commands in the terminal.
* **Method 2**: Automated testing using a shell script.

---

## ✅ Method 1: Testing via Command Line

Use the following `curl` commands to test each endpoint of the API:

### ➕ Create a User

```bash
curl -X POST http://localhost:8080/users/create -H "Content-Type: application/json" -d '{"name": "Alice", "email": "alice@example.com"}'
```

### 📋 Get all users

```bash
curl http://localhost:8080/users/getAll
```

### 📋 Get user with ID (1/2/...)

```bash
curl http://localhost:8080/users/getById/{id}
```

### ✅ update a user

```bash
curl -X PUT http://localhost:8080/users/update/{id} -H "Content-Type: application/json" -d '{"name": "Alice Updated", "email": "alice.updated@example.com"}'
```

### ❌ Delete a user

```bash
curl -X DELETE http://localhost:8080/users/delete/{id}
```

Replace `{id}` with the actual user ID you want to target.

---

## ⚙️ Method 2: Automated Testing with Shell Script

A more efficient way to test your API is by using a shell script. This method is especially useful when testing multiple endpoints repeatedly.

### 🔧 Step 1: Create the Script File

Create a test folder and a shell script file inside it:

```bash
mkdir test
```

```bash
cd test
```

```bash
touch test-api.sh
```

### 🧾 Step 2: Add the Script Content

Paste the following code into `test-api.sh`:

```bash
#!/bin/bash

echo "▶️ Creating a user..."
curl -X POST http://localhost:8080/users/create \
  -H "Content-Type: application/json" \
  -d '{"name": "Alice", "email": "alice@example.com"}'
echo -e "\n"

echo "▶️ Creating a second user..."
curl -X POST http://localhost:8080/users/create \
  -H "Content-Type: application/json" \
  -d '{"name": "Ben", "email": "Ben@example.com"}'
echo -e "\n"

echo "▶️ Getting all users..."
curl -X GET http://localhost:8080/users/getAll
echo -e "\n"

echo "▶️ Getting user with ID 1..."
curl -X GET http://localhost:8080/users/getById/1
echo -e "\n"

echo "▶️ Updating user with ID 1..."
curl -X PUT http://localhost:8080/users/update/1 \
  -H "Content-Type: application/json" \
  -d '{"name": "Alice Updated", "email": "alice.updated@example.com"}'
echo -e "\n"

echo "▶️ Getting updated user with ID 1..."
curl -X GET http://localhost:8080/users/getById/1
echo -e "\n"

echo "▶️ Deleting user with ID 1..."
curl -X DELETE http://localhost:8080/users/delete/1
echo -e "\n"

echo "▶️ Getting all users after deletion..."
curl -X GET http://localhost:8080/users/getAll
echo -e "\n"

```

### ▶️ Step 3: Make the Script Executable

Run the following command to make the script executable:

```bash
chmod +x test-api.sh
```

### ▶️ Step 4: Execute the Script

Now run the script:

```bash
./test-api.sh
```

---
