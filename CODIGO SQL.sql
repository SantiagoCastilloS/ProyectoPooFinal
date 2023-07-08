CREATE DATABASE ventas_data;


CREATE TABLE usuario(
	id_usuario NUMERIC (4) PRIMARY KEY,
	nombre_usuario VARCHAR (50),
	email_usuario VARCHAR (50), 
	contraseña_usuario VARCHAR (50),
	telefono_usuario VARCHAR(20),
	dni_usuario CHAR (10)
);

CREATE TABLE vendedor(
	id_ven NUMERIC (4) PRIMARY KEY,
	nombre_ven VARCHAR (50),
	descripcion_ven VARCHAR (100),
	direccion_ven VARCHAR (70),
	telefono_ven VARCHAR (20),
	email_ven VARCHAR (50),
	valoracion_ven NUMERIC (2,1),
	nroventas NUMERIC (5)
);

CREATE TABLE categoria(
	id_categoria NUMERIC(10),
	nombreC VARCHAR(50),
	PRIMARY KEY (id_categoria)
);

CREATE TABLE producto(
	id_producto NUMERIC(4) PRIMARY KEY,
	nombre_producto VARCHAR(100),
	descripcion_producto VARCHAR(300),
	precio NUMERIC(8,2),
	id_ven NUMERIC (4),
	id_categoria NUMERIC (10),
	FOREIGN KEY (id_ven) REFERENCES vendedor (id_ven),
	FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);
ALTER TABLE producto ADD COLUMN urlImage VARCHAR (30000);
CREATE TABLE pedido(
	id_pedido NUMERIC(10),
	id_usuario NUMERIC(4),
	fecha VARCHAR(10),
	monto NUMERIC(8,2),
	PRIMARY KEY (id_pedido),
	FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);
CREATE TABLE detalle_pedido(
	id_pedido NUMERIC(10),
	id_producto NUMERIC(4),
	precio NUMERIC(8,2),
	cantidad NUMERIC(3),
	FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
	FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);

INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (1,'Jose Rodriguez','joserodriguez1996@gmail.com','1996JR2705','51264857159','2645815931');
INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (2,'Maria Fernandez','mariafernandez001@gmail.com','mariaF1988','52254831597','2541064809');
INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (3,'Camilo Huamani','camilohuamani007@gmail.com','CH007DFP12','51542648210','5241036970');
INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (4,'César Pinedo','cesarp96690224@gmail.com','ces1996feb','51258945619','5201459703');
CREATE SEQUENCE secuencia_usuario START WITH 5;
INSERT INTO cliente VALUES (nextval(secuencia_usuario), ?, ?, ?, ?, ?);

INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion_ven, nroventas) VALUES(1,'GameConnect','Venta de consolas, disponible 8 horas','Av. Elmer Faucett',994389483,'hanna@gmail.com',7,1500);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion_ven, nroventas) VALUES(2,'FreshFridge','Venta de refrigeradoras, disponible 5 horas','Av. Aviación',972747923,'beto@hotmail.com',4,1200);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion_ven, nroventas) VALUES(3,'AudioVerse','Venta de audífonos, disponible 15 horas','Av. La Marina',9750264504,'samuel@gmail.com',9,2000);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion_ven, nroventas) VALUES(4,'MobileZone','Venta de celulares, disponible 12 horas','Av. Elmer Faucett',965025857,'ale.32332@gmail.com',5,1300);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion_ven, nroventas) VALUES(5,'TechHaven','Venta de harware, disponible 18 horas','Av. Aviación',983073458,'nest7748@outlook.com',8,2500);


INSERT INTO categoria(id_categoria, nombreC) VALUES (1,'Refrigeradoras');
INSERT INTO categoria(id_categoria, nombreC) VALUES (2,'Celulares');
INSERT INTO categoria(id_categoria, nombreC) VALUES (3,'Computo');
INSERT INTO categoria(id_categoria, nombreC) VALUES (4,'Audifonos');
INSERT INTO categoria(id_categoria, nombreC) VALUES (5,'Consolas');

