/* users tablosu
* 1. id bilgisi PRIMARY KEY olmalıdır
* 2. creation_date girilmezse default şuanki tarih ve zaman olmalıdır
* 3. username ve email bilgisinin UNIQUE olmalıdır ve NULL olmamalıdır
*/
CREATE TABLE users (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(20) UNIQUE NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	creation_date DATE DEFAULT NOW(),
	is_active BOOLEAN
);

--users tablosunda minimum 2 kullanıcı bulunmalıdır. 6 kullanıcı eklendi.

INSERT INTO users(username, email, creation_date, is_active) VALUES('haruntasci', 'haruntasci07@gmail.com','2023-06-15', true);
INSERT INTO users(username, email, creation_date, is_active) VALUES('johndoe', 'johndoe27@gmail.com', '2023-05-12', false);
INSERT INTO users(username, email, creation_date, is_active) VALUES('elonmusk', 'elonmusk06@gmail.com', '2021-02-07', true);
INSERT INTO users(username, email, creation_date, is_active) VALUES('jamesgosling', 'jamesgosling98@gmail.com', '2019-09-26', true);
INSERT INTO users(username, email, creation_date, is_active) VALUES('brendaneich', 'brendaneich123@gmail.com', '2017-01-01', true);
INSERT INTO users(username, email, creation_date, is_active) VALUES('new_user', 'newly_user@gmail.com', '2018-02-01', true);

/* categories tablosu
* 1. id bilgisi PRIMARY KEY olmalıdır
* 2. creation_date girilmezse default şuanki tarih ve zaman olmalıdır
*/
CREATE TABLE categories(
	category_id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL,
	creation_date DATE DEFAULT NOW()
);

--categories tablosunda minimum 3 kategori bulunmalıdır. 9 kategori eklendi.

INSERT INTO categories(name, creation_date) VALUES('chess', '2022-12-30');
INSERT INTO categories(name, creation_date) VALUES('swimming','2021-11-21');
INSERT INTO categories(name, creation_date) VALUES('gardening','2020-09-12');
INSERT INTO categories(name, creation_date) VALUES('travelling', '2016-09-19');
INSERT INTO categories(name, creation_date) VALUES('table tennis','2017-05-12');
INSERT INTO categories(name, creation_date) VALUES('parachuting','2023-04-11');
INSERT INTO categories(name, creation_date) VALUES('travel for food','2019-08-16');
INSERT INTO categories(name, creation_date) VALUES('hiking','2019-07-25');
INSERT INTO categories(name, creation_date) VALUES('fishing','2021-04-12');


/* posts tablosu
* 1. id bilgisi PRIMARY KEY olmalıdır
* 2. creation_date girilmezse default şuanki tarih ve zaman olmalıdır
* 3. Tüm gönderilerin (posts) title ve content bilgisi olmak zorundadır. title bilgisi 50 karakterden uzun olmamalıdır.
* 4. Bir gönderi herhangi bir view_count bilgisi olmadan kayıt edilirse 0 olarak başlangıç değerine sahip olmalıdır.
* 5. Hiçbir gönderi (post) kullanıcı (user) bilgisi olmadan kayıt edilememelidir.
* 6. Hiçbir gönderi (post) kategori (category) bilgisi olmadan kayıt edilememelidir.
* 7. Tablolar arasında FOREIGN KEY ile referans verilerek ilişki kurulmalıdır
*/

CREATE TABLE posts(
	post_id SERIAL PRIMARY KEY,
	user_id INTEGER REFERENCES users(user_id) NOT NULL,
	category_id INTEGER REFERENCES categories(category_id) NOT NULL,
	title VARCHAR(50) NOT NULL,
	content TEXT NOT NULL,
	view_count INTEGER DEFAULT 0,
	creation_date DATE DEFAULT NOW(),
	is_published BOOLEAN
);

-- posts tablosunda farklı kategorilerde, farklı görüntülenme sayılarında ve farklı başlıklarda minimum 50 gönderi bulunmalıdır.
-- 100 gönderi eklendi.

INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 5, 'Scrophulwariaceae', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 48, '2023/01/28', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 8, 'Polygonwaceae', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 117, '2020/10/01', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 1, 'Rosacewae', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 47, '2017/09/25', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 2, 'Apiaceaee', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 150, '2022/03/27', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 3, 'Brassiecaceae', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 196, '2022/08/10', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 1, 'Rosacweae', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 19, '2017/09/05', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 5, 'Capparacweae', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 155, '2021/04/24', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 6, 'Caprifoliacewae', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 194, '2015/07/01', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 8, 'Amaranthaceare', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 130, '2018/08/26', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 6, 'Orchidaceader', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 125, '2020/11/17', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 5, 'Asteraceades', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1, '2019/07/08', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 6, 'Orchidaceaera', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 61, '2016/03/25', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 5, 'Cyperaceaef', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 33, '2015/11/08', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 2, 'Polygonaceaeg', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 125, '2017/10/03', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 1, 'Thymharuneaei', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 40, '2018/04/25', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 3, 'Lycopodiaceaes', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 137, '2016/06/25', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 3, 'Liliaceaes', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 34, '2021/07/14', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 7, 'Poaceaes', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 82, '2016/02/16', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 8, 'Poaceaed', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 117, '2018/08/29', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 4, 'Cyperaceaec', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 140, '2022/07/21', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 2, 'Rutaceaed', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 143, '2019/10/15', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 3, 'Juncaceaed', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 144, '2018/02/06', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 3, 'Scrophulariaceaeda', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 190, '2019/04/30', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 1, 'Resedaceaec', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 31, '2020/04/22', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 4, 'Asteraceaen', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 122, '2016/08/17', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 4, 'Scrophulariaceaed', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 131, '2019/07/05', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 4, 'Opegraphaceaed', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 168, '2019/07/05', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 8, 'Lecideaceaec', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 57, '2019/01/07', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 8, 'Ranunculaceaed', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 6, '2015/07/23', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 2, 'Apocynaceaed', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 10, '2019/12/15', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 7, 'Apiaceaed', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 98, '2018/01/29', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 3, 'Asteraceaea', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 109, '2017/06/03', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 2, 'Euphorbiaceaeg', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 69, '2020/12/26', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 3, 'Polygalaceaey', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 182, '2019/10/12', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 6, 'Brassicaceaet', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 139, '2020/08/03', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 7, 'Acanthaceaer', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 94, '2019/05/16', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 4, 'Fuscideaceaeq', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 171, '2015/07/30', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 6, 'Lecanoraceaew', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 105, '2016/05/23', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 4, 'Orchidaceaee', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 182, '2020/04/06', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 8, 'Apiaceaeg', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 72, '2019/11/11', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 7, 'Dryopteridaceaea', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 96, '2020/11/02', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 8, 'Rosaceaea', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 159, '2021/03/13', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 6, 'Campanulacease', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 20, '2022/04/07', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 1, 'Cuscutaceaex', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 115, '2022/09/20', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 1, 'Asteraceaez', 'Fusce consequat. Nulla nisl. Nunc nisl.', 81, '2020/03/24', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 4, 'Asteraceaex', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 198, '2022/03/29', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 6, 'Rubiaceaec', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 107, '2022/01/27', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 4, 'Cactaceaeb', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 112, '2015/06/20', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 7, 'Parmeliaceaev', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 145, '2016/09/15', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 7, 'Lamiaceaebn', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 74, '2017/08/22', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 6, 'Salicaceaej', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 158, '2021/01/03', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 2, 'Rosaceaeh', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 98, '2019/11/24', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 4, 'Fabaceaeju', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 176, '2019/02/12', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 5, 'Polygonaceaek', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 146, '2022/06/09', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 8, 'Saxifragaceaehy', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 169, '2016/11/04', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 5, 'Verbenaceaeht', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 123, '2019/06/25', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 3, 'Grossulariaceaet', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 188, '2022/12/01', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 1, 'Cyperaceaehy', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 22, '2019/03/22', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 6, 'Polygonaceaeht', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 98, '2021/07/19', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 5, 'Fabaceaehy', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 190, '2017/04/17', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 8, 'Turneraceaeju', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 140, '2017/09/23', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 2, 'Campanulaceaej', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 167, '2019/08/28', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 5, 'Asteraceaej', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 165, '2019/03/03', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 6, 'Scrophulariaceaem', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 43, '2019/12/13', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 8, 'Asteraceaasd', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 16, '2021/11/23', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 6, 'Fabaharun tasci', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 79, '2017/05/18', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 4, 'Cyperaceaeh', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 158, '2016/06/16', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 1, 'Liliaceaen', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 93, '2020/04/30', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 6, 'Campanulaceaek', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 72, '2021/02/19', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 6, 'Fabaceaee', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 40, '2016/04/01', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 1, 'Hydrophyllaceaer', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 50, '2018/08/06', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 8, 'Hydrangeaceaew', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 34, '2016/12/07', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 2, 'Pinaceaeq', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 83, '2016/02/16', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 5, 'Viscaceaee', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 54, '2018/06/24', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 4, 'Pteridaceaew', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 145, '2015/11/05', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 6, 'Asteraceaee', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 83, '2019/06/02', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 9, 'Poaceaer', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 99, '2016/09/07', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 7, 'Apiaceaet', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 43, '2019/12/17', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 2, 'Asteraceaes', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 145, '2021/05/03', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 5, 'Salicaceaef', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 171, '2018/09/30', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 6, 'Poaceaee', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 166, '2018/03/22', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (5, 2, 'Lecanoraceaes', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 150, '2016/06/28', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 1, 'Commelinaceaes', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 187, '2018/11/16', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 8, 'Liliaceaec', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 33, '2016/07/11', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 5, 'Agavaceaed', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 4, '2015/12/12', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 2, 'Hypnaceaev', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 10, '2020/08/23', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 4, 'Asteraceaeb', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 40, '2017/07/18', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 5, 'Asterafsdfs', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1, '2015/08/26', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 5, 'Poaceaem', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 162, '2015/07/25', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 2, 'Fabaceael', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 48, '2017/04/23', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 4, 'Orchidaceaek', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 114, '2022/07/24', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 2, 'Cyperaceaej', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 54, '2016/06/30', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 3, 'Geraniaceaei', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 79, '2017/01/24', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (1, 1, 'Asteraceaeg', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 106, '2018/03/04', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 4, 'Asteraceaef', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 3, '2019/03/14', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 9, 'Fabaceael', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 156, '2020/09/07', false);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (3, 6, 'Collemataceaed', 'Fusce consequat. Nulla nisl. Nunc nisl.', 180, '2017/11/27', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (4, 3, 'Salicaceaec', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 115, '2017/02/18', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (2, 5, 'Polemoniaceaeb', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 198, '2016/06/08', true);
INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published) VALUES (6, 4, 'Rhamnaceaea', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 102, '2015/12/24', false);

/* comments tablosu 
* 1. id bilgisi PRIMARY KEY olmalıdır
* 2. creation_date girilmezse default şuanki tarih ve zaman olmalıdır
* 3. Hiçbir yorum (comment) gönderi (post) bilgisi olmadan kayıt edilememelidir.
* 4. Tüm yorumların (comment) comment bilgisi olmak zorundadır.
* 5. Yorumlar (comment) kullanıcı (user) bilgisi içerebilir veya içermeyebilirler.
*/

CREATE TABLE comments(
	comment_id SERIAL PRIMARY KEY,
	post_id INTEGER REFERENCES posts(post_id) NOT NULL,
	user_id INTEGER REFERENCES users(user_id),
	comment TEXT NOT NULL,
	creation_date DATE DEFAULT NOW(),
	is_confirmed BOOLEAN
);

-- comments tablosunda farklı gönderilere ait, farklı kullanıcılara ait veya kullanıcısı olmayan toplam minimum 250 yorum bulunmalıdır.
-- 300 yorum eklendi.

INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (28, 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus.', '2023/06/13', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (99, 3, 'Nunc nisl.', '2022/03/09', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (17, 1, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', '2023/03/19', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (10, 5, 'Aliquam sit amet diam in magna bibendum imperdiet.', '2018/09/23', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (66, 1, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', '2017/07/24', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (49, 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', '2019/03/30', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (100, 1, 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', '2019/04/14', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (4, 5, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2021/01/29', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (64, 3, 'Proin interdum mauris non ligula pellentesque ultrices.', '2020/07/08', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (93, 2, 'Suspendisse ornare consequat lectus.', '2018/03/18', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (78, 1, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2019/09/01', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (61, 4, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', '2021/02/17', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (74, 5, 'Sed ante.', '2018/12/18', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (30, 3, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', '2019/09/18', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (22, 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2018/03/15', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (38, 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', '2020/03/28', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (9, 4, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '2022/12/15', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (61, 3, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', '2020/03/31', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (40, 5, 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2023/05/02', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (25, 4, 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', '2023/03/08', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (7, 3, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.', '2021/05/07', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (77, 4, 'Pellentesque eget nunc.', '2019/02/15', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (60, 5, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', '2017/09/02', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (57, 4, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', '2019/07/08', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (69, 4, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2023/04/02', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (41, 5, 'Morbi vel lectus in quam fringilla rhoncus.', '2023/02/11', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (27, 1, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2018/12/16', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (82, 2, 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', '2018/11/01', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (83, 5, 'Ut at dolor quis odio consequat varius.', '2019/02/20', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (93, 2, 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', '2020/10/06', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (21, 5, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2018/11/14', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (29, 3, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', '2019/03/20', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (2, 5, 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', '2018/08/29', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (24, 1, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', '2019/12/02', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (98, 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius.', '2021/08/20', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (13, 5, 'Vivamus in felis eu sapien cursus vestibulum.', '2019/03/01', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (12, 3, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '2018/06/29', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (77, 5, 'Vivamus vestibulum sagittis sapien.', '2021/09/02', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (73, 2, 'Nam dui.', '2021/10/24', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (77, 2, 'Vivamus tortor.', '2019/04/25', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (46, 5, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2021/04/22', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (87, 3, 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', '2019/06/24', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (56, 4, 'Praesent blandit.', '2019/02/11', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (69, 3, 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', '2023/01/15', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (6, 1, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2021/06/10', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (83, 3, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', '2019/01/23', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (95, 5, 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', '2021/09/03', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (73, 4, 'Donec dapibus.', '2020/12/05', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (100, 2, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', '2017/10/13', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (100, 1, 'In hac habitasse platea dictumst.', '2020/05/31', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (27, 5, 'Vivamus vel nulla eget eros elementum pellentesque.', '2021/03/30', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (42, 3, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', '2021/08/10', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (53, 5, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', '2019/08/24', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (11, 5, 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.', '2019/08/19', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (26, 4, 'Phasellus in felis.', '2022/02/25', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (16, 3, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2020/07/17', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (87, 3, 'Nulla nisl. Nunc nisl.', '2021/05/21', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (71, 3, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', '2022/08/28', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (45, 5, 'Suspendisse accumsan tortor quis turpis. Sed ante.', '2021/10/28', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (51, 1, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', '2021/12/04', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (79, 4, 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', '2022/02/13', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (43, 4, 'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', '2021/12/04', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (24, 2, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', '2023/05/20', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (76, 4, 'Mauris lacinia sapien quis libero.', '2017/08/16', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (13, 1, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2023/04/20', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (6, 3, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', '2023/02/15', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (59, 3, 'Aenean lectus.', '2019/07/08', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (31, 2, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2018/12/23', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (1, 2, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2020/08/22', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (99, 2, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2023/05/22', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (33, 2, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', '2018/04/13', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (87, 4, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2021/03/31', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (16, 5, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2019/01/07', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (35, 2, 'Integer tincidunt ante vel ipsum.', '2018/09/16', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (52, 2, 'Morbi a ipsum. Integer a nibh.', '2019/04/21', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (38, 3, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2019/12/28', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (35, 5, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', '2022/01/29', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (23, 2, 'Integer a nibh. In quis justo.', '2023/03/23', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (84, 3, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', '2020/04/05', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (2, 5, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2019/03/19', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (39, 3, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', '2017/08/20', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (41, 3, 'Sed sagittis.', '2023/05/06', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (36, 3, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2020/11/08', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (94, 4, 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', '2022/05/09', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (35, 4, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2017/12/11', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (22, 3, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2022/12/24', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (35, 5, 'Duis mattis egestas metus. Aenean fermentum.', '2019/12/30', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (39, 5, 'Pellentesque eget nunc.', '2023/01/21', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (37, 5, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2020/08/16', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (83, 5, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', '2017/12/28', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (16, 1, 'Suspendisse accumsan tortor quis turpis.', '2018/12/05', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (47, 4, 'Nulla facilisi.', '2018/01/25', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (99, 3, 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', '2022/09/26', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (31, 3, 'Suspendisse accumsan tortor quis turpis. Sed ante.', '2023/04/07', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (18, 5, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', '2021/01/05', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (55, 4, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.', '2020/05/24', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (50, 2, 'Praesent blandit.', '2021/03/17', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (71, 2, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', '2020/02/21', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (30, 5, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2020/04/06', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (97, 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2018/02/14', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (25, 3, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', '2023/03/25', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (51, 2, 'Suspendisse accumsan tortor quis turpis. Sed ante.', '2019/04/29', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (16, 4, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', '2022/04/18', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (44, 2, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', '2017/10/05', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (86, 1, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', '2018/05/25', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (65, 3, 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', '2021/03/08', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (84, 5, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2019/12/21', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (56, 3, 'Vestibulum ac est lacinia nisi venenatis tristique.', '2019/04/25', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (43, 5, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2018/06/14', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (51, 4, 'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2020/06/23', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (6, 1, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', '2019/03/22', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (95, 3, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', '2017/09/11', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (23, 1, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', '2019/12/04', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (48, 1, 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', '2018/03/19', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (9, 3, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2022/02/20', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (55, 1, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2022/02/26', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (74, 3, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2021/07/26', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (52, 4, 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', '2023/04/14', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (48, 2, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2022/11/17', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (51, 1, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2021/07/01', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (96, 5, 'Morbi vel lectus in quam fringilla rhoncus.', '2021/10/16', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (13, 3, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2022/03/17', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (17, 5, 'Suspendisse potenti. In eleifend quam a odio.', '2018/10/23', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (88, 5, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2017/07/20', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (91, 3, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', '2019/05/21', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (60, 1, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '2017/10/24', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (13, 3, 'Proin at turpis a pede posuere nonummy. Integer non velit.', '2018/09/04', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (88, 3, 'Pellentesque at nulla. Suspendisse potenti.', '2021/10/11', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (91, 2, 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2018/11/02', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (32, 2, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', '2020/03/03', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (24, 1, 'In sagittis dui vel nisl.', '2022/07/25', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (10, 1, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', '2019/09/18', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (75, 3, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', '2020/10/25', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (97, 4, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '2017/10/22', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (58, 1, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', '2021/01/12', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (34, 2, 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', '2022/10/18', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (40, 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius.', '2018/11/08', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (71, 3, 'Duis bibendum.', '2023/03/12', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (70, 2, 'Suspendisse potenti.', '2022/02/15', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (42, 5, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', '2020/06/11', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (43, 4, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2020/07/20', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (26, 5, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', '2021/09/09', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (2, 3, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', '2021/06/23', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (33, 1, 'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', '2018/11/15', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (18, 2, 'Mauris lacinia sapien quis libero.', '2022/08/23', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (88, 2, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2019/04/25', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (85, 3, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2021/07/29', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (87, 4, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '2023/03/26', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (9, 3, 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', '2021/10/12', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (16, 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', '2020/12/02', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (39, 5, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', '2018/06/20', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (54, 5, 'Sed accumsan felis.', '2021/10/10', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (20, 1, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', '2021/05/11', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (45, 2, 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', '2020/02/13', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (91, 5, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2020/03/03', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (55, 2, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', '2021/11/28', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (89, 5, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', '2023/01/25', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (28, 1, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', '2020/03/01', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (46, 2, 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', '2019/10/03', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (64, 2, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', '2021/10/20', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (20, 4, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2022/05/09', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (61, 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', '2022/11/24', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (22, 1, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', '2020/11/14', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (18, 5, 'Proin at turpis a pede posuere nonummy.', '2018/06/21', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (46, 1, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', '2022/11/24', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (55, 3, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', '2021/05/28', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (91, 4, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', '2021/12/25', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (46, 4, 'Integer ac neque. Duis bibendum.', '2022/07/29', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (7, 2, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', '2023/02/06', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (6, 5, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', '2019/06/19', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (67, 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2022/01/26', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (74, 3, 'Aliquam sit amet diam in magna bibendum imperdiet.', '2018/06/19', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (4, 2, 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '2017/11/18', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (18, 4, 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2020/06/08', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (90, 5, 'Aliquam sit amet diam in magna bibendum imperdiet.', '2017/12/08', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (71, 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', '2021/04/23', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (52, 2, 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', '2021/08/03', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (47, 2, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', '2022/10/12', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (82, 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', '2021/08/14', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (20, 2, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2021/04/08', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (26, 1, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', '2022/10/27', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (29, 3, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', '2019/03/12', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (49, 5, 'Ut at dolor quis odio consequat varius. Integer ac leo.', '2021/04/18', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (34, 3, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', '2021/04/23', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (56, 4, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', '2018/01/27', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (64, 5, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', '2019/09/03', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (34, 1, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', '2021/01/29', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (88, 5, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2020/03/25', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (52, 4, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', '2019/12/15', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (55, 1, 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', '2019/01/05', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (5, 1, 'Suspendisse ornare consequat lectus.', '2019/04/29', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (92, 2, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', '2021/02/18', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (48, 5, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', '2021/02/06', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (25, 1, 'Curabitur at ipsum ac tellus semper interdum.', '2019/08/27', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (64, 3, 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', '2019/01/13', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (60, 4, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', '2023/06/13', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (80, 5, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2019/01/13', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (66, 5, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '2020/02/23', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (80, 4, 'Vivamus tortor. Duis mattis egestas metus.', '2018/10/20', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (27, 1, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2018/02/14', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (14, 5, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', '2022/08/03', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (16, 5, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', '2017/10/16', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (46, 4, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', '2022/09/22', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (63, 4, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2021/06/16', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (14, 4, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2020/04/27', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (74, 2, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', '2021/12/15', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (66, 5, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', '2020/12/13', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (69, 4, 'In eleifend quam a odio. In hac habitasse platea dictumst.', '2020/12/30', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (50, 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2023/06/11', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (84, 5, 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', '2022/06/04', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (92, 3, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', '2020/10/08', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (77, 1, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', '2020/09/16', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (12, 5, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', '2018/02/22', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (99, 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', '2021/10/03', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (18, 2, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2022/12/09', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (85, 5, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2018/06/03', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (3, 2, 'Praesent blandit.', '2020/04/20', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (66, 4, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2018/12/29', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (12, 5, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', '2020/11/12', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (72, 2, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2018/06/14', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (76, 2, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2019/02/09', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (81, 5, 'Suspendisse potenti.', '2019/05/27', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (52, 3, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2018/07/19', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (30, 5, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', '2017/07/09', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (2, 1, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', '2018/07/16', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (49, 3, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', '2020/03/16', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (46, 5, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', '2020/09/05', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (30, 4, 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2021/12/22', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (34, 1, 'Integer ac neque.', '2020/07/31', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (30, 2, 'Donec semper sapien a libero.', '2019/12/23', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (41, 3, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2023/01/09', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (56, 3, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', '2019/10/14', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (29, 5, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', '2020/04/19', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (33, 4, 'Suspendisse potenti.', '2020/01/26', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (86, 1, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', '2019/10/02', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (78, 1, 'Praesent blandit.', '2018/09/18', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (95, 2, 'Fusce posuere felis sed lacus.', '2018/12/28', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (1, 4, 'Aliquam sit amet diam in magna bibendum imperdiet.', '2019/12/10', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (7, 2, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.', '2018/03/18', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (59, 3, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', '2019/08/25', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (15, 1, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', '2021/10/18', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (97, 3, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', '2023/02/17', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (25, 5, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', '2023/04/28', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (77, 1, 'Nulla nisl. Nunc nisl.', '2022/06/03', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (79, 5, 'Suspendisse potenti. In eleifend quam a odio.', '2019/09/19', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (85, 2, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', '2022/07/24', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (49, 4, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', '2022/01/02', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (73, 4, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', '2023/03/27', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (85, 1, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2023/06/05', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (22, 1, 'Aliquam quis turpis eget elit sodales scelerisque.', '2018/08/12', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (93, 2, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2017/07/28', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (91, 1, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', '2023/02/23', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (90, 5, 'Curabitur convallis.', '2022/01/28', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (74, 5, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2019/01/12', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (42, 3, 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2017/07/10', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (49, 5, 'Integer ac leo.', '2019/10/25', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (64, 2, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.', '2023/02/12', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (88, 4, 'Quisque id justo sit amet sapien dignissim vestibulum.', '2020/05/29', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (62, 5, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2022/08/28', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (67, 3, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', '2020/08/06', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (46, 4, 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', '2022/10/09', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (96, 2, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', '2021/12/25', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (15, 4, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', '2021/05/02', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (89, 5, 'Nullam molestie nibh in lectus. Pellentesque at nulla.', '2019/05/24', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (97, 3, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', '2020/06/22', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (61, 4, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', '2017/12/08', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (81, 2, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2020/04/02', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (11, 1, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', '2017/07/05', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (51, 5, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', '2017/06/30', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (22, 3, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', '2021/03/24', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (26, 2, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2019/12/21', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (17, 4, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', '2019/12/30', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (87, 1, 'Donec dapibus.', '2022/09/03', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (9, 3, 'Etiam faucibus cursus urna. Ut tellus.', '2018/08/31', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (59, 1, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2020/06/25', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (87, 2, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', '2019/05/10', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (87, 1, 'In quis justo.', '2022/04/07', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (1, 1, 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '2018/09/28', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (21, 4, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2021/01/30', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (71, 5, 'Curabitur at ipsum ac tellus semper interdum.', '2018/01/26', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (53, 5, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', '2019/10/23', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (1, 1, 'Vivamus tortor.', '2018/04/29', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (20, 5, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', '2018/02/26', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (73, 2, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', '2021/12/10', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (51, 5, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', '2021/08/27', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (1, 2, 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2017/11/21', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (63, 3, 'Duis mattis egestas metus.', '2019/01/22', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (58, 5, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', '2020/12/01', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (31, 1, 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', '2017/07/05', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (15, 4, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2017/11/02', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (87, 3, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', '2019/01/01', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (15, 4, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', '2019/06/25', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (25, 1, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2020/02/01', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (10, 4, 'Ut at dolor quis odio consequat varius.', '2018/12/16', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (50, 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', '2021/06/11', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (18, 2, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', '2018/08/14', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (60, 1, 'Curabitur gravida nisi at nibh.', '2017/07/13', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (17, 5, 'Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.', '2021/07/30', true);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (95, 1, 'Pellentesque ultrices mattis odio. Donec vitae nisi.', '2022/02/24', false);
INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed) VALUES (72, 5, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2020/12/08', true);

/*Veritabanında Gerçekleştirmek İstediğimiz İşlemler*/

-- 1. Tüm blog yazılarını başlıkları, yazarları ve kategorileriyle birlikte getirin.

SELECT posts.title, users.username, categories.name AS category FROM posts
JOIN users ON users.user_id = posts.user_id
JOIN categories ON categories.category_id = posts.category_id;

-- 2. En son yayınlanan 5 blog yazısını başlıkları, yazarları ve yayın tarihleriyle birlikte alın.

SELECT posts.title, users.username, posts.creation_Date FROM posts
JOIN users ON posts.user_id = users.user_id
ORDER BY creation_date DESC
LIMIT 5;

-- 3. Her blog yazısı için yorum sayısını gösterin.
-- LEFT JOIN kullanarak yorum sayısı 0 olanları da göstermiş olduk.

SELECT posts.title, COUNT(comments.post_id) FROM posts
LEFT JOIN comments ON posts.post_id = comments.post_id
GROUP BY posts.title;

-- 4. Tüm kayıtlı kullanıcıların kullanıcı adlarını ve e-posta adreslerini gösterin.

SELECT username, email FROM users
WHERE is_active = true;

-- 5. En son 10 yorumu, ilgili gönderi başlıklarıyla birlikte alın.

SELECT comments.comment, posts.title FROM comments
JOIN posts ON comments.post_id = posts.post_id
ORDER BY comments.creation_date DESC
LIMIT 10;

-- 6. Belirli bir kullanıcı tarafından yazılan tüm blog yazılarını bulun.

SELECT users.username, posts.content FROM users
INNER JOIN posts ON users.user_id = posts.user_id
WHERE users.user_id = 3;

-- 7. Her kullanıcının yazdığı toplam gönderi sayısını alın.

SELECT users.username, COUNT(posts.post_id) FROM posts
RIGHT JOIN users ON posts.user_id = users.user_id
GROUP BY users.username;

-- 8. Her kategoriyi, kategorideki gönderi sayısıyla birlikte gösterin.

SELECT categories.name, COUNT(post_id) FROM posts
RIGHT JOIN categories ON posts.category_id = categories.category_id
GROUP BY categories.category_id;

-- 9. Gönderi sayısına göre en popüler kategoriyi bulun.

SELECT categories.name, COUNT(posts.post_id) AS post_count  FROM posts
JOIN categories ON posts.category_id = categories.category_id
GROUP BY categories.name
ORDER BY COUNT(posts.post_id) DESC
LIMIT 1;

-- 10. Gönderilerindeki toplam görüntülenme sayısına göre en popüler kategoriyi bulun.

SELECT categories.name, SUM(view_count) AS total FROM posts
JOIN categories ON posts.category_id = categories.category_id
GROUP BY categories.name
ORDER BY total DESC
LIMIT 1;

-- 11.  En fazla yoruma sahip gönderiyi alın

SELECT posts.title, COUNT(comment_id) FROM comments
JOIN posts ON comments.post_id = posts.post_id
GROUP BY posts.title
ORDER BY count DESC
LIMIT 1;

-- 12. Belirli bir gönderinin yazarının kullanıcı adını ve e-posta adresini gösterin.

SELECT users.username, users.email FROM users
JOIN posts ON users.user_id = posts.user_id
WHERE posts.post_id = 87;

-- 13. Başlık veya içeriklerinde belirli bir anahtar kelime bulunan tüm gönderileri bulun.

SELECT * FROM posts
WHERE title ILIKE '%lorem%' OR content ILIKE '%lorem%';

-- 14. Belirli bir kullanıcının en son yorumunu gösterin

SELECT users.username, comments.comment FROM comments
JOIN users ON comments.user_id = users.user_id
WHERE users.user_id = 3
ORDER BY comments.creation_date DESC
LIMIT 1;

-- 15. Gönderi başına ortalama yorum sayısını bulun.
-- LEFT JOIN diyerek yorumu olmayan gönderileri de dahil ettik.

SELECT ROUND(AVG(count),1) AS avg_comment FROM 
(
SELECT posts.post_id, COUNT(comments.comment_id) FROM posts
LEFT JOIN comments ON posts.post_id = comments.post_id
GROUP BY posts.post_id
) AS comments;

-- 16. Son 30 günde yayınlanan gönderileri gösterin.

SELECT * FROM posts
WHERE creation_date > NOW() - INTERVAL '30 days';

-- 17. Belirli bir kullanıcının yaptığı yorumları alın.

SELECT comment FROM comments 
WHERE user_id = 5;

-- 18. Belirli bir kategoriye ait tüm gönderileri bulun

SELECT categories.name AS category_name, posts.title, posts.content FROM posts 
INNER JOIN categories ON posts.category_id = categories.category_id
WHERE categories.category_id = 4;

-- 19. 5'ten az yazıya sahip kategorileri bulun.

SELECT categories.name, COUNT(posts.category_id) FROM posts
RIGHT JOIN categories ON posts.category_id = categories.category_id
GROUP BY categories.name  
HAVING COUNT(posts.category_id) < 5;

-- 20. Hem bir yazı hem de bir yoruma sahip olan kullanıcıları gösterin.

SELECT DISTINCT(users.username) FROM users 
JOIN posts ON users.user_id = posts.user_id
JOIN comments ON posts.user_id = comments.user_id;

-- 21. En az 2 farklı yazıya yorum yapmış kullanıcıları alın.

SELECT users.username FROM users
JOIN comments ON users.user_id = comments.user_id
GROUP BY users.username
HAVING COUNT(comments.post_id) >= 2;

-- 22. En az 3 yazıya sahip kategorileri görüntüleyin.

SELECT categories.name FROM posts
JOIN categories ON posts.category_id = categories.category_id
GROUP BY categories.name
HAVING COUNT(posts.post_id) >= 3;

-- 23. 5'ten fazla blog yazısı yazan yazarları bulun.

SELECT users.username FROM posts
JOIN users ON posts.user_id = users.user_id
GROUP BY users.username
HAVING COUNT(posts.post_id) > 5;

-- 24. Bir blog yazısı yazmış veya bir yorum yapmış kullanıcıların e-posta adreslerini görüntüleyin. (UNION kullanarak)
-- "Bir blog yazısı yazmış veya bir yorum yapmış" kısmı en az bir blog yazısı yazmış veya bir yorum yapmış olarak kabul edildi.

(SELECT users.email FROM users
JOIN posts ON users.user_id = posts.user_id
GROUP BY users.email
HAVING COUNT(posts.user_id) >= 1
)
UNION
(
SELECT users.email FROM users
JOIN comments ON users.user_id = comments.user_id
GROUP BY users.email
HAVING COUNT(comments.user_id) >= 1
);

-- 25. Bir blog yazısı yazmış ancak hiç yorum yapmamış yazarları bulun.

SELECT DISTINCT(users.username) FROM users
JOIN posts ON users.user_id = posts.user_id
LEFT JOIN comments ON posts.user_id = comments.user_id
WHERE comments.comment_id IS NULL;
