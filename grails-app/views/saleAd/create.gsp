<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}"/>
        <title>Lecoincoin</title>
    </head>

    <body>
        <a href="#create-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                       default="Skip to content&hellip;"/></a>
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
                %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
                %{--<li><g:link class="list" action="index">Liste des annonces</g:link></li>--}%
            </ul>
        </div>

        <div id="create-saleAd" class="content scaffold-create" role="main">
            <h1 style="font-size: large; font-weight:bold;">Création de l'annonce</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.saleAd}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.saleAd}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <form enctype="multipart/form-data" action="/projet1_test/saleAd/save" method="post">
                <fieldset class="form">
                    %{--}<f:all bean="saleAd"/>--}%
                    <table class="table">
                        <tbody>
                            <tr>
                                <td style="font-size: medium;"> <label for="title">Titre :</label> </td>
                                <td><input name="title" type="text" class="enter_username" id="title" placeholder=""></td>
                            </tr>
                            <tr>
                                <td style="font-size: medium;"> <label for="description">Description :</label></td>
                                <td> <input name="description" type="text" class="enter_password" id="description" placeholder=""></td>
                            </tr>
                            <tr>
                                <td style="font-size: medium;"><label for="description">Longue description :</label> </td>
                                <td> <input name="longDescription" type="text" class="enter_password" id="longDescription" placeholder=""></td>
                            </tr>
                            <tr>
                                <td style="font-size: medium;"> <label for="price">Prix :</label> </td>
                                <td> <input name="price" type="text" class="enter_password" id="price" placeholder=""></td>
                            </tr>
                            <tr>
                                <sec:ifAnyGranted roles="ROLE_ADMIN">
                                    <g:link controller="saleAd">
                                        <td style="font-size: medium;"> <label for="author">Auteur:</label> </td>
                                        <td><g:select name="author" from="${projet1_test.User.list()}" optionKey="id" optionValue="username"/></td>
                                    </g:link>
                                </sec:ifAnyGranted>

%{--                                <sec:ifAnyGranted roles="ROLE_CLIENT">--}%
%{--                                    <g:link controller="saleAd">--}%
%{--                                        <td style="font-size: medium;"> <label for="author">Auteur:</label> </td>--}%
%{--                                        <td style="font-size: medium;"><input disabled type="text" name="author" value="<sec:loggedInUserInfo field='username'/>" /> </td>--}%
%{--                                    </g:link>--}%
%{--                                </sec:ifAnyGranted>--}%

                            </tr>
                            <tr>
                                <td> <input name="filename" type="file" class="custom-file-input" id="customFile"></td>
                                <td><img src="${grailsApplication.config.projet1_test.illustrations.url}/${filename}"/></td>
                            </tr>
                        </tbody>
                    </table>




                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Créer"/>
                </fieldset>
            </form>
        </div>
    </body>
</html>
