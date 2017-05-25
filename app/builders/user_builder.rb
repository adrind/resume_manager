class UserBuilder
  def initialize
    @user = User.new
  end

  def build(response)
    @user.provider = response['provider']
    @user.uid = response['uid']
    @user.name = response['info']['name']
    @user.email = response['info']['email']

    extra_data = response['extra']

    if extra_data
      data = extra_data['raw_info']

      if data['education']
        data['education'].each {|ed| add_education(ed)}
      end

      if data['work']
        data['work'].each {|work| add_job(work)}
      end
    end
    @user
  end

  def add_education(education)
    year = education['year'] || {}
    school = education['school'] || {}
    @user.educations.build(name: school['name'], level: education['type'], year: year['name'], user: @user)
  end

  def add_job(job)
    employer = job['employer'] || {}
    location = job['location'] || {}
    position = job['position'] || {}

    @user.jobs.build(start_date: job['start_date'], end_date: job['end_date'], employer: employer['name'], location: location['name'], position: position['name'], description: job['description'], user: @user)
  end
end