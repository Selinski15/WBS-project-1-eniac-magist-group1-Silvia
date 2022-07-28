/*

More advanced SQL

------------------------------------------------------------------------------------------------

HOW TO GET THE SCHEMA OF A DATABASE: 
* Windows/Linux: Ctrl + r
* MacOS: Cmd + r

*/

/**************************
***************************
CHALLENGES
***************************
**************************/

-- In SQL we can have many databases, they will show up in the schemas list
-- We must first define which database we will be working with
USE publications; 
 
/**************************
ALIAS
**************************/
-- https://www.w3schools.com/sql/sql_alias.asp

-- 1. From the sales table, change the column name qty to Quantity
Select qty AS Quantity From sales;

-- 2. Assign a new name into the table sales. Select the column order number using the table alias

Select ord_num as "order number" From sales;
/**************************
JOINS
**************************/
-- https://www.w3schools.com/sql/sql_join.asp

/* We will only use LEFT, RIGHT, and INNER joins this week
You do not need to worry about the other types for now */

-- LEFT JOIN example
-- https://www.w3schools.com/sql/sql_join_left.asp
SELECT *
FROM stores s
LEFT JOIN discounts d 
ON d.stor_id = s.stor_id;

-- RIGHT JOIN example
-- https://www.w3schools.com/sql/sql_join_right.asp
SELECT *
FROM stores s
RIGHT JOIN discounts d
ON d.stor_id = s.stor_id;

-- INNER JOIN example
-- https://www.w3schools.com/sql/sql_join_inner.asp
SELECT *
FROM stores s
INNER JOIN discounts d 
ON d.stor_id = s.stor_id;

-- 3. Using LEFT JOIN: in which cities has "Is Anger the Enemy?" been sold?
-- HINT:Select titles.title_ID, titles.title 
# you can add WHERE function after the joins
#Select title_id
#from titels ;
 #Join sales 
# on title.title_id = sales.title_id;


 #where title="Is Anger the Enemy?";

-- 4. Using RIGHT JOIN: select all the books (and show their titles) that have a link to the employee Howard Snyder.
SELECT 
    t.title, e.fname, e.lname
FROM
    employee e
        RIGHT JOIN
    titles t ON e.pub_id = t.pub_id
WHERE
    e.fname = 'Howard'
        AND e.lname = 'Snyder';

-- 5. Using INNER JOIN: select all the authors that have a link (directly or indirectly) with the employee Howard Snyder

SELECT 
    a.au_lname, a.au_fname, e.fname, e.lname
FROM
    authors a
        INNER JOIN
    titleauthor ta ON a.au_id = ta.au_id
        INNER JOIN
    titles t ON ta.title_id = t.title_id
        INNER JOIN
    publishers p ON t.pub_id = p.pub_id
        INNER JOIN
    employee e ON p.pub_id = e.pub_id
WHERE
    e.fname = 'Howard'
        AND e.lname = 'Snyder';


-- 6. Using the JOIN of your choice: Select the book title with higher number of sales (qty)
Select t.title_id, t.title, s.qty
FROM titles t
		Inner join sales s ON t.title_id=s.title_id
	ORDER by s.qty Desc
    Limit 5;
    




/**************************
CASE
**************************/
-- https://www.w3schools.com/sql/sql_case.asp

-- 7. Select everything from the sales table and create a new column called "sales_category" with case conditions to categorise qty
--  * qty >= 50 high sales
--  * 20 <= qty < 50 medium sales
--  * qty < 20 low sales
select *, 
	Case
		WHEN qty >= 50 Then "high sales"
		WHEN qty < 20 THEN "low sales" 
        ELSE "medium sales"
	end as sales_category
FROM sales;

select *
FROM sales
WHERE qty < 20;

-- 8. Adding to your answer from question 7. Find out the total amount of books sold (qty) in each sales category

select   
	Case
		WHEN qty >= 50 Then "high sales"
		WHEN qty < 20 THEN "low sales" 
        ELSE "medium sales"  
	end as sales_category,
	sum(qty)
FROM sales
Where sum(qty) <100
Group by sales_category
ORDER BY sum(qty) DESC
;


select   
	Case
		WHEN qty >= 50 Then "high sales"
		WHEN qty < 20 THEN "low sales" 
        ELSE "medium sales"  
	end as sales_category,
	sum(qty)
FROM sales
Group by sales_category
Having sum(qty) >100
ORDER BY sum(qty) DESC
;

-- i.e. How many books had high sales, how many had medium sales, and how many had low sales


-- 9. Adding to your answer from question 8. Output only those sales categories that have a SUM(qty) greater than 100, and order them in descending order


-- 10. Find out the average book price, per publisher, for the following book types and price categories:
-- book types: business, traditional cook and psychology
-- price categories: <= 5 super low, <= 10 low, <= 15 medium, > 15 high




 






