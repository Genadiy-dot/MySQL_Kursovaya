DELETE FROM OrdersItems;
DELETE FROM MenusItems;
DELETE FROM MenusGroups;
DELETE FROM Menus;
DELETE FROM Payments;
DELETE FROM Orders;
DELETE FROM DiscountsCards;
DELETE FROM DiscountsGroups;
DELETE FROM Discounts;
DELETE FROM Employees;
DELETE FROM Timesheet;
DELETE FROM Positions;

INSERT INTO `restaurant`.`Menus` (`id`, `name`, `active`)
VALUES
(1, 'Меню', 1)
     ,(2, 'Напитки', 1)
     ,(3, 'Карта вин', 1)
     ,(4, 'Алкоголь', 1)
;

INSERT INTO `restaurant`.`MenusGroups` (`id`, `menu`, `name`)
VALUES
( 1, 1, 'Закуски')
     ,( 2, 1, 'Салаты')
     ,( 3, 1, 'Супы')
     ,( 4, 1, 'Горячие блюда')
     ,( 5, 1, 'Дессерты')
     ,( 6, 2, 'Напитки')
     ,( 7, 3, 'Вина белые')
     ,( 8, 3, 'Вина красные')
     ,( 9, 3, 'Вина шипучие')
     ,(10, 4, 'Водка')
     ,(11, 4, 'Бренди')
;

