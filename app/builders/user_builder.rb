class UserBuilder
  def initialize
    @user = User.new
  end

  def build(response)
    @user.provider = response['provider']
    @user.uid = response['uid']
    @user.name = response['info']['name'] || ""

    if response['extra']['raw_info']
      response['extra']['raw_info']['education'].each {|ed| add_education(ed)}
    end

    @user
  end

  def add_education(education)
    Education.create(name: education['school']['name'], level: education['type'], year: education['year']['name'], user: @user)
  end
end