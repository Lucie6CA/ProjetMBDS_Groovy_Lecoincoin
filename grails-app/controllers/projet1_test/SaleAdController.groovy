package projet1_test

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SaleAdController {

    SaleAdService saleAdService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond saleAdService.list(params), model: [saleAdCount: saleAdService.count()]
    }

    def show(Long id) {
        respond saleAdService.get(id)
    }

    def create() {
        respond new SaleAd(params)
    }

    def save(SaleAd saleAd) {
        if (saleAd == null) {
            notFound()
            return
        }
        saleAd.author = springSecurityService.getCurrentUser()

        try {
            saleAdService.save(saleAd)
            // sauvegarder le fichier sur le systeme de fichier du server (ce pc /assets/images/) > le fichier se trouve dans la "request" via une methode getFil
            def f = request.getFile('filename')
            if (f.empty) {
                flash.message = 'file cannot be empty'
                redirect action: 'create'
                return
            }
            // recupérer le nom du fichier sauvegardé
            // = randomvalue

            String nomDeFichier = UUID.randomUUID().toString() + '.png';
            def file = new File(grailsApplication.config.projet1_test.illustrations.path + nomDeFichier)

            while (file.exists()) {
                nomDeFichier = UUID.randomUUID().toString() + '.png';
                file = new File(grailsApplication.config.projet1_test.illustrations.path + nomDeFichier)
            }
            f.transferTo(file)
//                response.sendError(200, 'Done')


            // créer une illustration avec le nom du fichier

            def illustrationInstance = new Illustration(filename: nomDeFichier)

            // rattacher l'illustration à l'annonce

            saleAd.addToIllustrations(illustrationInstance)
            saleAdService.save(saleAd)


        } catch (ValidationException e) {
            respond saleAd.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), saleAd.id])
                redirect saleAd
            }
            '*' { respond saleAd, [status: CREATED] }
        }
    }

    def edit(Long id) {

        respond saleAdService.get(id)
    }

    def update(SaleAd saleAd) {
        if (saleAd == null) {
            notFound()
            return
        }

        try {
            saleAdService.save(saleAd)
        } catch (ValidationException e) {
            respond saleAd.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), saleAd.id])
                redirect saleAd
            }
            '*' { respond saleAd, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        saleAdService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