INSERT INTO `restaurant`.`MenusItems` (`id`, `group`, `name`, `weight`, `price`)
VALUES
( 1, 1, 'Анчоусы на гренках', 100, 700)
     ,( 2, 1, 'Бабагануш с лепешками', 100, 550)
     ,( 3, 1, 'Баклажаны в кисло-сладком соусе', 100, 400.00)
     ,( 4, 1, 'Филе сельди', 100, 400.00)
     ,( 5, 1, 'Сельдь "под стопочку"', 100, 400.00)
     ,( 6, 1, 'Хумус с печеными овощами', 100, 450.00)
     ,( 7, 1, 'Брускетта с семгой, авокадо и яйцом "пашот"', 100, 500.00)

     ,( 8, 2, 'Салат "Цезарь" с курицей', 100, 750.00)
     ,( 9, 2, 'Салат "Цезарь" креветками', 100, 800.00)
     ,(10, 2, 'Салат с кальмарами', 100, 640.00)
     ,(11, 2, 'Листья салатов романо и айсберг', 100, 350.00)
     ,(12, 2, 'Листья салатов лолло россо, руккола и романо', 100, 350.00)
     ,(13, 2, 'Мангал салат из запеченых овощей', 100, 520.00)
     ,(14, 2, 'Тарелка свежих овощей с зеленью', 100, 250.00)

     ,(15, 3, 'Борщ со сметаной', 100, 640.00)
     ,(16, 3, 'Суп лапша куриная с перепелиным яйцом', 100, 450.00)
     ,(17, 3, 'Суп КХА-СОЙ', 100, 700.00)
     ,(18, 3, 'Суп Фо-бо', 100, 800.00)
     ,(19, 3, 'Суп луковый', 100, 150.00)

     ,(20, 4, 'Стейк из тунца в кунжуте', 100, 3500.00)
     ,(21, 4, 'Филе черной трески', 100, 1020.00)
     ,(22, 4, 'Креветки "Васаби"', 100, 1200.00)
     ,(23, 4, 'Вырезка говяжья с овощами в перечном соусе', 100, 1300.00)
     ,(24, 4, 'Щечки говяжьи, томленые в соусе', 100, 1200.00)
     ,(25, 4, 'Язычки бараньи томленые в соусе Терияки', 100, 1400.00)
     ,(26, 4, 'Котлеты куриные с картофельным пюре', 100, 1600.00)
     ,(27, 4, 'Бургер говяжий', 100, 800.00)
     ,(28, 4, 'Стейк из семги', 100, 3000.00)
     ,(29, 4, 'Сибасс на гриле', 100, 2000.00)
     ,(30, 4, 'Цыпленок табака', 100, 1520.00)
     ,(31, 4, 'Шашлык из баранины', 100, 1200.00)
     ,(32, 4, 'Шашлык из свиной шейки', 100, 1200.00)
     ,(33, 4, 'Шашлык из курицы', 100, 1000.00)
     ,(34, 4, 'Люля кебаб из баранины', 100, 1200.00)
     ,(35, 4, 'Люля кебаб из телятины', 100, 1200.00)

     ,(36, 5, 'Торт "Три шоколада"', 100, 800.00)
     ,(37, 5, 'Чизкейк классический', 100, 800.00)
     ,(38, 5, 'Вафли Венские с ванильным кремом', 100, 400.00)
     ,(39, 5, 'Сорбет Манго', 100, 400.00)
     ,(40, 5, 'Сорбет Малиновый', 100, 400.00)
     ,(41, 5, 'Сорбет Черная смородина', 100, 400.00)
     ,(42, 5, 'Мороженое ванильное', 100, 500.00)
     ,(43, 5, 'Мороженое клубничное', 100, 500.00)
     ,(44, 5, 'Мороженое шоколадное', 100, 500.00)

     ,(45, 6, 'Жемчужина Байкала', 100, 250.00)
     ,(46, 6, 'Боржоми', 100, 230.00)
     ,(47, 6, 'Нарзан', 100, 210.00)
     ,(48, 6, 'Лимонад Манго-Маракуйя', 100, 330.00)
     ,(49, 6, 'Лимонад Тархун', 100, 320.00)
     ,(50, 6, 'Лимонад Цитрусовый', 100, 320.00)
     ,(51, 6, 'Лимонад Имбирно-Клубничный', 100, 330.00)
     ,(52, 6, 'Ванильный Молочный Коктейль', 100, 350.00)
     ,(53, 6, 'Шоколадный Молочный Коктейль', 100, 440.00)
     ,(54, 6, 'Клубничный Молочный Коктейль', 100, 460.00)
     ,(55, 6, 'Ристретто', 100, 500.00)
     ,(56, 6, 'Эспрессо', 100, 500.00)
     ,(57, 6, 'Двойной эспрессо', 100, 700.00)
     ,(58, 6, 'Американо', 100, 700.00)
     ,(59, 6, 'Каппучино', 100, 700.00)
     ,(60, 6, 'Латте', 100, 700.00)
     ,(61, 6, 'Кофе Гляссе', 100, 700.00)
     ,(62, 6, 'Какао с маршмэллоу', 100, 700.00)


     ,(63, 7, 'Ле Гран Нуар Совиньон Блан. Лангедок Руссийон. Ле Селье Жан д\'Алибер', 100, 3300.00)
     ,(64, 7, 'Ле Гран Нуар Шардоне, Лангедок Руссийон. Ле Селье Жан д\'Алибер', 100, 5000.00)
     ,(65, 7, 'Селексьон де Шато де Бордо. AOC Бордо. Ле Селье Жан д`Алибер', 100, 11000.00)
     ,(66, 7, 'Резерв Спесьяль блан. Домен Барон Де Ротшильд. Бордо. АОС', 100, 21000.00)
     ,(67, 7, 'Шабли Сент Клер. Бургундия. САС Жен-Марк Брокар', 100, 31000.00)
     ,(68, 7, 'Рислинг, Эльзас, Ф.Е. Тримбах СА', 100, 41000.00)

     ,(69, 8, 'Ле Гран Нуар Мальбек Лангедок Руссийон. Ле Селье Жан д\'Алибер (полусухое)', 100, 1100.00)
     ,(70, 8, 'Селексьон де Шато Де Бордо. АОС Бордо. Ле Селье Жан д`Алибер', 100, 1800.00)
     ,(71, 8, 'Ле Бордо де Ситран Руж Бордо. Мазон Жинесте СА', 100, 4200.00)
     ,(72, 8, 'Кот-дю-Рон. Долина Роны. Бушар эне и фис. АОС', 100, 7500.00)
     ,(73, 8, 'Пляс Руаяль Бордо. Сент-Эмилион. Бордо. АОС', 100, 8000.00)
     ,(74, 8, 'Шевалье д\'Антельм (Кот дю Рон). Долина Роны. АОС', 100, 12000.00)
     ,(75, 8, 'Жинесте Бордо. Бордо, Мезон Жинести СА', 100, 17000.00)
     ,(76, 8, 'Бургонь Пино Нуар ла Винье. Бургундия. Мезон Бушар Пэр э Фис. САС', 100, 21000.00)

     ,(77, 9, 'Абрау-Дюрсо Блан де Блан, Белое, брют', 100, 1000.00)
     ,(78, 9, 'Российское Шампанское Абрау-Дюрсо Виктор Дравиньи', 100, 2000.00)
     ,(79, 9, 'Ламбруско Бьянко Фиорино Д\'Оро. Италия', 100, 3000.00)
     ,(80, 9, 'Ламбруско Розато Фиорино Д\'Оро. Италия', 100, 7000.00)
     ,(81, 9, 'Фиестино брют. Каса Демонте. Италия', 100, 8000.00)
     ,(82, 9, 'Просекко Супериоре Вальдоббьядене Джалл\'оро. DOCG. Италия', 100, 12000.00)
     ,(83, 9, 'Моэт & Шандон Розе Империаль. Брют. Франция', 100, 15000.00)
     ,(84, 9, 'Поль Роже Брют Резерв, белое. Франция', 100, 19400.00)
     ,(85, 9, 'Мартини Асти (сладкое). Песьоне. Турин, Италия', 100, 22200.00)
     ,(86, 9, 'Мартини Просекко. Венето. Италия', 100, 34100.00)

     ,(87,10, 'Водка Драники Хлебная', 100, 1000.00)
     ,(88,10, 'Русский Стандарт', 100, 1500.00)
     ,(89,10, 'Белое Золото', 100, 1700.00)
     ,(90,10, 'Белое Золото Премиум', 100, 1900.00)
     ,(91,10, 'Белуга', 100, 2000.00)

     ,(92,11, 'Мартель V.S.O.P.', 100, 11000.00)
     ,(93,11, 'Хеннесси V.S.O.P.', 100, 12000.00)
     ,(94,11, 'Курвуазье V.S.O.P.', 100, 13000.00)
     ,(95,11, 'Арманьяк Шабо V.S.O.P. Делюкс', 100, 14000.00);

