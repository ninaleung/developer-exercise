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

    @results
  end
end