INSERT INTO producto VALUES (0001,'Samsung','Refrigerador Samsung 361L No Frost Rt35K5930S8 Plata',1950, 0002, 1);
INSERT INTO producto VALUES (0002,'LG','Refrigerador LG 312L No Frost GT32WPPDC Plateado', 1900, 0002, 0001);
INSERT INTO producto VALUES (0003,'Electrolux','Refrigerador Side by Side Electrolux', 3000, 0002, 0001);
INSERT INTO producto VALUES (0004,'Mabe','Refrigerador 250 lt RMA255FYPG', 1399, 0002, 0001);
INSERT INTO producto VALUES (0005,'Hisense','Refrigerador Hisense 418L Top Mount', 1600, 0002, 0001);
INSERT INTO producto VALUES (0006,'Samsung','Refrigerador 361Lt Twin Cooling Silver', 1900, 0002, 0001);

INSERT INTO producto VALUES (0007,'Xiaomi','Smartphone POCO X5 Pro 5G Black 8GB256GB', 1600 ,0004, 0002);
INSERT INTO producto VALUES (0008,'Samsung','Smartphone Galaxy A54 128GB 6GB 5G', 1400,0004, 0002);
INSERT INTO producto VALUES (0009,'Realme','Smartphone Realme C55 256GB 8GB Ram 64Mpx Negro', 1000 ,0004, 0002); #-25%
INSERT INTO producto VALUES (0010,'Apple','Smartphone Apple iPhone 12 - 64GB - Negro', 4900,0004, 0002); #-47%
INSERT INTO producto VALUES (0011,'Motorola','Smartphone Motorola Moto E30 32GB 2GB GRIS', 5900 ,0004, 0002); #-27%
INSERT INTO producto VALUES (0012,'Honor','Smartphone HONOR MAGIC 5 LITE 5G 6+128GB', 1500 ,0004, 0002); #-13%

INSERT INTO producto VALUES (0013,'Asus Nvidia', 'Tarjeta de video ASUS NVIDIA GeForce RTX 3080 Ti, 12GB GDDR6X, PCI-E',14700 ,5, 0003);
INSERT INTO producto VALUES (0014,'Acer', 'Laptop Acer Aspire 3 AMD Ryzen 5 Serie 7520U 8GB RAM 256GB SSD 15.6"',2600 ,5, 0003);
INSERT INTO producto VALUES (0015,'Teros', 'Monitor TEROS 21.5 75hz IPS FULL HD 5MS HDMI VGA Monitor GAMING GAMER',699 ,0005, 0003);
INSERT INTO producto VALUES (0016,'Razer', 'Teclado Razer Blackwidow V3 Tenkeyless Mechanical español',475 ,0005, 0003);
INSERT INTO producto VALUES (0017,'Epson', 'IMPRESORA MULTIFUNCIONAL EPSON ECOTANK L5590 USBLANWI-FI',1999 ,0005, 0003);
INSERT INTO producto VALUES (0018,'Kingston','MEMORIA USB 3.2 KINGSTON EXODIA 128 GB NEGRO',90 ,0005, 0003);

INSERT INTO producto VALUES (0019,'Skullcandy','Audífonos Inalámbricos Skullcandy Bluetooth',559.00  ,0003, 0004);  #0%
INSERT INTO producto VALUES (0020,'Sony','AUDIFONOS C NOISE CANCELLING', 1499.00,0003, 0004);  #-40%
INSERT INTO producto VALUES (0021,'Xiaomi','Audifonos Xiaomi Redmi Buds 3 Youth Lite Edition',129.90 ,0003, 0004);  #-42%
INSERT INTO producto VALUES (0022,'Cc Group','Mini Audífono Bluetooth Inalámbrico S530 - Blanco', 19.99  ,0003, 0004);  #-50%
INSERT INTO producto VALUES (0023,'Generico','Audifonos Inalambricos Bluetooth Handsfree',99 ,0003, 0004);  #-51%
INSERT INTO producto VALUES (0024,'Apple','AirPods Pro (2da generación)', 1399,0003, 0004);  #-21%

