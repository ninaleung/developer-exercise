class Array
  def where(input_hash)
    # @results = []
    input_hash.each do |attribute, search_term|
      if search_term.class == Regexp
        @results = self.select { |quote| quote[attribute] =~ search_term }
      else
        @results = self.select { |quote| quote[attribute] == search_term }
      end
    end

    if input_hash.length > 1
      @results = @results.select do |quote|
      quote[input_hash.keys[0]] == input_hash[input_hash.keys[0]] && 
      quote[input_hash.keys[1]] =~ input_hash[input_hash.keys[1]] 
      end
    end

    @results
  end
end