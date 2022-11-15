class Country
  attr_reader :name, :capital, :cap_lat, :cap_lng
  
  def initialize(data)
    @name = data[:name][:common]
    @capital = data[:capital].first if data[:capital].present?
    @cap_lat = data[:capitalInfo][:latlng].first if data[:capitalInfo][:latlng].present?
    @cap_lng = data[:capitalInfo][:latlng].last if data[:capitalInfo][:latlng].present?
  end
end