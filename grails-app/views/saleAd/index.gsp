<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}" />
        <title>Lecoincoin</title>
        <style>
        /* unvisited link */
        .lien:link {
            color: black;
        }

        /* visited link */
        .lien:visited {
            color: #2f9987;
        }

        /* mouse over link */
        .lien:hover {
            color: red;
        }

        /* selected link */
        .lien:active {
            color: yellow;
        }
        </style>
    </head>
    <body>
        <a href="#list-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
    <div class="nav" role="navigation">
            <ul>
               %{-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
               %{-- <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <g:link controller="saleAd">
                <li><g:link class="create" action="create">Créer une nouvelle annonce</g:link></li>
                    </g:link>
                </sec:ifAnyGranted>--}%

            </ul>
        </div>
        <div id="list-saleAd" class="content scaffold-list" role="main">
            <h1 style="font-size: large; font-weight: bold;">Liste des annonces</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            %{--}<f:table collection="${saleAdList}" />--}%
            <table class="table">
                <thread>
                    <tr>
                        <th style="font-size: large;" scope="col">Titre</th>
                        <th style="font-size: large;" scope="col">Description</th>
                        <th style="font-size: large;" scope="col">Date de publication</th>
                        <th style="font-size: large;" scope="col">Illustrations</th>
                        <th style="font-size: large;"  scope="col">Prix</th>
                        <th style="font-size: large;" scope="col">Auteur</th>
                    </tr>
                </thread>
                <tbody>
                <g:each in="${saleAdList}" var="saleAd">
                    <tr>
                        <td style="font-size: medium;">
                        <g:link controller="saleAd" action="show" id="${saleAd.id}" class="lien">
                            ${saleAd.title}
                        </g:link>
                        </td>
                        <td>${saleAd.description}</td>
                        <td style="font-size: small;">${saleAd.dateCreated}</td>
                        <td>

                            <g:each in="${saleAd.illustrations}" var="image">
                                    <img style="height: 100px;" src="${grailsApplication.config.projet1_test.illustrations.url}${image.filename}" alt="Images" />
                            </g:each>
                        </td>
                        <td>${saleAd.price}</td>
                        <td>${saleAd.author.username}</td>


                    </tr>
                </g:each>

                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${saleAdCount ?: 0}" />
            </div>
        </div>
    </body>
</html>