assert = require("chai").assert
computeEligibility = require "../src/insurance"
###
  note "XXX" in inputs means the value is irrelevant to the decision process
  in reality you would probably not pass ANY value in - depending on how the coder designed the system
###

describe "Insurance Company Flotation" , ->
  describe "Eligibility Calcs" , ->

# the big split
    describe "Current Policy Holder" , ->

      it "should offer shares : full benefits" , ->
        assert computeEligibility(true , true , true) , "eligibleForShares"

      it "should return cash only : not since 2001" , ->
        assert computeEligibility(true , true , false ) , "eligibleForCash"

      it "should return notEligible - not 'with benefits' policy" , ->
        assert computeEligibility(true , false  , "XXX" ) , "notEligible"

    describe "Not A Current Policy Holder" , ->

      it "should return notEligible - not current policyholder" , ->
        assert computeEligibility(false , "XXX" , "XXX" ) , "notEligible"
