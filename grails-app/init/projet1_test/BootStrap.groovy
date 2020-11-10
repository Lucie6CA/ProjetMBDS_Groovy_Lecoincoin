package projet1_test

import projet1_test.Illustration
import projet1_test.Role
import projet1_test.SaleAd
import projet1_test.User
import projet1_test.UserRole

class BootStrap {
    def init = { servletContext ->
        def roleAdmin = new Role(authority: "ROLE_ADMIN").save()
        def roleClient = new Role(authority: "ROLE_CLIENT").save()
        def roleModerator = new Role(authority: "ROLE_MODERATOR").save()

        def userAdmin = new User(username: "admin", password: "admin").save()
        def gLecoincoin = new User(username: "Gerard Lecoincoin", password: "gerard").save()
        def mLecoincoin = new User(username: "Mathilde Lecoincoin", password: "mathilde").save()
        def userClient = new User(username: "client", password: "client").save()

        UserRole.create(userAdmin, roleAdmin, true)
        UserRole.create(userClient, roleClient, true)
        UserRole.create(gLecoincoin, roleAdmin, true)
        UserRole.create(mLecoincoin, roleModerator, true)





        userClient.save(flush: true, failOnError: true)
    }
    def destroy = {
    }
}