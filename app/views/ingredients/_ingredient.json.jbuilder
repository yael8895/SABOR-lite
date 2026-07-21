json.extract! ingredient, :id, :sponsor_id, :name, :unit_price, :image, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
