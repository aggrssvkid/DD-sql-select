/* �������� �������, � ������� ������������ ��� ���������.
 ����� �������� ��� "Total_Cost", ��� ������ ����� �������� ��������,
 ���� ���� ������ � ���������� �������������� ������ � ����� ������*/

CREATE TABLE main
(
	OrderID int primary key not null,
	DateID int,
	PersonID int,
	Total_Cost int
);

/* ����� ��������������� ������� � ��� �����������.
	������ � ���������� OderID ,��������������, ��������� � ����� ������
*/
CREATE TABLE orders
(
	OrderID int,
	good_id int,
	quantity_of_goods int
)

/*�����*/
CREATE TABLE goods
(
	good_id int primary key,
	good_name varchar(255),
	good_cost int
)

/*����*/

CREATE TABLE datee
(
	_dateID int primary key,
	_day int,
	_month varchar(20),
	_year_num int 
)
/* ����������*/
CREATE TABLE person
(
	personID int primary key,
	last_name varchar(100),
	first_name varchar(100),
	gender varchar(10)
)
/*����� ������ ��� ��������*/
CREATE TABLE adress
(
	adressID int primary key,
	city varchar(100),
	street varchar(100),
	house int
)