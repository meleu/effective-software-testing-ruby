# Listing 2.1
# Implementing the substring_between method

module StringUtils
  def substrings_between(str, open, close)
    return nil if str.nil? || open.nil? || close.nil? || open.empty? || close.empty?

    str_len = str.length
    return [] if str_len.zero?

    close_len = close.length
    open_len = open.length
    list = []
    pos = 0

    while pos < str_len - close_len
      start = str.index(open, pos)
      break if start.nil?

      start += open_len

      finish = str.index(close, start)
      break if finish.nil?

      list << str[start...finish]
      pos = finish + close_len
    end

    return null if list.empty?

    list
  end
end
