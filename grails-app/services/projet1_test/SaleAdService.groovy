package projet1_test

import grails.gorm.services.Service

@Service(SaleAd)
interface SaleAdService {

    SaleAd get(Serializable id)

    List<SaleAd> list(Map args)

    Long count()

    void delete(Serializable id)

    SaleAd save(SaleAd saleAd)

}