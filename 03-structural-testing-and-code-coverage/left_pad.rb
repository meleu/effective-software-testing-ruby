# Listing 3.5
# left_pad implementation
module LeftPad
  def left_pad(str, size, pad_str)
    return nil if str.nil?

    pad_str = ' ' if pad_str.nil? || pad_str.empty?

    pad_len = pad_str.length
    str_len = str.length
    pads = size - str_len

    # returns original string when possible
    return str if pads <= 0

    if pads == pad_len
      pad_str + str
    elsif pads < pad_len
      pad_str[0, pads] + str
    else
      padding = Array.new(pads)
      pad_chars = pad_str.chars

      pads.times do |i|
        padding[i] = pad_chars[i % pad_len]
      end

      padding.join + str
    end
  end
end
