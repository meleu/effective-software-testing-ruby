# Listing 4.1
# TaxCalculator with pre- and post-conditions

class TaxCalculator
  def calculate_tax(value)
    raise(StandardError, 'Value cannot be negative.') if value.negative?

    tax_value = 0

    # some complex business rule here...
    # final value goes to tax_value

    raise(StandardError, 'Calculated tax value cannot be negative.') if tax_value.negative?

    tax_value
  end
end
