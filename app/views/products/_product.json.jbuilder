json.extract! product, :id, :name, :description, :price, :dairy_free_boolean, :gluter_free, :kosher, :peanut_free, :vegan, :vegetarian, :available, :catering, :featured, :created_at, :updated_at
json.url product_url(product, format: :json)