INSERT INTO producto VALUES (0025,'Playstation 5','Consola Playstation 5 con lector de discos Ps5',2700 ,0001, 0005);  #3%
INSERT INTO producto VALUES (0026,'Xbox','Nueva consola Xbox Series S 512 Gb',1430 ,0001, 0005);  #9%
INSERT INTO producto VALUES (0027,'Playstation 5','Mando Playstation 5 Dualsense Midnight Black',349.90 ,0001, 0005);  #25%
INSERT INTO producto VALUES (0028,'Nintendo Switch','Consola Nintendo Switch Oled The Legend Of Zelda: Totk',1759.00 ,0001, 0005);  #20%

UPDATE producto SET urlImage = 'https://mercury.vtexassets.com/arquivos/ids/10425483-1200-1200?v=638042323745800000&width=1200&height=1200&aspect=true' WHERE id_producto = 1;
UPDATE producto SET urlImage = 'https://wongfood.vtexassets.com/arquivos/ids/635836/LG-Refrigeradora-312-Lt-GT32WPPDC-Door-Cooling-1-70676907.jpg?v=638211729690470000' WHERE id_producto = 2;
UPDATE producto SET urlImage = 'https://vicmark.com.pe/wp-content/uploads/2022/12/ERQU40E2HSS.jpg' WHERE id_producto = 3;
UPDATE producto SET urlImage = 'https://falabella.scene7.com/is/image/FalabellaPE/18395008_2?wid=800&hei=800&qlt=70' WHERE id_producto = 4;
UPDATE producto SET urlImage = 'https://falabella.scene7.com/is/image/FalabellaPE/882259102_01?wid=800&hei=800&qlt=70' WHERE id_producto = 5;
UPDATE producto SET urlImage = 'https://s7d2.scene7.com/is/image/TottusPE/42370728_0?wid=1500&hei=1500&qlt=70' WHERE id_producto = 6;
UPDATE producto SET urlImage = 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_118126970_1977318_1?wid=800&hei=800&qlt=70' WHERE id_producto = 7;
UPDATE producto SET urlImage = 'https://promart.vteximg.com.br/arquivos/ids/6998034-1000-1000/image-25ab123bb70f4dfc9e841ec8e397f996.jpg?v=638194270540730000' WHERE id_producto = 8;
UPDATE producto SET urlImage = 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_121698469_3148506_1?wid=800&hei=800&qlt=70' WHERE id_producto = 9;
UPDATE producto SET urlImage = 'https://dcmallio.vtexassets.com/arquivos/ids/326076301-800-800?v=638130440267430000&width=800&height=800&aspect=true' WHERE id_producto = 10;
UPDATE producto SET urlImage = 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_119670984_2435117_1?wid=800&hei=800&qlt=70' WHERE id_producto = 11;
UPDATE producto SET urlImage = 'https://oechsle.vteximg.com.br/arquivos/ids/14058392-1500-1500/image-61bd9aceb99245b7a31c48378a84fbaa.jpg?v=638141011869800000' WHERE id_producto = 12;
UPDATE producto SET urlImage = 'https://mesajil.com/wp-content/uploads/2022/09/27375-2.jpg' WHERE id_producto = 13;
UPDATE producto SET urlImage = 'https://falabella.scene7.com/is/image/FalabellaPE/882863264?wid=1500&hei=1500&qlt=70' WHERE id_producto = 14;
UPDATE producto SET urlImage = 'https://oechsle.vteximg.com.br/arquivos/ids/8140716-1000-1000/image-2356c5ba606647dc985823b4a514829d.jpg?v=637849855655170000' WHERE id_producto = 15;
UPDATE producto SET urlImage = 'https://http2.mlstatic.com/D_NQ_NP_680531-MPE45066108487_032021-O.webp' WHERE id_producto = 16;
UPDATE producto SET urlImage = 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_119241697_2270954_3?wid=800&hei=800&qlt=70' WHERE id_producto = 17;
UPDATE producto SET urlImage = 'https://promart.vteximg.com.br/arquivos/ids/1558755-1000-1000/10051385.jpg?v=637635405763500000' WHERE id_producto = 18;
UPDATE producto SET urlImage = 'https://phantom.pe/media/catalog/product/cache/2d2e350e73065c0f42c90f0a12869353/s/k/skullcandy_indy_evo_negro_1.jpg' WHERE id_producto = 19;
UPDATE producto SET urlImage = 'https://s7d2.scene7.com/is/image/TottusPE/42385273_1?wid=800&hei=800&qlt=70' WHERE id_producto = 20;
UPDATE producto SET urlImage = 'https://casemotions.pe/wp-content/uploads/2021/12/RD3LT_0.jpg' WHERE id_producto = 21;
UPDATE producto SET urlImage = 'https://plazavea.vteximg.com.br/arquivos/ids/25891155-512-512/image-86e4ab170dd848fcbbfd2766eb3cc663.jpg' WHERE id_producto = 22;
UPDATE producto SET urlImage = 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_115217156_1041871_1?wid=800&hei=800&qlt=70' WHERE id_producto = 23;
UPDATE producto SET urlImage = 'https://tiendasishop.com/media/catalog/product/a/i/airpods_pro_2nd_gen_pdp_image_position-2__usen.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=700&width=700&canvas=700:700' WHERE id_producto = 24;
UPDATE producto SET urlImage = 'https://plazavea.vteximg.com.br/arquivos/ids/733282-512-512/image-144b6e9d156245afb86e9dd13b340a1c.jpg' WHERE id_producto = 25;
UPDATE producto SET urlImage = 'https://gamecentersac.com/wp-content/uploads/2023/02/GC00947-02.jpg' WHERE id_producto = 26;
UPDATE producto SET urlImage = 'https://oechsle.vteximg.com.br/arquivos/ids/5142276-1000-1000/1945860_6.jpg?v=637684989559630000' WHERE id_producto = 27;
UPDATE producto SET urlImage = 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_120963718_2871527_1?wid=800&hei=800&qlt=70' WHERE id_producto = 28;

