# spec/support/features/session_helpers.rb
module Features
  module SessionHelpers
    def sign_in(user, password = 'password')
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: password
      click_button 'Log in'
    end
  end
end
