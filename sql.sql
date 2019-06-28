1. Lấy ra danh sách sản phẩm thuộc danh mục "Guitars" có gía lớn hơn 500	

SELECT * FROM products 
INNER JOIN categories 
ON products.categoryID = categories.categoryID 
WHERE categories.categoryName LIKE 'Guitars' AND products.listPrice > 500

2. Lấy ra danh sách sản phẩm được thêm vào tháng 7/2014, có giá lớn hơn 300, và sắp xếp giảm dần theo giá

SELECT * FROM products 
WHERE dateAdded LIKE '2014-07-%' AND listPrice > 300 ORDER BY listPrice DESC

3. Lấy ra danh sách sản phẩm mà tên có chứa chữ "o", thuộc danh mục "Basses", sắp xếp giảm dần theo tên

SELECT * FROM products 
INNER JOIN categories 
ON products.categoryID = categories.categoryID 
WHERE products.productName LIKE '%o%' AND categories.categoryName = 'Basses' ORDER BY products.productName DESC

4. Lấy ra danh sách sản phẩm mà khách hàng sử dụng gmail để mua

SELECT * FROM products 
INNER JOIN orderitems ON products.productID = orderitems.productID  
INNER JOIN orders ON orderitems.orderID =orders.orderID  
INNER JOIN customers ON orders.customerID = customers.customerID 
WHERE customers.emailAddress LIKE '%gmail%'

5. Lấy ra danh sách sản phẩm có giá lơn hơn 300, đăng năm 2014, giới
hạn lấy 4 sản phẩm và sắp xếp theo giảm giá giảm dần

SELECT * FROM `products` 
WHERE listPrice > 300 AND dateAdded LIKE '2014-%-%' 
ORDER BY listPrice DESC LIMIT 4

6. Lấy ra tên thành phố mà khách hàng đã mua sản phẩm "Yamaha FG700S"

SELECT city, productName FROM addresses
INNER JOIN customers ON addresses.addressID = customers.shipAddressID  
INNER JOIN orders ON customers.customerID =orders.customerID  
INNER JOIN orderitems ON orders.orderID = orderitems.orderID
INNER JOIN products ON orderitems.productID = products.productID
WHERE products.productName LIKE 'Yamaha FG700S'