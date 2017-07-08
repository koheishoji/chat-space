json.array! @messages do |message|
  json.id message.id
  json.user_name  message.user.name
  json.date       message.created_at
  json.body       message.body
  json.image_url  message.image_url
end