CREATE SEQUENCE secuencia_pedido START WITH 1;
INSERT INTO pedido VALUES (nextval(secuencia_pedido), ?, ?, ?);
INSERT INTO pedido VALUES (nextval(secuencia_pedido), 1, '29-05-2023', 10000.00);
INSERT INTO pedido VALUES (nextval(secuencia_pedido), 2, '20-06-2023', 20000.00);
INSERT INTO pedido VALUES (nextval(secuencia_pedido), 3, '23-06-2023', 89999.99);
INSERT INTO pedido VALUES (nextval(secuencia_pedido), 4, '28-06-2023', 79999.99);

INSERT INTO detalle_pedido VALUES (1, 4, 1950, 1);
INSERT INTO detalle_pedido VALUES (1, 1, 1900, 1);
INSERT INTO detalle_pedido VALUES (2, 2, 3000, 1);
INSERT INTO detalle_pedido VALUES (2, 3, 1399, 1);


SELECT cl.nombre, cl.apellPat, cl.apellMat, p.fecha, pr.nombreP, pr.precio, m.nombreM, c.nombreC
FROM cliente cl
INNER JOIN pedido p ON (cl.id_cliente = p.id_cliente)
INNER JOIN detalle_pedido dp ON (p.id_pedido = dp.id_pedido)
INNER JOIN producto pr ON (dp.id_producto = pr.id_producto)
INNER JOIN categoria c ON (pr.id_categoria = c.id_categoria);

SELECT * FROM imagen;

SELECT * 
FROM producto pr
INNER JOIN vendedor v ON (pr.id_ven = v.id_ven)
INNER JOIN categoria c ON (pr.id_categoria = c.id_categoria)

