json.array!(@user_pages) do |user_page|
  json.extract! user_page, :id
  json.url user_page_url(user_page, format: :json)
end
