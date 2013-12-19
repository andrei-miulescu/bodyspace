class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :timelines

  def timelines
    Timeline.where(:user_id => id).map{|t| {id: t.id, headline: t.headline}}
  end
end
