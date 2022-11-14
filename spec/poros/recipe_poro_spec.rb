require 'rails_helper'

RSpec.describe 'Recipe Poro' do
  context 'Happy Path' do
    it 'exists and has attributes' do
      country = 'Thailand'
      data =
        {
          "recipe": {
            "uri": 'http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9',
            "label": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
            "image": 'https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIHc9gqpBFRuCxCmHsmkqkwDUBW2OAhGM195WKrN28xoNAiAkteZCm9PXa3Anb1eEPo3t7KcpaNREjEpYpJTYlVhOLSrVBAiY%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDE4NzAxNzE1MDk4NiIMyE3KIJIUEv25ZD%2BWKqkEgyKLRnSh6FM4rffBjViDQN8XX8oNTHYw3v0P1OVdcNikCTLK6iKr1QpSUg58ebcxVE0I9ykSlu4Z4D1V8KTP5QeU%2BtOCUcJnsHR9kPeRABIg1tdDOwW1H%2B9YRdH1FKh02eSmGeVXm4KClbfGWKCzkKBzU9meSQ%2BA5YG29OGs82PnNH2Y87dhx8%2FBhCTVYP%2Fybv4tgbSh8XwO3WdGO1Noy2zVzv9kAOa%2F8x8DpGW8kLuCQVI4PHGJM5%2FfWd0DoCPXL%2FaRtuku%2FLIqV1S03EbE5dbFadK%2BcMlnPPTI%2BJAKD5ocUb4t4EIyQHqiW3HAsHhK6WB%2Fts%2FxYcWUhNeMlcgXls2LBYeNFkyKSy7vRRfnPww18rkFsFLJJ%2BBXCKKv55l7CIZMBAmcpGt2XOh9jwTeqqaQgJUT4UqimFxn8E6QhTloFwCN8MFOlNy%2B8NgOEWPt5SKKBZOnfPJO0qUnOb%2BvpnWUJVMouBZ6vPmeUkh1C4E2uGm2Xqdeb0n3dPSdfL5ej0KTrL3oeCZduAk34IxEZvKkW08WQzdaFLLfLp7OxOA%2FtiqhCnwBkpxBHTqnzVIkU6sk1lIKrsqzKrIIKvP8id2C%2BPMSCagAungi481djAV7oGM0rHochjQEWkoRV%2FcKkVqsy1XTFSriSriYCyqajAJ4fAA2Re%2FisnnF0uRusIm1%2BExi7Ow20D%2Fe6N9EpVLKxY3xmq9ZN5CeYVFaZbHRVRlFlixkegD%2BODD1p7ubBjqqAQnMbEoVPP8EY3XpcwogaT2UDVSlnjpnxeTcoHe07GJTu0RBVhvEBOXfJ1UBm8bricXs3lIR3X2cOgRJitvglYsP%2FeAnZeD8eIph4NthMVFAPMxFFC9TtiVYLy9k7FdJXViuZ4KtcCbo4AXLIyjTtmmqinOGQ9YIBHLnx3GO%2BJKV5O%2BVacFbxjSOud4PEeD%2FK8RlOqniOHZSJRy9Mq54jw5RPGqInt89C2u0&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221111T231551Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHVNC3Q5R%2F20221111%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e5427ab952834c329e708fddbee54696019d6133f9b15db1b95e8164d7b360aa',
            "source": 'Serious Eats',
            "url": 'https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html'
          }
        }

      recipe = Recipe.new(country, data)
      expect(recipe.title).to eq(data[:recipe][:label])
      expect(recipe.image_url).to eq(data[:recipe][:image])
      expect(recipe.recipe_url).to eq(data[:recipe][:url])
    end
  end
end
