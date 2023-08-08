-- vistas.sql

-- Vista para obtener todos los detalles de un contacto, incluyendo categorías y grupos
CREATE VIEW v_DetailedPeople AS
SELECT 
    p.person_id,
    p.name,
    p.lastname,
    p.alias,
    p.notes,
    p.birthdate,
    p.location,
    p.created,
    p.modified,
    GROUP_CONCAT(DISTINCT c.name) AS categories,
    GROUP_CONCAT(DISTINCT g.name) AS groups
FROM 
    Contacts__People p
LEFT JOIN 
    Contacts__People_Categories pc ON p.person_id = pc.person_id
LEFT JOIN 
    Contacts__Categories c ON pc.category_id = c.category_id
LEFT JOIN 
    Contacts__People_Groups pg ON p.person_id = pg.person_id
LEFT JOIN 
    Contacts__Groups g ON pg.group_id = g.group_id
GROUP BY 
    p.person_id;

-- Vista para obtener los correos electrónicos de un contacto
CREATE VIEW v_ContactEmails AS
SELECT 
    p.person_id,
    p.name,
    p.lastname,
    e.address AS email,
    t.type AS email_type
FROM 
    Contacts__People p
JOIN 
    Contacts__Emails e ON p.person_id = e.person_id
JOIN 
    Contacts__Types t ON e.type_id = t.type_id;

-- Vista para obtener los enlaces de un contacto
CREATE VIEW v_ContactLinks AS
SELECT 
    p.person_id,
    p.name,
    p.lastname,
    l.url,
    l.type AS link_type
FROM 
    Contacts__People p
JOIN 
    Contacts__Links l ON p.person_id = l.person_id;

-- Vista para obtener los números telefónicos de un contacto
CREATE VIEW v_ContactPhones AS
SELECT 
    p.person_id,
    p.name,
    p.lastname,
    ph.phone,
    t.type AS phone_type
FROM 
    Contacts__People p
JOIN 
    Contacts__Phones ph ON p.person_id = ph.person_id
JOIN 
    Contacts__Types t ON ph.type_id = t.type_id;

