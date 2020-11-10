<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lecoincoin</title>
</head>
<body>
<sec:ifNotLoggedIn>
    <g:link controller="User">
        <content tag="nav">
            <li class="dropdown">
                <g:link controller="saleAd" action="index">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button" >Annonces</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="login" action="auth">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button">Se connecter</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="user" action="create">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button">Se créer un compte</button>
                </g:link>
            </li>
        </content>
    </g:link>
</sec:ifNotLoggedIn>
<sec:ifAnyGranted roles="ROLE_CLIENT">
    <g:link controller="User">
        <content tag="nav">
            <li class="dropdown">
                <g:link controller="saleAd" action="create">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button" >Déposer une annonce</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="saleAd" action="index">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button">Annonces</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="logout" action="index">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button" >Déconnexion</button>
                </g:link>
            </li>
        </content>
    </g:link>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_ADMIN">
    <g:link controller="User">
        <content tag="nav">
            <li class="dropdown">
                <g:link controller="user" action="index">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button" >Utilisateurs</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="saleAd" action="create">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button">Déposer une annonce</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="saleAd" action="index">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button">Annonces</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="logout" action="index">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button">Déconnexion</button>
                </g:link>
            </li>
        </content>
    </g:link>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_MODERATOR">
    <g:link controller="User">
        <content tag="nav">
            <li class="dropdown">
                <g:link controller="user" action="index">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button">Utilisateurs</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="saleAd" action="index">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button">Annonces</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="logout" action="index">
                    <button style = "background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success" type="button">Déconnexion</button>
                </g:link>
            </li>
        </content>
    </g:link>
</sec:ifAnyGranted>
    <div class="png" role="presentation">
        <div class="grails-logo-container">
            <asset:image src="canard.png" class="grails-logo"/>
        </div>
    </div>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1>Bienvenue sur LeCoinCoin</h1>
            <p>
                LeCoinCoin est une société familiale qui existe depuis 1940, elle est gérée par Mr Gerard
                Lecoincoin et Mme Mathilde Lecoincoin.
            </br>
                LeCoinCoin est une entreprise de dépôt vente touchant à tout ce qui peut se vendre ou
                s’acheter.
            </br>
                Ici, vous pourrez gérer votre site en toute sécurité !

            </p>


            %{--}<div id="controllers" role="navigation">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller">
                            <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                        </li>
                    </g:each>
                </ul>
            </div>--}%

        </section>
    </div>

</body>
</html>
