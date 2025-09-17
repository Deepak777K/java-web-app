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
