-- Delete dependent rows in user_roles
DELETE FROM user_roles WHERE user_id IN (SELECT id FROM users);

-- Drop the user_roles table if it exists
DROP TABLE IF EXISTS user_roles;

-- Drop the USERS table if it exists
DROP TABLE IF EXISTS USERS;

-- Create the USERS table
CREATE TABLE USERS
(
    ID           INT AUTO_INCREMENT           NOT NULL,
    EMAIL        VARCHAR(255)     NOT NULL UNIQUE,
    NAME         VARCHAR(100)     NOT NULL,
    GRAVATAR_URL VARCHAR(255)     NOT NULL,
    PASSWORD     VARCHAR(255)     NOT NULL,
    ACTIVE       BOOLEAN          NOT NULL,
    PRIMARY KEY (ID)
);

-- Create the user_roles table with a foreign key reference to USERS
CREATE TABLE user_roles (
    user_id INT NOT NULL,
    role ENUM('USER', 'ADMIN', 'INFO') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
