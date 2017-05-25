class User < ApplicationRecord
  has_many :educations
  has_many :jobs

  accepts_nested_attributes_for :educations
  accepts_nested_attributes_for :jobs

  def self.create_with_omniauth(auth)
    user_builder = UserBuilder.new
    user = user_builder.build(auth)
    user.save
    user
  end
end

