require 'rails_helper'
require 'spec_helper'

feature 'Courses', :type => :feature do

  scenario "Student joins a course" do
    example_user = User.create(name: "Test User", email: "test@test.com")
    example_course = Course.create(name: "Example Course")

    visit "/enrollments/new"
    within "form[data-form='enrollment']" do
      find("[data-field='course_name']").set('Example Course')
      find("[type='submit']").click
    end
    expect(page).to have_selector("[data-enrollment]", course_name: "Example Course", user_id: example_user.id)
  end
end
