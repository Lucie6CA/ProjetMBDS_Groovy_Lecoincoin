<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                <li><g:link class="create" action="create">Créer un nouvel utilisateur</g:link></li>
                </sec:ifAnyGranted>

            </ul>
        </div>
        <div id="list-user" class="content scaffold-list" role="main">
            <h1 style="font-size: large; font-weight: bold;">Liste des utilisateurs</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            %{--<f:table collection="${userList}" />--}%
            <table class="table">
                <thread>
                <tr>
                    <th style="font-size: large;" scope="col">N°</th>
                    <th style="font-size: large;" scope="col">Identifiants</th>
                    <th style="font-size: large;" scope="col">Annonces</th>

                    <th style="font-size: large;"scope="col">Role</th>
                </tr>
                </thread>
                <tbody>

                <g:each in="${userList}" var="user">
                    <tr>
                        <th style="font-size: medium;"scope="row">${user.id}</th>
                        <td style="font-size: medium;">
                            <g:link controller="user" action="show" id="${user.id}" class="lien">
                                ${user.username}
                            </g:link>


                        </td>
                        <td style="font-size: medium;">
                            <g:each in="${user.saleAds}" var ="saleAd">
                                <g:link controller="saleAd" action="show" id="${saleAd.id}" class="lien">
                                    ${saleAd.title}
                                </g:link>
                            </g:each>
                        </td>

                        <td style="font-size: medium;">
                            <g:each var="role" in="${user.getAuthorities()}">
                                ${role.authority}
                            </g:each>
                        </td>

                    </tr>
                </g:each>
                </tbody>
                </table>
            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>