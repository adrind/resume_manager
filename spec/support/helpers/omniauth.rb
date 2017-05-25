module Omniauth

  module Mock
    def auth_mock
      OmniAuth.config.mock_auth[:facebook] = {
        'provider' => 'facebook',
        'uid' => '123545',
        'info' => {
          'name' => 'Adrienne'
        },
        'extra' => {
            'raw_info' => {
              'work' => [
                  {
                      'position' => {
                          'name' => 'Puppy cuddler'
                      },
                      'employer' => {
                          'name' => 'SPCA'
                      },
                      'location' => {
                          'name' => 'Where the puppies are'
                      },
                      'start_date' => '2017-02-01',
                      'description' => 'Cuddling puppies day n nite'
                  }
              ],
              'education' => [
                  {
                      'school' => {
                          'name' => 'Ivy Puppiez'
                      },
                      'type' => 'Puppy academy',
                      'year' => {
                          'name' => '2017'
                      }
                  }
              ]
            }
          },
        'credentials' => {
          'token' => 'mock_token',
          'secret' => 'mock_secret'
        }
      }
    end
  end

  module SessionHelpers
    def signin
      visit root_path
      expect(page).to have_content("Sign in plz")
      auth_mock
      click_link "Here"
    end

    def form_field(key)
      find_field(id: "user_#{key}").value
    end

    def form_ed_field(key)
      find_field(id: "user_educations_attributes_0_#{key}").value
    end

    def form_job_field(key)
      find_field(id: "user_jobs_attributes_0_#{key}").value
    end
  end

end
