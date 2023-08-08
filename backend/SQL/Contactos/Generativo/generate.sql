-- Contactos/generate.sql

-- Creación de la tabla Personas
CREATE TABLE Contacts__People (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    alias VARCHAR(255) UNIQUE,
    notes TEXT,
    birthdate DATE,
    location VARCHAR(255),
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_name_lastname (name, lastname),
    INDEX idx_alias (alias)
) ENGINE=InnoDB;

-- Creación de la tabla Categorías
CREATE TABLE Contacts__Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    INDEX idx_category_name (name)
) ENGINE=InnoDB;

-- Creación de la tabla Grupos
CREATE TABLE Contacts__Groups (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    INDEX idx_group_name (name)
) ENGINE=InnoDB;

-- Creación de la tabla intermedia Personas-Categorías
CREATE TABLE Contacts__People_Categories (
    person_id INT,
    category_id INT,
    PRIMARY KEY (person_id, category_id),
    FOREIGN KEY (person_id) REFERENCES Contacts__People(person_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Contacts__Categories(category_id) ON DELETE CASCADE,
    INDEX idx_person_category_person_id (person_id),
    INDEX idx_person_category_category_id (category_id)
) ENGINE=InnoDB;

-- Creación de la tabla intermedia Personas-Grupos
CREATE TABLE Contacts__People_Groups (
    person_id INT,
    group_id INT,
    PRIMARY KEY (person_id, group_id),
    FOREIGN KEY (person_id) REFERENCES Contacts__People(person_id) ON DELETE CASCADE,
    FOREIGN KEY (group_id) REFERENCES Contacts__Groups(group_id) ON DELETE CASCADE,
    INDEX idx_person_group_person_id (person_id),
    INDEX idx_person_group_group_id (group_id)
) ENGINE=InnoDB;

-- Creación de la tabla Tipos
CREATE TABLE Contacts__Types (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL UNIQUE,
    INDEX idx_type (type)
) ENGINE=InnoDB;

-- Creación de la tabla Emails
CREATE TABLE Contacts__Emails (
    email_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    address VARCHAR(255) NOT NULL UNIQUE,  -- Asumimos que cada dirección de correo es única
    type_id INT,
    FOREIGN KEY (person_id) REFERENCES Contacts__People(person_id) ON DELETE CASCADE,
    FOREIGN KEY (type_id) REFERENCES Contacts__Types(type_id) ON DELETE CASCADE,
    INDEX idx_email_address (address)
) ENGINE=InnoDB;

-- Creación de la tabla Enlaces
CREATE TABLE Contacts__Links (
    link_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    url VARCHAR(255) NOT NULL UNIQUE,  -- Asumimos que cada URL es única
    type VARCHAR(255) NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Contacts__People(person_id) ON DELETE CASCADE,
    INDEX idx_link_url (url)
) ENGINE=InnoDB;

-- Creación de la tabla Teléfonos
CREATE TABLE Contacts__Phones (
    phone_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    phone VARCHAR(15) NOT NULL UNIQUE,  -- Asumimos que cada número de teléfono es único
    type_id INT,
    FOREIGN KEY (person_id) REFERENCES Contacts__People(person_id) ON DELETE CASCADE,
    FOREIGN KEY (type_id) REFERENCES Contacts__Types(type_id) ON DELETE CASCADE,
    INDEX idx_phone_number (phone)
) ENGINE=InnoDB;
