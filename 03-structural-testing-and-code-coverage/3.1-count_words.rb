# Listing 3.1
# Implementing the CountWords program
class CountWords
  def self.count(str)
    words = 0
    last = ' '

    str.chars.each do |char|
      if !letter?(char) && (last == 's' || last == 'r')
        words += 1
        # the line below would be more rubyist:
        # words += 1 if !letter?(char) && %w[s r].include?(last)
      end

      last = char
    end

    if last == 's' || last == 'r'
      words += 1
    end

    words
  end

  def self.letter?(char)
    char.match?(/[[:alpha:]]/)
  end
end
