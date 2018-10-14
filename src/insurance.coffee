###

  Insurance company offering benefit/dividents to policy holders, who have "with benefits" policies, especially those who have held
  policy since 2001

  inputs
  isPolicyHolder
  isWithBenefits
  isSince2001

  note wew convert the date of the policy to a simple boolean (yes/no) to reduce the logic in the
  decision tables, and in the code

  outputs
  eligibleForCash
  eligibleForShares
  notEligible

  the system doesn't compute the actual value, only the eligibility
  the outputs are mutually exclusive, but there is a third output where the customer (policy holder or not)
  is not eligible for anything

  we will return the values as strings

###

computeEligibility = (isPolicyHolder , isWithBenefits , isSince2001 ) ->

  eligibility = ""
  if isPolicyHolder
    if isWithBenefits
      if isSince2001
        eligibility = "eligibleForShares"
      else
        eligibility = "eligibleForCash"
    else
      # must be "with benefits"
      eligibility = "notEligible"
  else
    # must be a current policy holder
    eligibility = "notEligible"

  return eligibility


module.exports = computeEligibility