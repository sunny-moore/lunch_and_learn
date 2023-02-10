# README

This project the backend to a hypothetical recipe app, that will return recipes based on a country that is input.  Users can also 'Learn' about the country entered.  In future I would like to build a front end to be able to utilize this backend.

## Learning Goals For Project ##
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc)
## Setup ##
- clone this repository
- run bundle install
- run rails db:create

## API Keys ##
- [REST Countries API](https://restcountries.com/#api-endpoints-v3-all)
- [Edamam Recipes API(developer)](https://developer.edamam.com/edamam-recipe-api)
- [Youtube Video Search](https://developers.google.com/youtube/v3/docs/search/list) 
- [Unsplash Images](https://unsplash.com/)

## Endpoint use ##
base url will vary, but we used http://localhost:3000

### Get Recipes for a given country ###

  GET /api/v1/recipes?country=thailand

### Get Learning Resources for a given country ###
  GET /api/v1/learning_resources?country=laos

### User Registration ###
you will need to pass name and email in the body of your request.

  POST /api/v1/users

  #### response: ####
  ```
  {
    "data": {
      "type": "user",
      "id": "1",
      "attributes": {
        "name": "Athena Dao",
        "email": "athenadao@bestgirlever.com",
        "api_key": "jgn983hy48thw9begh98h4539h4"
      }
    }
  }
```
### Add User Favorite ###
You will need to pass :api_key, :country, :recipe_link and :recipe_title in the body of the request

  POST /api/v1/favorites

  #### response: ####
  ```
  {
    "success": "Favorite added successfully"
  }
  ```

  ### Get User Favorites ###
  You will need to pass the :api_key in the body of your request
    GET /api/v1/favorites

    #### Response Sample: ####
    
    ```
    {
      "data": [
          {
              "id": "1",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Recipe: Egyptian Tomato Soup",
                  "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                  "country": "egypt",
                  "created_at": "2022-11-02T02:17:54.111Z"
              }
          }
        ]
    }
    ```
