
-- 1.Total Revenue (Total Selling Value)

SELECT SUM(selling_price) AS total_revenue
FROM cardekho;

-- 2.find the Total Revenue by Brand
SELECT brand, SUM(selling_price) AS brand_revenue
FROM cardekho
GROUP BY brand
ORDER BY brand_revenue DESC;

-- 3.Average Selling Price by Fuel Type.
SELECT fuel_type, AVG(selling_price) AS avg_price
FROM cardekho
GROUP BY fuel_type;


-- 4.Find the Fuel Types with Average Price Greater Than 5 Lakhs.
SELECT fuel_type, AVG(selling_price) AS avg_price
FROM cardekho
GROUP BY fuel_type
HAVING AVG(selling_price) > 500000;

-- 5.find the Cars whose name starts with 'M'.
SELECT car_name, brand
FROM cardekho
WHERE car_name REGEXP '^M';


-- 6.Price Category based on Selling Price where selling price < 300000 is 'low',between 300000 and 700000 then 'medium' and 'high'.
SELECT car_name, selling_price,
CASE
    WHEN selling_price < 300000 THEN 'Low'
    WHEN selling_price BETWEEN 300000 AND 700000 THEN 'Medium'
    ELSE 'High'
END AS price_category
FROM cardekho;


-- 7.Count of Cars by Transmission Type.
SELECT transmission_type, COUNT(*) AS total_cars
FROM cardekho
GROUP BY transmission_type;

-- 8.find the cars priced above overall average.
SELECT car_name, selling_price
FROM cardekho
WHERE selling_price >
      (SELECT AVG(selling_price) FROM cardekho);
      
-- 9.Top 3 Brands by Total Revenue.
SELECT brand, SUM(selling_price) AS total_revenue
FROM cardekho
GROUP BY brand
ORDER BY total_revenue DESC
LIMIT 3;

-- 10. Rank Cars by Price.
SELECT car_name, brand, selling_price,
RANK() OVER (ORDER BY selling_price DESC) AS price_rank
FROM cardekho;


-- 11.find out the Cars with Mileage Above Brand Average.
SELECT car_name, brand, mileage
FROM cardekho c
WHERE mileage >
      (SELECT AVG(mileage)
       FROM cardekho
       WHERE brand = c.brand);
       
       
-- 12. Average price by fuel type (by CTE).
WITH avg_price_by_fuel AS (
    SELECT fuel_type, AVG(selling_price) AS avg_price
    FROM cardekho
    GROUP BY fuel_type
)
SELECT * FROM avg_price_by_fuel;












