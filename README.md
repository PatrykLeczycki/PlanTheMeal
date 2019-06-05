# PlanTheMeal

Web application created with Java

### Table of Contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)

## General info

PlanTheMeal is a web application that helps user with planning his meals and creating
meal schedules. It provides register and password retrieval
functionalities based on Spring Security. It allows user to add recipes,
meals and weekly plans based on these ones.

## Technologies

Spring Boot, Spring Security, Hibernate, Maven, HTML, CSS, JavaScript, jQuery, MySQL, Bootstrap

## Setup

To get access to the application you can:

* clone repository and open it in your IDE (MySQL database and Tomcat needed)
* visit http://pleczycki.pl/planthemeal 

## Features

* User management (Spring Security: registration panel - passwords hashed with jBCrypt, account verification and password recovery based on authentication tokens, login panel, permissions depending on user role)
* User can add recipe/meal/plan objects
* Admin has the same permissions as an user, additionally he can modify other users' permissions