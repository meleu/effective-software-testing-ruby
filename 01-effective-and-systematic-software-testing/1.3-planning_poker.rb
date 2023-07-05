# Listing 1.3
# Adding validation to prevent invalid inputs

def identify_extremes(estimates)
  if estimates.nil?
    raise(IllegalArgumentException, "estimates cannot be nil")
  end

  if estimates.length <= 1
    raise(IllegalArgumentException, "there has to be more than 1 estimate in the list")
  end

  # continue here...
end
