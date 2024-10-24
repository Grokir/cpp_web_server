/*
id_library = 19...22
id_genre = 8...15
id_lang = 16...18
id_binding = 6...7
id_ar = 1...5

year_publish = 1455...current year
*/





INSERT INTO main.book(
	id_library,	id_binding,
	id_ar, title,
	author, description,
	publisher, book_serias,
	year_publish,
	ids_genres, ids_langs)
	VALUES (
	20, 6,
	5, 'Сказки дедушки Мороза', 
	'Александр Пушкин', 'Сборник классических русских сказок, адаптированных для детей младшего возраста', 
	'Малыш (АСТ)', 'Книжки-панорамки',
	1845,
	main.erase_non_genres('{8, 10, 14}'),
	main.erase_non_langs('{16}'));

INSERT INTO main.book(
	id_library,	id_binding,
	id_ar, title,
	author, description,
	publisher, book_serias,
	year_publish, 
	ids_genres, ids_langs)
	VALUES (21, 6,
	1, 'Приключения кота Матроскина', 
	'Эдуард Успенский', 'История о приключениях кота Матроскина и его друзей', 
	'Росмэн', 'Панорамки',
	2008,
	main.erase_non_genres('{8, 10, 14}'::integer[]),
	main.erase_non_langs('{16, 18}'));

	INSERT INTO main.book(
	id_library,	id_binding,
	id_ar, title,
	author, description,
	publisher, book_serias,
	year_publish, 
	ids_genres, ids_langs)
	VALUES (19, 7,
	5, 'Сказки на ночь', 
	'Ганс Христиан Андерсен', 'Сборник знаменитых сказок датского писателя, адаптированных для детей', 
	'Антураж', 'Сказка в окошке',
	2003,
	main.erase_non_genres('{8, 16}'),
	main.erase_non_langs('{17, 18}'));

	INSERT INTO main.book(
	id_library,	id_binding,
	id_ar, title,
	author, description,
	publisher, book_serias,
	year_publish,
	ids_genres, ids_langs)
	VALUES (20, 7,
	3, '100 окошек — открывай-ка!', 
	'Тони Вульф.', 'Книга с окошками, где за створками спрятаны интересные факты и загадки', 
	'Феникс', 'Книжка с окошками',
	2012,
	main.erase_non_genres('{10, 14}'),
	main.erase_non_langs('{18}'));