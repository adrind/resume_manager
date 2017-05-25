# Feature: Sign out
#   As a user
#   I want to sign out
#   So I can protect my account from unauthorized access
feature 'Sign up', :omniauth do

  # Scenario: User signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario 'user signs up successfully' do
    signin
    expect(page).to have_content 'Users: 1 registered'
    click_link 'Users'
    click_link 'Adrienne'
    page.has_selector?('form')
    expect(form_field('name')).to match 'Adrienne'
    expect(form_field('email')).to match 'adrienne@adrienne.com'

    expect(form_ed_field('name')).to match 'Ivy Puppiez'
    expect(form_ed_field('level')).to match 'Puppy academy'
    expect(form_ed_field('year')).to match '2017'

    expect(form_job_field('position')).to match 'Puppy cuddler'
    expect(form_job_field('employer')).to match 'SPCA'
    expect(form_job_field('start_date')).to match '2017-02-01'

  end

end
