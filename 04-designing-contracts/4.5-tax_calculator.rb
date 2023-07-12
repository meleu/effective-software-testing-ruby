# Listing 4.5
# TaxCalculator returning an error code instead of an exception

def calculate_tax(value)
  # pre-condition check
  return 0 if value.negative? # If the pre-condition does not hold, the method
                              # returns 0. The client of this method does not
                              # need to worry about exceptions.

  # method continues...
end
