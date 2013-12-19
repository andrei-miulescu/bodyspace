class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :timelines

  def timelines
    Timeline.where(:user_id => id).collect(&:id)
  end
end
