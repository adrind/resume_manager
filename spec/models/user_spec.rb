describe User do

  before(:each) {
    @user = FactoryGirl.create(:user)
    @education = FactoryGirl.create(:education)
    @user.educations.push(@education)
  }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:uid) }
  it { should respond_to :educations }

  it "#name returns a string" do
    expect(@user.name).to match 'Adrienne'
  end

  it "#email returns a string" do
    expect(@user.email).to match 'adriennerules@life.com'
  end

  it "#uid returns a string" do
    expect(@user.uid).to match '1234'
  end

  it "#education is an array of educations" do
    expect(@user.educations).to match_array(@education)
  end

end
