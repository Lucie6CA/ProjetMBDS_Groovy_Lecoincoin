<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}"/>
    <title>Lecoincoin</title>
</head>

<body>
<a href="#show-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
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
        %{--}<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
        %{--<li><g:link class="list" action="index">Liste des annonces</g:link></li>

        <li>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <g:link controller="saleAd">
                    <g:link class="create" action="create">Créer une nouvelle annonce</g:link>
                </g:link>
            </sec:ifAnyGranted>
        </li>
        --}%

    </ul>
</div>

<div id="show-saleAd" class="content scaffold-show" role="main">
    <h1 style="font-size: large; font-weight:bold;">Description de l'annonce</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
%{--}<f:display bean="saleAd" />--}%
    <table class="table" style=" margin: 10px;">
        <tbody>
        <tr>
            <td style="font-size: medium;"><label>Titre :</label></td>
            <td>${saleAd.title}</td>
        </tr>
        <tr>
            <td style="font-size: medium;"><label>Description :</label></td>
            <td>${saleAd.description}</td>
        </tr>
        <tr>
            <td style="font-size: medium;"><label>Longue description :</label></td>
            <td>${saleAd.longDescription}</td>
        </tr>
        <tr>
            <td style="font-size: medium;"><label>Prix :</label></td>
            <td>${saleAd.price}</td>
        </tr>
        <tr>
            <td style="font-size: medium;"><label>Auteur:</label></td>
            <td>${saleAd.author.username}</td>
        </tr>
        <tr>
            <td style="font-size: medium;"><label>Date de création:</label></td>
            <td>${saleAd.dateCreated}</td>
        </tr>
        <tr>
            <td style="font-size: medium;"><label>Image(s):</label></td>
            <td>
                <g:each in="${saleAd.illustrations}" var="image">
                    <img style="height: 100px;"
                         src="${grailsApplication.config.projet1_test.illustrations.url}${image.filename}"
                         alt="Images"/>
                </g:each>
            </td>
        </tr>
        </tbody>
    </table>
    <g:form resource="${this.saleAd}" method="DELETE">
        <sec:ifAnyGranted roles="ROLE_ADMIN">
            <g:link controller="saleAd">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.saleAd}">Modifier</g:link>
                    <input class="delete" type="submit" value="Supprimer"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </fieldset>
            </g:link>
        </sec:ifAnyGranted>

        <sec:ifAnyGranted roles="ROLE_CLIENT">
            <g:if test="${saleAd.author.username.toString() == sec.loggedInUserInfo(field: 'username').toString()}">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.saleAd}">Modifier</g:link>
                    <input class="delete" type="submit" value="Supprimer"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </fieldset>
            </g:if>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_MODERATOR">
            <g:link controller="saleAd">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.saleAd}">Modifier</g:link>
                    %{--}<input class="delete" type="submit" value="Supprimer" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
                </fieldset>
            </g:link>
        </sec:ifAnyGranted>

    </g:form>
</div>
</body>
</html>
