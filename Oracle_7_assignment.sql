CREATE TABLE fake_data (
    id NUMBER,
    name VARCHAR2(100),
    address VARCHAR2(200),
    phone VARCHAR2(20),
    email VARCHAR2(100),
    company VARCHAR2(100)
);


-- Create a loop for add(inserting) user.
BEGIN
    FOR i IN 1..100000 LOOP
        INSERT INTO fake_data (id, name, address, phone, email, company)
        VALUES (i, 'Fake Name ' || i, 'Fake Address ' || i, 'Fake Phone ' || i, 'fake_email' || i || '@example.com', 'Fake Company ' || i);
    END LOOP;
    COMMIT;
END;
 
 
 -- show our Table Size

SELECT SUM(bytes) AS table_size
FROM user_segments
WHERE segment_name = 'FAKE_DATA';



select * from fake_data;




-- Create an index 

CREATE INDEX fake_index ON FAKE_DATA(name);
 
 -- Create an other index
 CREATE INDEX fake_index2 ON FAKE_DATA( address);
  
   CREATE INDEX fake_index3 ON FAKE_DATA( phone);

--To calculate the size of the table
 SELECT segment_name, bytes
FROM user_segments
WHERE segment_name = 'FAKE_DATA';
 
 
 
 
 
 