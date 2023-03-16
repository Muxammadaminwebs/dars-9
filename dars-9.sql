
-- VIEW
-- UNION
-- UNION ALL
-- EXCEPT
-- INTERSECT
-- JSON
-- ARRAY
-- REPLACE()
-- JSON_BUILD_OBJECT()
-- JSON_AGG()
-- ARRAY_AGG()

-- ============================================================================================

CREATE TABLE job (
    name VARCHAR,
    salary int
);
CREATE TABLE vacansy(
    name VARCHAR,
    salary int
);


INSERT INTO job VALUES 
('node' , 1000),
('python' , 1500),
('java' , 2000),
('.net' , 1100),
('go' , 1600),
('c' , 1300),
('javascript' , 1200);
INSERT INTO vacansy VALUES 
('node' , 1000),
('react' , 1500),
('java' , 2000),
('html' , 1100),
('go' , 1600),
('c' , 1300),
('c++' , 1200);

INSERT INTO vacansy VALUES 
('node' , 6000),
('go' , 1600);


select * from job
UNION
select * from vacansy;
select * from job
UNION ALL
select * from vacansy;
select * from job
EXCEPT
select * from vacansy;

select * from vacansy
EXCEPT
select * from job;
select * from vacansy
INTERSECT
select * from job;


CREATE TABLE students(
    name VARCHAR,
    address JSON
);

INSERT INTO students VALUES 
('Alisher','"Surxondaryo"');
('Olim','{"city" : "Buxoro" , "district": "G''ijduvon" }'),
('Sarvar','{"city" : "Andijon" , "district": "Asaka" }'),
('Malika','{"city" : "Xorazm" , "district": "Xozarasp" }'),
('Botir','{"city" : "Jizzax" , "district": "Zomin" }');


select name, address -> 'city' city, address -> 'district' district from students;
select name, address district from students;

update students
SET address = address || '{"street": "torkocha"}' where name = 'Alisher'; 

UPDATE students set address = REPLACE(address::TEXT, '"Andijon"','"Namangan"')::jsonb where name = 'Sarvar';

select json_build_object(name, address) from students;
select json_build_object(car_model,price) from cars;
select json_agg(json_build_object(name, address)) from students;
select array_agg(json_build_object(name, address)) from students;
select name , array_agg(address) from students GROUP BY name;

select car_model, array_agg(u.id)  from cars c
join users u 
on c.id = u.car_id
GROUP BY car_model;


CREATE TABLE guruhlar(
    name VARCHAR,
    guruh int[] 
);

INSERT INTO guruhlar VALUES 
('node' , ARRAY[1,5,8]),
('python' , ARRAY[2,3,4]),
('java' , ARRAY[6,7,9]);
