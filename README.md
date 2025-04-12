# Proxy Web Server with LRU CACHE

A high-performance multithreaded proxy web server designed to handle simultaneous client connections with caching and HTTP request parsing capabilities. This project demonstrates socket programming in C, the use of POSIX threads and semaphores, and implements an LRU (Least Recently Used) caching mechanism. Additionally, it integrates a custom proxy parser for handling HTTP requests using the accompanying `proxy_parse.h` and `proxy_parse.c`.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technology Overview](#technology-overview)
  - [What is a Proxy Web Server?](#what-is-a-proxy-web-server)
  - [LRU Cache](#lru-cache)
  - [HTTP Request Parsing](#http-request-parsing)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Building with CMake](#building-with-cmake)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Known Issues and Future Improvements](#known-issues-and-future-improvements)
- [Contact](#contact)

## Introduction

This project implements a proxy web server that accepts HTTP requests from clients, forwards them to remote servers, caches responses, and then relays the responses back to the client. The server is built with an emphasis on performance and scalability, supporting up to 10 concurrent client connections. The caching functionality uses an LRU strategy to efficiently manage limited cache space, ensuring that frequently accessed pages are served quickly.

## Features

- **Multithreading:**  
  Uses POSIX threads to manage up to 10 simultaneous client connections.
  
- **Caching:**  
  Implements an LRU (Least Recently Used) cache that temporarily stores server responses to reduce network overhead and improve response times.
  
- **HTTP Request Parsing:**  
  Custom HTTP parsing is handled by the `proxy_parse` module (`proxy_parse.c` and `proxy_parse.h`), ensuring proper interpretation of client requests.
  
- **Robust Socket Programming:**  
  Demonstrates advanced use of BSD sockets, including setting socket options and handling binding, listening, accepting connections, and inter-server communication.
  
- **Error Handling:**  
  Provides detailed error responses for various HTTP error codes (400, 403, 404, 500, 501, 505), with appropriate error pages and headers.
  

## Technology Overview

### What is a Proxy Web Server?

A proxy web server acts as an intermediary between a client (such as a web browser) and the destination server. When a client sends a request, the proxy server retrieves data from the destination server, and then forwards that data back to the client. This architecture offers several advantages:
- **Security:** It can mask the client's IP address, filter content, and monitor traffic.
- **Caching:** Frequently accessed content can be cached, reducing latency and bandwidth usage.
- **Load Balancing:** It can distribute client requests among multiple servers.

### LRU Cache

The LRU (Least Recently Used) cache is a data structure designed to manage a fixed-size cache by evicting the least recently accessed items when the cache runs out of space. In this project, the cache stores server responses along with metadata such as URL and a timestamp. When a new response is to be added and space is limited, the entry with the oldest timestamp (least recently used) is removed to make room.

### HTTP Request Parsing

Handling HTTP requests accurately is critical for a proxy server. The project uses a custom HTTP parser provided in `proxy_parse.c` and `proxy_parse.h`. This parser:
- Analyzes the request line (method, URL, version).
- Processes request headers.
- Validates the HTTP version (supporting HTTP/1.0 and HTTP/1.1).
This ensures that the proxy correctly understands and forwards client requests to remote servers.

## Installation

### Prerequisites

- **Operating System:** A Linux-based system (or compatible POSIX environment)
- **Compiler:** GCC or G++ (with C99/C++11 support)
- **CMake:** Version 3.x or higher (for managing the build process)
- **Development Libraries:**  
  POSIX threads, BSD sockets, and standard C libraries

### Building with CMake

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your_username/Proxy-Web-Server.git
   cd Proxy-Web-Server

2. **Open the project in code Editor(VS CODE)**
   
3. **Run make command in your terminal (After moving to prper directory using cd)**
   
     ```bash
     make
3. **Run folloowing command in your terminal**
   
    ```bash
    ./proxy 8080 # here 8080 is default port
    
5.  **Open your web browser and navigate to:**
    
     ```bash
     http://localhost:8080
