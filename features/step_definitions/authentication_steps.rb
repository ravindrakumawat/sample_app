Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error',
    text: 'Invalid email/password combination')
end

Given /^the user has an account$/ do
  @current_user = FactoryGirl.create(:user)
end

Given /^the user submits valid signin information$/ do
  fill_in "Email", with: @current_user.email
  fill_in "Password", with: @current_user.password
  click_button "Sign in"
end

Then /^he should see his profile page$/ do
  page.should have_selector('title', text: @current_user.name)
end

Then /^he should see a signout link$/ do
  page.should have_link('Sign out', herf: signout_path)
end
