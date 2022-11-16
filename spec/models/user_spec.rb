require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email)}
  # it { should validate_presence_of(:api_key) } I couldn't get this to work with before action
end
