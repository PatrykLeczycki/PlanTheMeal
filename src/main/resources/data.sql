insert into role (name) values ('ROLE_ADMIN');

insert into role (name) values ('ROLE_USER');

insert into user(id, email, password, name, surname, enabled, registration_token, pass_recovery_token) values (null, "patryk.leczycki1@gmail.com","$2a$10$U68vFDnV45kPvK4KO42RAeQY6UM7/N0UpwpWUEPZpTutRWQcHhYZ.", "Patryk", "Łęczycki", 1, null, null);
insert into user(id, email, password, name, surname, enabled, registration_token, pass_recovery_token) values (null, "smryku@gmail.com","$2a$10$nN5fg/Pa2cAsLBhO/4.Do.aN6cd9yqDKzwCUynL5MrR1AXIUewh3y", "Patryk", "Łęczycki", 1, null, null);

insert into user_role (user_id, role_id) values (1, 1);

insert into user_role (USER_ID, ROLE_ID) values (1, 2);

insert into user_role (USER_ID, ROLE_ID) values (2, 2);

insert into weekday values(null, "Monday", 1);
insert into weekday values(null, "Tuesday", 2);
insert into weekday values(null, "Wednesday", 3);
insert into weekday values(null, "Thursday", 4);
insert into weekday values(null, "Friday", 5);
insert into weekday values(null, "Saturday", 6);
insert into weekday values(null, "Sunday", 7);

insert into plan values(null, NOW(), "Dużo kalorii", "Wysokokaloryczny", 1);
insert into plan values(null, NOW(), "Mało kalorii", "Niskokaloryczny", 1);

insert into recipe values (null, NOW(), "pożywna jajecznica z boczkiem i cebulą", "5 jajek, 1 cebula, 200g boczku", "jajecznica z boczkiem", "rozbić jajka, pokroić cebulę, pokroić boczek, usmażyć", 5, null, 1);
insert into recipe values (null, NOW(), "zdrowa sałatka z warzywami", "sałata lodowa, pomidorki koktajlowe, ogórek zielony", "sałatka", "umyć sałatę, pokroić dodatki, wymieszać", 10, null, 1);

insert into recipe values (null, NOW(), "kotlety schabowe z ziemniakami okraszone masłem", "300g schabu, 10 ziemniaków, 50g masła", "kotlety z ziemniakami i masłem", "ubić kotlety, usmażyć kotlety, ugotować ziemniaki, dodać masło", 20, null, 1);
insert into recipe values (null, NOW(), "lekka zupa kalafiorowa na bulionie bezmięsnym", "2 główki kalafiora, włoszczyzna", "zupa kalafiorowa", "umyć i pokroić kalafior, ugotować bulion, dodać kalafior", 5, null, 1);

insert into recipe values (null, NOW(), "chleb z masłem, jajkiem i gotowanymi kiełbaskami", "3 kromki chleba, 1 jajko sadzone, 2 kiełbaski", "chleb z masłem, jajkiem sadzonym i kiełbaskami", "usmażyć jajko sadzone, ugotować kiełbaski, posmarować chleb masłem", 5, null, 1);
insert into recipe values (null, NOW(), "chleb z masłem, jajkiem i gotowanymi kiełbaskami", "chleb z masłem, jajkiem na twardo i sałatą lodową", "chleb z masłem, jajkiem na twardo i sałatą lodową", "ugotować jajka na twardo, pociąć sałatę, posmarować chleb masłem", 10, null, 1);


insert into meal(id, name, sequence, plan_id, recipe_id, weekday_id) values(null, "Obiad", 2, 1, 3, 1);
insert into meal(id, name, sequence, plan_id, recipe_id, weekday_id) values(null, "Kolacja", 3, 1, 5, 1);
insert into meal(id, name, sequence, plan_id, recipe_id, weekday_id) values(null, "Śniadanie", 1, 1, 1, 1);

insert into meal(id, name, sequence, plan_id, recipe_id, weekday_id) values(null, "Kolacja", 3, 1, 6, 2);
insert into meal(id, name, sequence, plan_id, recipe_id, weekday_id) values(null, "Śniadanie", 1, 1, 2, 2);

insert into meal(id, name, sequence, plan_id, recipe_id, weekday_id) values(null, "Śniadanie", 1, 2, 1, 1);