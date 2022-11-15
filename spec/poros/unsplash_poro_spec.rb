require 'rails_helper'

RSpec.describe 'Unsplash Poro' do
  context 'Happy Path' do
    it 'exists and has attributes' do
      data = {
            "alt_description": "standing statue and temples landmark during daytime",
            "urls": {
                "raw": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzODEwMDR8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njg1NDAwMzg&ixlib=rb-4.0.3",
              }
            }


      photo = Unsplash.new(data)

      expect(photo).to be_a Unsplash
      expect(photo.alt_tag).to eq(data[:alt_description])
      expect(photo.url).to eq(data[:urls][:raw])
    end
  end
end