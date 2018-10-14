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

      it "full benefits - should offer shares" , ->
        assert computeEligibility(true , true , true) , "eligibleForShares"

      it "not since 2001 - cash only " , ->
        assert computeEligibility(true , true , false ) , "eligibleForCash"

      it "not with benefits - ineligible " , ->
        assert computeEligibility(true , false  , "XXX" ) , "notEligible"

    describe "Not A Current Policy Holder" , ->

      it "not current - ineligible " , ->
        assert computeEligibility(false , "XXX" , "XXX" ) , "notEligible"
