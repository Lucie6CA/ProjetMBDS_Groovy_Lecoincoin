PROJET DEVELOPPEMENT WEB CARRON et KERGALE

API REST: nous avons tout fait sauf le bonus illustrations.

SITE:
Notre site LECOINCOIN a plusieurs type de login possible:

-ADMIN: peut tout voir, tout créer, tout modifier, tout supprimer.

-MODERATEUR: peut tout voir et tout modifier.

-CLIENT: peut voir uniquement les annonces, en créer et modifier/supprimer les siennes uniquement.

-Non idenfié: peut juste consulter les annonces.

Toute les fonctionnalités (create, update, delete, show) fonctionnent pour USER et SaleAd.

MODE DE FONCTIONNEMENT:
Notre page USER est donc accessible aux admins/modérateurs et affiche la liste des utilisateurs et leurs données (sans jamais afficher les mdp).
Elle mène à une page de création d'utilisateur dont les modérateurs n'ont pas accès. 
Une page de modification est cependant accessible aux MODE et ADMINS.


Notre page SaleAD ("Annonces") est accessible à tous les utilisateurs (ADMINS,MODE,CLIENT et même non logé), elle affiche la liste des annonces et leurs descriptions (prix, titre...).
La page de création est accessible aux ADMINS et CLIENTs; lorsqu'un client créé une annonce, il n'a pas besoin de saisir l'auteur de l'annonce, cela s'affichera automatiquement dans la liste des annonces. Contrairement aux ADMINS qui peuvent sélectionner l'utilisateur voulu pour la création de l'annonce.
La page de modification/suppression est accessible aux ADMINS, MODE et CLIENT. Cependant, les clients n'ont pas accès aux modifications/suppression des annonces qui ne sont pas les leur. Les ADMINS et MODE eux peuvent modifier n'importe quelle annonce. ADMINS peuvent supprimer n'importe quelle annonce.

La page d'accueil est accessible via notre petit logo coincoin en haut à gauche de chaque page du site.

SECURITE: nous avons utilisé des @secured ainsi que des tagLibs.

POINTS A AMELIORER:
-Nous aurions voulu avoir le temps de pouvoir ajouter plusieurs images à nos annonces et de pouvoir les supprimer/modifier dans la page modification des annonces.
-Nous aurions pu changer l'url "projet1_test" en "lecoincoin" via l'url context path


Nous avons créés les comptes pour Gérard et Mathilde Lecoincoin.
Gérard Lecoincoin (admin) : login:Gerard Lecoincoin / mdp: gerard
Mathilde Lecoincoin (moderator): login: Mathilde Lecoincoin / mdp: mathilde
(ainsi qu'un admin et client avec mdp admin et client pour nos tests)
Nous n'avons pas voulu créer d'annonce enregistrées au préalable, nous vous laissons libre d'en créer autant que vous voulez, tout fonctionne :)


Merci encore pour vos réponses à nos nombreuses questions,

Bonne soirée

Inès KERGALE et Lucie CARRON


