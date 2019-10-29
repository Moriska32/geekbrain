
--Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT id, name, desription, price, (select name from shop.catalogs where id = catalog_id ) as catalog, created_at, updated_at
FROM shop.products;


--Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT id, (select name from fligth.cities where label = fligth.from_city) as from_city, (select name from fligth.cities where label = fligth.to_city) as to_city
FROM fligth.fligth;
