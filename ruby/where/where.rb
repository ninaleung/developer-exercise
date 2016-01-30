class Array
  def where(input_hash)
    # @results = []
    input_hash.each do |key, value|
      @results = self.select { |quote| quote[key] == value }
    end

    @results
  end
end