class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments

  def users_attributes=(user_attributes)
    category_attributes.values.each do |user_attribute|
      category = Category.find_or_create_by(user_attribute)
      self.categories << category
    end
  end
end
