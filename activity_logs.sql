-- Activity Logs Table
-- Tracks all user actions for audit trail and accountability

-- Select the database
USE student_management;

CREATE TABLE IF NOT EXISTS activity_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    username VARCHAR(100) NOT NULL,
    user_email VARCHAR(100) NOT NULL,
    action VARCHAR(50) NOT NULL,
    entity_type VARCHAR(50) NOT NULL,
    entity_id INT NULL,
    description TEXT NOT NULL,
    ip_address VARCHAR(45) NULL,
    user_agent TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user_id (user_id),
    INDEX idx_action (action),
    INDEX idx_entity_type (entity_type),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Sample data
INSERT INTO activity_logs (user_id, username, user_email, action, entity_type, entity_id, description, ip_address) VALUES
(1, 'Admin User', 'admin@example.com', 'CREATE', 'student', 1, 'Created new student: John Doe', '127.0.0.1'),
(1, 'Admin User', 'admin@example.com', 'UPDATE', 'student', 1, 'Updated student information: John Doe', '127.0.0.1'),
(1, 'Admin User', 'admin@example.com', 'DELETE', 'student', 2, 'Deleted student: Jane Smith', '127.0.0.1');
