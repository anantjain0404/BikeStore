SELECT
    ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name) as cust_name,
    cus.city,
    cus.state,
    ord.order_date,
    SUM(ite.quantity) AS 'total_units',
    sum(ite.quantity * ite.list_price) AS 'revenue',
    pro.product_name,
    cat.category_name,
    sto.store_name,
    CONCAT(sta.first_name, ' ', sta.last_name) as 'sales_person'
FROM sales.orders ord
join sales.customers cus
on ord.customer_id = cus.customer_id
join sales.order_items ite
on ord.order_id  = ite.order_id
join production.products pro
on ite.product_id = pro.product_id
join production.categories cat
on pro.category_id = cat.category_id
join sales.stores sto
on ord.store_id = sto.store_id
join sales.staffs sta
on ord.staff_id = sta.staff_id
GROUP BY
ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name),
    cus.city,
    cus.state,
    ord.order_date,
    pro.product_name,
    cat.category_name,
    sto.store_name,
    CONCAT(sta.first_name, ' ', sta.last_name)