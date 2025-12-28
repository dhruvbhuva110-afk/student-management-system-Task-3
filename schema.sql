-- Student Management System Database Schema
-- Created: 2025-12-16

-- Create database
CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

-- Drop table if exists (for clean installation)
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS users;

-- Create users table for authentication
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'User') DEFAULT 'User',
    status ENUM('Pending', 'Approved', 'Rejected', 'Banned') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create students table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    course VARCHAR(100) NOT NULL,
    enrollment_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_course (course),
    INDEX idx_enrollment_date (enrollment_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert sample data for testing
INSERT INTO students (student_id, name, email, phone, course, enrollment_date) VALUES
('STD001', 'Rahul Sharma', 'rahul.sharma@example.com', '+91-9876543210', 'Computer Science', '2024-01-15'),
('STD002', 'Priya Patel', 'priya.patel@example.com', '+91-9876543211', 'Information Technology', '2024-01-16'),
('STD003', 'Amit Kumar', 'amit.kumar@example.com', '+91-9876543212', 'Electronics', '2024-01-17'),
('STD004', 'Sneha Reddy', 'sneha.reddy@example.com', '+91-9876543213', 'Computer Science', '2024-01-18'),
('STD005', 'Arjun Singh', 'arjun.singh@example.com', '+91-9876543214', 'Mechanical Engineering', '2024-01-19'),
('STD006', 'Kavya Nair', 'kavya.nair@example.com', '+91-9876543215', 'Civil Engineering', '2024-01-20'),
('STD007', 'Vikram Mehta', 'vikram.mehta@example.com', '+91-9876543216', 'Information Technology', '2024-01-21'),
('STD008', 'Ananya Gupta', 'ananya.gupta@example.com', '+91-9876543217', 'Computer Science', '2024-01-22');
