/*  лючева€ таблица, к которой присоедин€ем все остальные.
 ћожно обойтись без "Total_Cost", это всегда можно посчитаь отдельно,
 зна€ цену товара и количество приобретенного товара в одном заказе*/

CREATE TABLE main
(
	OrderID int primary key not null,
	DateID int,
	PersonID int,
	Total_Cost int
);

/* заказ характеризуетс€ товаром и его количеством.
	“овары с одинаковым OderID ,соответственно, наход€тс€ в одном заказе
*/
CREATE TABLE orders
(
	OrderID int,
	good_id int,
	quantity_of_goods int
)

/*товар*/
CREATE TABLE goods
(
	good_id int primary key,
	good_name varchar(255),
	good_cost int
)

/*ƒата*/

CREATE TABLE datee
(
	_dateID int primary key,
	_day int,
	_month varchar(20),
	_year_num int 
)
/* ѕокупатель*/
CREATE TABLE person
(
	personID int primary key,
	last_name varchar(100),
	first_name varchar(100),
	gender varchar(10)
)
/*адрес сделки или магазина*/
CREATE TABLE adress
(
	adressID int primary key,
	city varchar(100),
	street varchar(100),
	house int
)