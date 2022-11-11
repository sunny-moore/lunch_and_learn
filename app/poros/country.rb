class Country
  attr_reader :country_list
  
  def initialize(data)
    @country_list = []
    data.each do |country|
      @country_list << country[:name][:common]
    end
  end
end