INSERT INTO `restaurant`.`Positions` (`id`, `name`)
VALUES
( 1, 'Директор')
     ,( 2, 'Менеджер')
     ,( 3, 'Сомелье')
     ,( 4, 'Бармен')
     ,( 5, 'Официант')
;

INSERT INTO `restaurant`.`Employees`(
    `id`,
    `surname`,
    `name`,
    `patronymic`,
    `position`,
    `employment_date`)
VALUES
( 1, 'Иванов'  , 'Сергей' , 'Петрович', 1, '2021-05-01')
     ,( 2, 'Петров'  , 'Василий', 'Сергеевич', 3, '2021-05-01')
     ,( 3, 'Сидоров' , 'Петр'   , 'Михайлович', 4, '2021-05-01')
     ,( 4, 'Кузнецов', 'Семен'  , 'Иванович', 5, '2021-05-01')
     ,( 5, 'Сергеев' , 'Иван'   , 'Андреевич', 5, '2021-05-01')
;

INSERT INTO `restaurant`.`DiscountsGroups` (`id`, `name`)
VALUES
( 1, 'VIP клиенты')
     ,( 2, 'Серебряные клиенты')
     ,( 3, 'Золотые клиенты')
;

INSERT INTO `restaurant`.`DiscountsCards` (
    `id`,
    `card_no`,
    `holder_name`,
    `discount_group`)
VALUES
( 1, '1234256789012345', 'Петров И.И.', 1)
     ,( 2, '1234256789012346', 'Сидоров П.П.', 2)
     ,( 3, '1234256789012347', 'Кузнецов С.С.', 3)
;

