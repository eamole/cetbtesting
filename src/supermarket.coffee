###
 this simple file emulates the logic as exercise in the supermarket example
 the logic inputs are
 isLoyaltyCardHolder ?
 discountPreferred - if the loyalty card holder would prefer discounts
 points preferred - if the loyalty card holder would prefer loyalty points
 These two options are mututally exclusive, so only one will be used
 in a "real" system, setters would ensure that setting one, with the other to the opposite value
 spendOver100 - whether the customer spend is over 100 - this is used to determine whether a  non loyalty card holder qualifies for a discount

 inputs :
 isLoyaltyCardHolder
 discountPreferred
 spendOver100

 because the functional spec is unclear as to how to calculate the discounts and points offered to
 loyalty card holders and cash customers, we will return a string indicating one of the

 only one result/action is possible for any given transaction, therefore we can return the value
 3 possible actions
 noDiscount - cash customer, spend <= 100     opposite of discount bellow
 discount  - cash customer, spend > 100       opp of noDiscount above - mutually exclusive
 extraDiscount - loyalty card holder, discount preferred
 loyaltyPoints - loyalty card holder, points preferred

 we could "stub" out the functions which will carry out these actions
 this allows us to write the code (like a driver) before the full implementations are available.
 It also allows us to test the software, as it allows us to return calculated reults, but
 testing the logic is sufficient for illustration

 a more realistic model for the isLoyaltyCardHiolder, would be whether a loyalty card was presented
 at the till - the system would then look up the card number, and determine the customers
 preference - discounts or points

###


module.exports = class Supermarket

  # static method called using class name
  @processTransaction : (spend,isLoyaltyCardHolder,discountPreferred) ->

    if isLoyaltyCardHolder
      if discountPreferred
        action = "loyaltyPoints"
      else
        action = "extraDiscount"
    else
      if spend > 100
        action = "discount"
      else
        action = "noDiscount"

    return action