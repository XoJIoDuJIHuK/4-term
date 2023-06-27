USE fitness_center;

CREATE TABLE clients (
  id INT PRIMARY KEY IDENTITY(0,1),
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(20),
  address VARCHAR(255),
  photo varbinary(MAX)
);

CREATE TABLE employees (
  id INT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(20),
  address VARCHAR(255),
  position VARCHAR(255),
  salary DECIMAL(10,2)
);

CREATE TABLE schedule (
  id INT PRIMARY KEY,
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  activity_type VARCHAR(255) NOT NULL,
  employee_id INT NOT NULL,
  max_participants INT,
  taken_seats INT,
  FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE workout_plans (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  created_at DATETIME NOT NULL,
  author VARCHAR(255) NOT NULL
);

CREATE TABLE client_plans (
  id INT PRIMARY KEY,
  client_id INT NOT NULL,
  plan_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  progress INT,
  FOREIGN KEY (client_id) REFERENCES clients(id),
  FOREIGN KEY (plan_id) REFERENCES workout_plans(id)
);