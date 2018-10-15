assert = require("chai").assert
Supermarket = require "../src/supermarket"

describe "Supermarket", ->
  
  describe "Simple Transaction" , ->
    # generate the 4 test cases
    describe "Loyalty Card Holders" , ->
      isLoyaltyCardHolder = true

      it "should return extraDiscount : loyalty card holder, prefers discount" , ->
        assert Supermarket.processTransaction("XXX",isLoyaltyCardHolder,true) , "extraDiscount"

      it "should return points : loyalty card holder, point preferred" , ->
        assert Supermarket.processTransaction("XXX",isLoyaltyCardHolder,false) , "points"

    describe "Cash Customers" , ->
      isLoyaltyCardHolder = false

      it "should return noDiscount : spend <= 100 " , ->
        assert Supermarket.processTransaction(100,isLoyaltyCardHolder,"XXX") , "noDiscount"

      it "should return discount : spend > 100" , ->
        assert Supermarket.processTransaction(101,isLoyaltyCardHolder,"XXX") , "discount"
