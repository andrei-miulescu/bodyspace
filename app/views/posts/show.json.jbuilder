json.extract! @post, :id, :headline, :text
json.image @post.image.url(:high)