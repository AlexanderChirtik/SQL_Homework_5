CREATE DATABASE home_work_5;
USE home_work_5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;


-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE VIEW view1 
AS SELECT id, name, cost FROM cars WHERE cost < 25000;


-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW view1 
AS SELECT id, name, cost FROM cars WHERE cost < 30000;  


-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW view2 
AS SELECT id, name, cost FROM cars WHERE name IN ("Skoda", "Audi");


-- ---------------------------------------------Следующая таблица--------------------------------------------------------------------------------------
CREATE TABLE stations (
	train_id_integer INT,
    station_character VARCHAR(30),
    station_time TIME
);

INSERT stations VALUES 
	(110, "San Francisco", "10:00:00"), (110, "Redwood City", "10:54:00"), (110, "Palo Alto", "11:02:00"), 
	(110, "San Jose", "12:35:00"), (120, "San Francisco", "11:00:00"),(120, "Palo Alto", "12:49:00"), (120, "San Jose", "13:30:00");

-- Добавьте новый столбец под названием «время до следующей станции»

SELECT train_id_integer, station_character, station_time,
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id_integer ORDER BY train_id_integer), station_time)
AS time_to_next_station
FROM stations;