INSERT INTO Orders (id, date_time, `table`, waiter, invoice, discount_card)
VALUES
      ( 1, '2021-06-05 12:05:14', ' 2', 4, '2021-06-05 13:01:12',         NULL)
     ,( 2, '2021-06-05 13:17:08', ' 1', 5, '2021-06-05 14:28:22',            3)
     ,( 3, '2021-06-05 16:22:11', ' 7', 5, '2021-06-05 17:05:17',         NULL)
     ,( 4, '2021-06-05 19:17:16', ' 3', 4, '2021-06-05 20:20:06',            2)
     ,( 5, '2021-06-05 23:10:15', ' 2', 4, '2021-06-05 23:50:07',         NULL)
     ,( 6, '2021-06-06 12:15:25', ' 2', 4, '2021-06-06 13:12:43',         NULL)
     ,( 7, '2021-06-06 13:12:34', ' 4', 5, '2021-06-06 15:10:33',         NULL)
     ,( 8, '2021-06-06 17:45:12', ' 5', 4, '2021-06-06 19:03:21',            1)
     ,( 9, '2021-06-06 20:22:17', ' 3', 5, '2021-06-06 21:45:13',         NULL)
     ,(10, '2021-06-06 22:19:26', ' 2', 5, '2021-06-06 23:40:46',         NULL)
     ,(11, '2021-06-07 12:03:15', ' 5', 4, '2021-06-07 14:10:32',         NULL)
     ,(12, '2021-06-07 12:57:01', ' 4', 5, '2021-06-07 15:10:17',         NULL)
     ,(13, '2021-06-07 16:48:11', ' 2', 5,                  NULL,         NULL)
     ,(14, '2021-06-07 20:25:25', ' 1', 4,                  NULL,            3)
     ,(15, '2021-06-07 21:13:37', ' 6', 4,                  NULL,         NULL)
     ,(16, '2021-06-07 22:15:16', ' 7', 5,                  NULL,         NULL)
;

INSERT INTO OrdersItems (id, `order`, menu_item, quantity)
VALUES
( 1,  1,  4,  1)
     ,( 2,  1, 11,  1)
     ,( 3,  1, 17,  1)
     ,( 4,  1, 24,  1)
     ,( 5,  1, 57,  2)

     ,( 6,  2,  2,  1)
     ,( 7,  2, 35,  1)
     ,( 8,  2, 49,  1)

     ,( 9,  3,  1,  1)
     ,(10,  3, 15,  1)
     ,(11,  3, 21,  1)
     ,(12,  3, 37,  2)
     ,(13,  3, 68,  1)

     ,(14,  4, 36,  1)
     ,(15,  4, 60,  1)

     ,(16,  5, 10,  1)
     ,(17,  5, 19,  1)
     ,(18,  5, 30,  1)
     ,(19,  5, 90,  2)

     ,(20,  6, 91,  3)

     ,(21,  7, 38,  1)
     ,(22,  7, 62,  1)
     ,(23,  7, 44,  1)

     ,(24,  8,  5,  1)
     ,(25,  8, 90,  1)

     ,(26,  9,  1,  4)
     ,(27,  9,  9,  4)
     ,(28,  9, 32,  4)
     ,(29,  9, 37,  4)
     ,(30,  9, 42,  4)
     ,(31,  9, 46,  1)
     ,(32,  9, 94,  1)

     ,(33, 10, 37,  1)
     ,(34, 10, 42,  1)
     ,(35, 10, 58,  1)

     ,(36, 11, 39,  1)
     ,(37, 11, 60,  1)

     ,(38, 12,  2,  1)
     ,(39, 12, 15,  1)
     ,(40, 12, 23,  1)

     ,(41, 13,  7,  1)

     ,(42, 14, 13,  2)
     ,(43, 14, 18,  2)
     ,(44, 14, 26,  2)
     ,(45, 14, 59,  2)

     ,(46, 15, 34,  3)
     ,(47, 15, 18,  2)
     ,(48, 15, 75,  1)
;

INSERT INTO Payments (id, `order`, date_time, sum)
VALUES
      ( 1,  1, '2021-06-05 13:08:12', 4050)
     ,( 2,  2, '2021-06-05 14:40:22', 2070)
     ,( 3,  3, '2021-06-05 17:23:17', 44960)
     ,( 4,  4, '2021-06-05 20:41:06', 1500)
     ,( 5,  5, '2021-06-05 23:58:07', 6110)
     ,( 6,  6, '2021-06-06 13:40:43', 6000)
     ,( 7,  7, '2021-06-06 15:19:33', 1600)
     ,( 8,  8, '2021-06-06 19:21:21', 2300)
     ,( 9,  9, '2021-06-06 21:57:13', 29320)
     ,(10, 10, '2021-06-06 23:44:31', 2000)
     ,(11, 11, '2021-06-07 14:16:25', 1100)
     ,(12, 12, '2021-06-07 15:27:34', 2490)
;