class Country
  attr_reader :name
  
  def initialize(data)
    @name = data[0][:name][:common]
  end
end