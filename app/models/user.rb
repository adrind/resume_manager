class User < ApplicationRecord
  has_many :educations
  accepts_nested_attributes_for :educations

  def self.create_with_omniauth(auth)
    user_builder = UserBuilder.new
    user = user_builder.build(auth)
    user.save
    user
  end
end

