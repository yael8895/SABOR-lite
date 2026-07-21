json.extract! recipe, :id, :name, :image, :total_views, :weekly_views, :total_scores, :score, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
