class RecipeSerializer
  include JSONAPI::Serializer

  set_id {nil}
  attributes  :title,
              :country,
              :image_url,
              :recipe_url
end