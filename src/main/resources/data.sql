insert into role (name)
values ('ROLE_ADMIN');

insert into role (name)
values ('ROLE_USER');

insert into user(id, email, password, name, surname, enabled, registration_token, pass_recovery_token) values (null, "patryk.leczycki1@gmail.com","$2a$10$U68vFDnV45kPvK4KO42RAeQY6UM7/N0UpwpWUEPZpTutRWQcHhYZ.", "Patryk", "Łęczycki", 1, null, null);

insert into user_role (user_id, role_id)
values (1, 1);

insert into user_role (USER_ID, ROLE_ID)
values (1, 2);

insert into recipe values (null, NOW(), "testdesc", "testingredient1, testingredient2, testingredient3", "testname", "testpreparation", 15, null, 1);
