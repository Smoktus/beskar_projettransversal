## School project of the **Mastère Informatique, Système d'Information Réseaux et Télécommunications**

This project aim to digitalize the luncheon voucher to simplify their usage on daily basis.
The goal was to make individualized interface for each user.

# Shelf server written in Dart deploy in Heroku as a Rest Api

We are using this template :arrow_down:

# Shelf Web Framework Template

##### by Alex Merced of AlexMercedCoder.com

`git clone https://github.com/AlexMercedCoder/DartShelfPostgresTemplate.git projectName`

## Folder Structure

    - ui : contains a basic flutter project that carry the uses interface and the logic of the application
        -   components : different components of the app that are reusable
        -   screens : the different screens of the app
        -   models : logic behind the components
        -   modelsData : modelling the data that are receive from the Api request

    - bin : contains the shelf server the logic of the Rest Api
        -   models : modelling the different table of the database and the different request
        -   controllers : Creating the different endpoint of the Rest Api using the shelf_router
        -   db : handle the connecion to a postgres server host on heroku
        -   server.dart : entry file that launch the server

## How to use

    `Web version` : https://smoktus.github.io/beskarweb/
        Deployement of the web version of the flutter project. Many bugs and very hard to use the app.

    `Mobile version`:
        Clone the project and build it to your device by launching the main.dart in the ui folder.
