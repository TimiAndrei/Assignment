# Task 3 - Query a MySQL database

First I created a folder "mkdir volume", to mount the database container and then created the container "docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=passwd -v volume:/var/lib/mysql -d mysql".

Next step was to create the database,and first log into the container using "docker exec -it mysql-container mysql -uroot -ppasswd" and then: "Create Database company;"

To import the database creation script I intended to use the < operator, but I got this error:

![Error](https://github.com/TimiAndrei/Assignment/blob/3d8455560e463174b3f349bf9b1461392609d44c/Task3/volume/screenshots/3.3%20problem%20using%20operator%20in%20terminal.png)

I used cat instead "cat company.sql | docker exec -i mysql-container mysql -uroot -ppasswd company", but there was an error in the file:

![Error 2](https://github.com/TimiAndrei/Assignment/blob/3d8455560e463174b3f349bf9b1461392609d44c/Task3/volume/screenshots/3.4%20error%201366.png)

To **fix** the problem I changed the "Consulting" to the respective number, 7:

![Consulting error](https://github.com/TimiAndrei/Assignment/blob/3d8455560e463174b3f349bf9b1461392609d44c/Task3/volume/screenshots/3.5%20error%20-%20switched%20consulting%20to%207.png)

After the fix, the command ran without any error and if we check the tables in the database, we can see everything as needed:

![Tables](https://github.com/TimiAndrei/Assignment/blob/3d8455560e463174b3f349bf9b1461392609d44c/Task3/volume/screenshots/3.6%20successful%20import.png)

Then I created the user and granted privileges using these commands:

- CREATE USER 'Timi'@'%' IDENTIFIED BY 'passwd';
- GRANT ALL PRIVILEGES ON company.\* TO 'Timi'@'%';
- FLUSH PRIVILEGES;

![User](https://github.com/TimiAndrei/Assignment/blob/3d8455560e463174b3f349bf9b1461392609d44c/Task3/volume/screenshots/3.7%20created%20user.png)

To find the average salary for each department I used "SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department;":

![Query](https://github.com/TimiAndrei/Assignment/blob/3d8455560e463174b3f349bf9b1461392609d44c/Task3/volume/screenshots/3.8%20query%20result.png)
