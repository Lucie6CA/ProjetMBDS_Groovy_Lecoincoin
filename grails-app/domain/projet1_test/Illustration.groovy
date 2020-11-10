package projet1_test

class Illustration {

    String filename

    static belongsTo = [saleAd: SaleAd]


    static constraints = {
        filename blank: false, nullable: false
    }
}
