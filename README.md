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

* Heroku deployment instructions
  * `heroku create nom-de-ton-app`
  * `git remote --v`
  * `git config --list | grep heroku`
  * `git push heroku main`
  * `heroku run rails db:migrate`
  * `heroku run rails db:seed`
  * `heroku ps:scale web=1`
  * `heroku open` => ouverture de l'application dans le navigateur
  * `heroku config`
  * `heroku config:get GITHUB_USERNAME`
  * `heroku config:set GITHUB_USERNAME=phbord` => Set a config var
  * `heroku config:set SENDGRID_LOGIN='...'`
  * `heroku config:set SENDGRID_PWD='...'`
  * `heroku run rails console`

* Devise deployment instructions
  * `rails generate devise:install` => installation
  * `rails g devise NomDuModel` => génération du model
  * `rails generate devise:views` => générer les views

* Controller creation
  * `rails g controller events index new create show edit update destroy`
  * `rails g controller users show`

* TESTS en console

|ACTION|COMMANDE|
|:---|:---|
|création d'utilisateur|`User.create(first_name:"Féfé", last_name:"ducont", encrypted_password:"sqldfljfqsfj86866", email:"foufoune@yopmail.com")`|
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

### Fonctionnalités de Devise
- Database Authenticatable : possibilité de stocker les mots de passe dans leur version hashée pour valider l'authenticité d'un utilisateur pendant sa connexion (la base quoi) ;
- Registerable : possibilité de créer un compte via un formulaire. Aussi, possibilité d'éditer et de supprimer son compte ;
- Recoverable : possibilité de réinitialiser le mot de passe et d'envoyer des instructions par e-mail ;
- Rememberable : possibilité d'utiliser le fameux cookie remember me (la session reste ouverte) ;
- Validatable : possibilité de donner des validations pour les e-mails et mots de passe (taille, regex, etc) ;
- Omniauthable : possibilité de gestion de OmniAuth (un service pour se connecter via son compte Google, Facebook ou autre) ;
- Confirmable : possibilité de forcer la confirmation par e-mail du compte ;
- Trackable : possibilité de tracker le nombre de login, leurs timestamps, et les adresses IP ;
- Timeoutable : possibilité d'expirer des sessions après un certain temps d'inactivité ;
- Lockable : possibilité de verrouiller un compte après trop de tentatives échouées de connexions ;
