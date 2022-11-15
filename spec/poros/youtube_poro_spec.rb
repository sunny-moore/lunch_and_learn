require 'rails_helper'

RSpec.describe 'Youtube Poro' do
  it 'exists and has attributes' do
    data = {
      id: {
        videoId: "uw8hjVqxMXw"
      },
      snippet: {
        title: "A Super Quick History of Laos"
      }
    }

    video = Youtube.new(data)

    expect(video).to be_a Youtube
    expect(video.video_id).to eq(data[:id][:videoId])
    expect(video.title).to eq(data[:snippet][:title])
  end
end