describe Job do

  before(:each) {
    @user = FactoryGirl.create(:user)
    @job = FactoryGirl.create(:job)
    @job.user = @user
  }

  subject { @job }

  it { should respond_to :start_date }
  it { should respond_to :end_date }
  it { should respond_to :employer }
  it { should respond_to :description }
  it { should respond_to :position }
  it { should respond_to :reason }
  it { should respond_to :location }
  it { should respond_to :user }

  it "#start_date returns a valid date" do
    expect(@job.start_date).to be_a Date
    expect(@job.start_date.year).to match 2017
  end

  it "#end_date returns a valid date" do
    expect(@job.end_date).to be_a Date
    expect(@job.end_date.year).to match 2017
  end

  it "#employer returns a string" do
    expect(@job.employer).to match 'Code for America'
  end

  it "#position returns a string" do
    expect(@job.position).to match 'Engineer'
  end

  it "#description returns a string" do
    expect(@job.description).to match 'Saving the world one rails app at a time'
  end

  it "#reason returns a string" do
    expect(@job.reason).to match 'Fellowship'
  end

  it "#location returns a string" do
    expect(@job.location).to match 'San Francisco'
  end

  it "#user returns a user" do
    expect(@job.user).to be_a User
    expect(@job.user.name).to match 'Adrienne'
  end
end
