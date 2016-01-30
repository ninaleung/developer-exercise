class Array
  def where(input_hash)
    @results = self
    input_hash.each do |attribute, search_term|
      if search_term.class == Regexp
        @results = @results.select { |quote| quote[attribute] =~ search_term }
      else
        @results = @results.select { |quote| quote[attribute] == search_term }
      end
    end

    @results
  end
end