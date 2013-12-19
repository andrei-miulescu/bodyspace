json.extract! @post, :id, :headline, :text
json.startDate @post.start_date.strftime('%Y,%m,%d')
json.endDate @post.end_date.strftime('%Y,%m,%d')
json.asset @post.asset