describe Education do

  before(:each) {
    @user = FactoryGirl.create(:user)
    @education = FactoryGirl.create(:education)
    @education.user = @user
  }

  subject { @education }

  it { should respond_to(:name) }
  it { should respond_to(:level) }
  it { should respond_to(:year) }
  it { should respond_to :user }

  it "#name returns a string" do
    expect(@education.name).to match 'My school'
  end

  it "#level returns a string" do
    expect(@education.level).to match 'College'
  end

  it "#year returns an integer" do
    expect(@education.year).to match 2013
  end

  it "#user is user model" do
    expect(@education.user).to match(@user)
  end

end
