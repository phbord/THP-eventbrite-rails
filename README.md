# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
  * `rails g model User email:string encrypted_password:string description:text first_name:string last_name:string`
  * `rails g model Event start_date:datetime duration:integer title:string description:text price:integer location:location`
  * `rails g model Attendance stripe_customer_id:string`

* Database initialization
  * `rails g migration AddingUserEventParticipationIndex`

* Controller creation
  * `rails g mailer UserMailer`
  * `rails g mailer AttendanceMailer`

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  * diagramme ERD : _db:/diagram_erd.vpd.pdf_
  * `bundle i`                => installer les gem
  * `rails db:create`         => créer la BDD
  * `rails generate migration NomDeMaMigration` => préparer une migration
  * `rails db:migrate`        => exécuter la migration
  * `rails db:rollback`       => supprimer une migration
  * `rails db:migrate:status` => voir la liste des migrations
  * `rails db:seed`           => remplir les BDD
  * `rails routes`            => voir les routes
  * `rails server`            => lancer le serveur
  * `http://localhost:3000/`  => url racine

* TESTS en console

|ACTION|COMMANDE|
|:---|:---|
|création d'utilisateur|`User.create(first_name:"Féfé", last_name:"ducont", encrypted_password:"sqldfljfqsfj86866", email:"foufoune@yopmail.com")`|
|Test un envoi d'email|`UserMailer.welcome_email(user).deliver_now`|
||`heroku config:set SENDGRID_LOGIN=''`|
||`heroku config:set SENDGRID_PWD=''`|

## Projet Eventbrite

### Spécifications
- accueil
    - accès aux événements
    - header => accès aux page
        - accueil
        - créer un événement- s'inscrire / se connecter
        - mon profil
- s'inscrire avec une adresse email
- proposer un événement
    - titre
    - description
    - date de début
    - durée
    - prix
- une personne connectée peut rejoindre un événement
    - lien pour accéder à un formulaire d'inscription
        - prénom
        - nom
        - numéro de carte bleue
- Une personne qui a créé un événement peut accéder à une page de la liste des invités
    - éditer l'événement
    - bouton pour le supprimer
- profil pour chaque utilisateur
    - prénom
    - nom
    - description
    - SI sa page profil
        - lien pour éditer les infos primordiales (email, mot de passe) avec le bouton pour supprimer son compte
        - lien pour éditer les infos de profil (prénom, nom ou description)
- Actions impossibles à faire si la personne n'est pas connectée
    - rejoindre un événement
    - créer un événement
    - accéder à la page "mon profil"

### Base de données
- model `User`
- model `Event` => événements
- model `Attendance` => participation à un événement (table de jointure)
