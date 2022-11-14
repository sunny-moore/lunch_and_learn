class Country
  attr_reader :name, :capital, :cap_lat, :cap_lng
  
  def initialize(data)
    @name = data[0][:name][:common]
    @capital = data[0][:capital][0]
    @cap_lat = data[0][:capitalInfo][:latlng][0]
    @cap_lng = data[0][:capitalInfo][:latlng][1]
  end
end