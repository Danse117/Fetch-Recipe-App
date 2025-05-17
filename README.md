#  Fetch Recipe Take Home Test

## TODO
[x] Fix splashscreen animation

[x] Create viewModel for Recipe Card to accept data from API call

[] Create viewModel and View for When user clicks on Recipe Card to open FullRecipeCard (Slides up and shows larger picture + youtube video and extra details)
    - Build view and use RecipeCardViewModel for getting recipe names and such
[x] RecipeList: Add refresh to recipe list

[] Create TabBar

[] Add filtering by cuisine to header

[] Account for network usage

[] Create tests

[] Complete questions and answers at the bottom of the README


---

## Goal: 
    - Build a recipe app that displays recipes from an API endpoint (https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json)
    - Application should handle error from both empty data and Malformed data 
        - If a recipe is malformed, your app should disregard the entire list of recipes and handle the error gracefully. 
            - https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json
        -  If the recipes list is empty, the app should display an empty state to inform users that no recipes are available.
            - https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json

---
## Features: 
    - Each recipe shows it's name, photo, and cuisine type
    - Sort recipes
    - User's should have the ability to refresh the list of recipes
---
## Requirements
    - Swift Concurrency: use async/await for operations including API calls and image loading
    - No external dependencies
    - Effiencent Network Usage:
        - Load images only when needed in the UI to avoid unnecessary bandwidth consumption
        -  Cache images to disk to minimize repeated network requests
        - Implement this fully yourself without relying on any third-party solutions, URLSession's HTTP default cache setup, or the URLCache implementation
    - Include Tests: 
        - Use your judgement to determine what should be tested and the appropriate level of coverage. Focus on testing the core logic of your app (e.g., data fetching and caching)
---
## JSON Structure:
```
Key                 Type    Required    Notes
cuisine            string    yes    The cuisine of the recipe.
name               string    yes    The name of the recipe.
photo_url_large    string    no    The URL of the recipes’s full-size photo.
photo_url_small    string    no    The URL of the recipes’s small photo. Useful for list view.
uuid               string    yes    The unique identifier for the receipe. Represented as a UUID.
source_url         string    no    The URL of the recipe's original website.
youtube_url        string    no    The URL of the recipe's YouTube video.
```

---
```
{
    "recipes": [
        {
            "cuisine": "British",
            "name": "Bakewell Tart",
            "photo_url_large": "https://some.url/large.jpg",
            "photo_url_small": "https://some.url/small.jpg",
            "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
            "source_url": "https://some.url/index.html",
            "youtube_url": "https://www.youtube.com/watch?v=some.id"
        },
        ...
    ]
}
```
---

## Answer and questions section:

**Summary:** Include screen shots or a video of your app highlighting its features

**Focus Areas:** What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

**Time Spent:** Approximately how long did you spend working on this project? How did you allocate your time?

**Trade-offs and Decisions:** Did you make any significant trade-offs in your approach?

**Weakest Part of the Project:** What do you think is the weakest part of your project?

**Additional Information:** Is there anything else we should know? Feel free to share any insights or constraints you encountered

---
