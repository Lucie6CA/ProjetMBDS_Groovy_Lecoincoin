package projet1_test

import grails.converters.JSON
import grails.converters.XML

class ApiController {

    SaleAdService saleAdService
    UserService userService

    def index() { render txt: "ok" }


    def saleAd() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id)
                if (!saleAdInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render saleAdInstance as XML }
                    json { render saleAdInstance as JSON }
                }

                break
            case "PUT":
                if (!params.id)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id)
                if (!saleAdInstance)
                    return response.status = 404

                def title = request.JSON.title
                saleAdInstance.title = title

                def description = request.JSON.description
                saleAdInstance.description = description

                def longDescription = request.JSON.longDescription
                saleAdInstance.longDescription = longDescription

                def price = request.JSON.price
                saleAdInstance.price = price

                saleAdService.save(saleAdInstance)

                /*response.withFormat {
                    xml{render saleAdInstance as XML}
                    json{render saleAdInstance as JSON}

                }
                 */
                break

        /*case "PATCH":
            if (!params.id)
                return response.status=400
            def saleAdInstance = SaleAd.get(params.id)
            if(!saleAdInstance)
                return response.status=404

            break

         */
            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id)
                if (!saleAdInstance)
                    return response.status = 404

                saleAdService.delete(saleAdInstance.id)
                //ou
                //saleAdInstance.delete()
                0
                //def userInstance = saleAdInstance.author
                //userInstance.removeFromSaleAds(saleAdInstance)

                //userInstance.save(flush: true)

                break

            default:
                return response.status = 405
                break


        }
        return response.status = 406
    }

    def saleAds() {
        switch (request.getMethod()) {
            case "GET":


                /*if (!params.id)
                    return response.status = 400

                 */

                def saleAdInstance = SaleAd.getAll()
                if (!saleAdInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render saleAdInstance as XML }
                    json { render saleAdInstance as JSON }

                }


                break

            case "POST":
                /*if (!params.id)
                    return response.status = 400
                 */
                def saleAdInstance = new SaleAd(
                        title: request.JSON.title,
                        description: request.JSON.description,
                        longDescription: request.JSON.longDescription,
                        price: request.JSON.price
                )
                if (!saleAdInstance)
                    return response.status = 404

                /*def saleAdInstance = SaleAd.create()
                if (!saleAdInstance)
                    return response.status = 404

                def title = request.JSON.title
                saleAdInstance.title = title

                def description = request.JSON.description
                saleAdInstance.description = description

                def longDescription = request.JSON.longDescription
                saleAdInstance.longDescription = longDescription

                def price = request.JSON.price
                saleAdInstance.price = price
                */

                /* en dernier
                 def illustrations = request.JSON.illustrations
                 saleAdInstance.illustrations = illustrations
                 */


                def id = request.JSON.author
                def userInstance = User.get(id)
                userInstance.addToSaleAds(saleAdInstance)

                userInstance.save(flush: true)

                return response.status = 201

                break

        }
    }

    def user() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }

                break
            case "PUT":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404

                def username = request.JSON.username
                userInstance.username = username

                def password = request.JSON.password
                userInstance.password = password


                userService.save(userInstance)

                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }

                }
                break


            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404

                User.withTransaction {
                    status ->
                        UserRole.removeAll(userInstance)
                        userService.delete(userInstance.id)
                }
                return response.status = 200


                //def userInstance = saleAdInstance.author
                //userInstance.removeFromSaleAds(saleAdInstance)

                //userInstance.save(flush: true)

                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406

    }

    def users() {
        switch (request.getMethod()) {
            case "GET":

                def userInstance = User.getAll()
                if (!userInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }

                break
            case "POST":
                /*if (!params.id)
                    return response.status = 400
                 */
                def userInstance = new User(
                        username: request.JSON.username,
                        password: request.JSON.password,
                )
                if (!userInstance.save(flush:true))
                    return response.status = 400

                UserRole.create(userInstance, Role.get(request.JSON.role),true)

                response.withFormat{
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }

                break

        }

    }
}