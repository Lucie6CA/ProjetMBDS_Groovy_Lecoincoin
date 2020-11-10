<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title>Lecoincoin</title>
</head>

<body>
<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
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

        %{--}<li><g:link class="list" action="index">Liste des utilisateur</g:link></li>--}%
            <li><g:link class="create" action="create">Créer un nouvel utilisateur</g:link></li>
        </sec:ifAnyGranted>

    </ul>

</div>

<div id="edit-user" class="content scaffold-edit" role="main">
    <h1 style="font-size:large; font-weight:bold;">Modification de l'utilisateur</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.user}" method="PUT">
        <g:hiddenField name="version" value="${this.user?.version}"/>
        <fieldset class="form">
            <table class="table">
                <tbody>
                <tr>
                    <td style="font-size: medium;"><label for="InputPassword">Identifiant :</label></td>
                    <td><input name="username" type="text" class="enter_username" id="InputUsername"
                               placeholder="Entrer un identifiant"></td>
                </tr>
                <tr>
                    <td style="font-size: medium;"><label for="InputPassword">Mot de passe :</label></td>
                    <td><input name="password" type="password" class="enter_password" id="InputPassword"
                               placeholder="Entrer un mot de passe"></td>
                </tr>
                <tr>
                    <td style="font-size: medium;"><label for="Role">Role:</label></td>
                    <td><g:select name="role" from="${projet1_test.Role.list()}"
                                  optionKey="id" optionValue="authority"/></td>
                </tr>
                </tbody>
            </table></fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit" value="Modifier l'utilisateur"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
