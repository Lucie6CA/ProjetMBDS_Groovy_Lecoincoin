<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title>Lecoincoin</title>
</head>

<body>
<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
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
        <sec:ifAnyGranted roles="ROLE_ADMIN">
        %{--<li><g:link class="list" action="index">Liste des utilisateurs</g:link></li>--}%
            <li><g:link class="create" action="create">Créer un nouvel utilisateur</g:link></li>
        </sec:ifAnyGranted>

    </ul>
</div>

<div id="show-user" class="content scaffold-show" role="main">
    <h1 style="font-size: large; font-weight:bold;">Nouvel utilisateur créé</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table">
        <tbody>
        <tr>
            <td style="font-size: medium;"><label>Identifiant :</label></td>
            <td>${user.username}</td>
        </tr>
        %{--<tr>
            <td style="font-size: medium;"> <label>Mot de passe :</label></td>
            <td> ${user.password}</td>
        </tr>--}%
        <tr>
            <td style="font-size: medium;"><label>Role :</label></td>
            <td> <g:each var="role" in="${user.getAuthorities()}">
                ${role.authority}
            </g:each></td>
        </tr>
        </tbody>
    </table>
    <g:form resource="${this.user}" method="DELETE">

        <fieldset class="buttons">

            <g:link class="edit" action="edit" resource="${this.user}">Modifier l'utilisateur</g:link>
            <sec:ifAnyGranted roles="ROLE_ADMIN">

                <input class="delete" type="submit" value="Supprimer l'utilisateur"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </sec:ifAnyGranted>

        </fieldset>

    </g:form>
</div>
</body>
</html>
