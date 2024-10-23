/*
id_library = 19...22
id_genre = 8...15
id_lang = 16...18
id_binding = 6...7
id_ar = 1...5

year_publish = 1455...current year
*/





INSERT INTO main.book(
	id_library, id_genre, 
	id_lang, id_binding, 
	id_ar, title, 
	author, description, 
	publisher, book_serias, 
	year_publish)
	VALUES (20, 12,
	17, 6,
	5, 'Сказки дедушки Мороза', 
	'Александр Пушкин', 'Сборник классических русских сказок, адаптированных для детей младшего возраста', 
	'Малыш (АСТ)', 'Книжки-панорамки',
	1845);

INSERT INTO main.book(
	id_library, id_genre, 
	id_lang, id_binding, 
	id_ar, title, 
	author, description, 
	publisher, book_serias, 
	year_publish)
	VALUES (21, 11,
	18, 6,
	1, 'Приключения кота Матроскина', 
	'Эдуард Успенский', 'История о приключениях кота Матроскина и его друзей', 
	'Росмэн', 'Панорамки',
	2008);

	INSERT INTO main.book(
	id_library, id_genre, 
	id_lang, id_binding, 
	id_ar, title, 
	author, description, 
	publisher, book_serias, 
	year_publish)
	VALUES (19, 15,
	16, 7,
	5, 'Сказки на ночь', 
	'Ганс Христиан Андерсен', 'Сборник знаменитых сказок датского писателя, адаптированных для детей', 
	'Антураж', 'Сказка в окошке',
	2003);

	INSERT INTO main.book(
	id_library, id_genre, 
	id_lang, id_binding, 
	id_ar, title, 
	author, description, 
	publisher, book_serias, 
	year_publish)
	VALUES (20, 12,
	18, 7,
	3, '100 окошек — открывай-ка!', 
	'Тони Вульф.', 'Книга с окошками, где за створками спрятаны интересные факты и загадки', 
	'Феникс', 'Книжка с окошками',
	2012);