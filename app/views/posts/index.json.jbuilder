json.array! @posts do |post|
  json.id post.id
  json.title post.title
  json.description post.description
  json.is_active post.is_active
  json.published_date post.published_date
end