class User < ApplicationRecord
  has_many :educations

  def self.create_with_omniauth(auth)
    user_builder = UserBuilder.new

    user_builder.build(auth)

    if auth['extra']['raw_info']
      auth['extra']['raw_info']['education'].each {|ed| user_builder.add_education(ed)}
    end
  end

end

class UserBuilder
  def initialize
    @user = User.new
  end

  def build(response)
    @user.provider = response['provider']
    @user.uid = response['uid']
    @user.name = response['info']['name'] || ""
    @user.save
  end

  def add_education(education)
    @user.educations.create(name: education['school']['name'], level: education['type'], year: education['year']['name'])
  end
end