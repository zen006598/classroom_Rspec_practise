require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "GET index" do
    it "assigns @courses and render template" do
      course1 = create(:course)
      course2 = create(:course)

      get :index

      expect(assigns[:courses]).to eq([course1, course2])
      expect(response).to render_template("index")
    end
  end

  describe 'GET show' do
    it 'assign @couse' do
      course = create(:course)
      get :show, params: {id: course.id}
      expect(assigns[:course]).to eq(course)
    end

    it 'render template' do
      course = create(:course)
      get :show, params: {id: course.id}
      expect(response).to render_template('show')
    end
  end
end