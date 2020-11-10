<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}"/>
    <title>Lecoincoin</title>




</head>

<body>
<a href="#edit-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>
<sec:ifNotLoggedIn>
    <g:link controller="User">
        <content tag="nav">
            <li class="dropdown">
                <g:link controller="saleAd" action="index">
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Annonces</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="login" action="auth">
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Se connecter</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="user" action="create">
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Se créer un compte</button>
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
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Déposer une annonce</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="saleAd" action="index">
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Annonces</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="logout" action="index">
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Déconnexion</button>
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
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Utilisateurs</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="saleAd" action="create">
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Déposer une annonce</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="saleAd" action="index">
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Annonces</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="logout" action="index">
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Déconnexion</button>
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
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Utilisateurs</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="saleAd" action="index">
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Annonces</button>
                </g:link>
            </li>
            <li class="dropdown">
                <g:link controller="logout" action="index">
                    <button style="background-color:#2f9987; border-color:#2f9987" type="button" class="btn btn-success"
                            type="button">Déconnexion</button>
                </g:link>
            </li>
        </content>
    </g:link>
</sec:ifAnyGranted>
<div class="nav" role="navigation">
    <ul>
        %{--}<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
        %{--}<li><g:link class="list" action="index">Liste des annonces</g:link></li>
        <li><g:link class="create" action="create">Créer une nouvelle annonce</g:link></li>--}%
    </ul>
</div>

<div id="edit-saleAd" class="content scaffold-edit" role="main">
    <h1 style="font-size: large; font-weight:bold;">Modification de l'annonce</h1>
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
    <g:form resource="${this.saleAd}" method="PUT">
        <g:hiddenField name="version" value="${this.saleAd?.version}"/>
        <fieldset class="form">
            <table class="table">
                <tr>
                    <td style="font-size: medium;"><label for="title">Titre :</label></td>
                    <td><input name="title" type="text" class="enter_username" id="title" value="${saleAd.title}"></td>
                </tr>
                <tr>
                    <td style="font-size: medium;"><label for="description">Description :</label></td>
                    <td><input name="description" type="text" class="enter_password" id="description"
                               value="${saleAd.description}"></td>
                </tr>
                <tr>
                    <td style="font-size: medium;"><label for="description">Longue description :</label></td>
                    <td><input name="longDescription" type="text" class="enter_password" id="longDescription"
                               value="${saleAd.longDescription}"></td>
                </tr>
                <tr>
                    <td style="font-size: medium;"><label for="price">Prix :</label></td>
                    <td><input name="price" type="text" class="enter_password" id="price" ></td>
                </tr>
                <tr><sec:ifAnyGranted roles="ROLE_ADMIN">
                    <td style="font-size: medium;"><label for="author">Auteur:</label></td>

                    <td><g:select name="author" from="${projet1_test.User.list()}" optionKey="id"
                                  optionValue="username"/></td>
                </sec:ifAnyGranted>
                    <sec:ifAnyGranted roles="ROLE_CLIENT">
                        <td style="font-size: medium;"><label for="author">Auteur:</label></td>

                        <td><input disabled name="author" type="text" class="enter_password" id="author"
                                   value="${saleAd.author.username}">
                        </td>
                    </sec:ifAnyGranted>

                </tr>
                %{--}<tr>
                    <td style="font-size: medium;"><label for="price">Image(s) sélectionnées :</label></td>
                    <td><g:each in="${saleAd.illustrations}" var="image">
                        <img style="height: 100px;"
                             src="${grailsApplication.config.projet1_test.illustrations.url}${image.filename}"
                             alt="Images"/>
                    </g:each></td>
                </tr>--}%
            </table>
            <table class="table borderless">
                <tr>
                    <td style="font-size: medium;"><label for="price">Choisir une image :</label>></td>
                    <td><input name="filename" type="file" class="custom-file-input" id="customFile"></td>
                </tr>
            </table>

        </fieldset>

        <fieldset class="buttons">
            <input class="save" type="submit" value="Modifier l'annonce"/>
        </fieldset>

    </g:form>
</div>
</body>
</html>
