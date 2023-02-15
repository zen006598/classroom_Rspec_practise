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

  describe 'GET new' do
    it 'assign @couse' do
      course = build(:course)
      
      get :new

      expect(assigns(:course)).to be_a_new(Course)
    end

    it 'render template' do
      course = build(:course)

      get :new
  
      expect(response).to render_template("new")
    end
  end

  describe 'POST create' do
    it 'create a new course record' do
      course = build(:course)

      expect do
        post :create, params: { course: attributes_for(:course) }
      end.to change{ Course.count }.by(1)
    end

    it "redirects to root_path" do
      course = build(:course)
  
      post :create, params: { :course => attributes_for(:course) }
      expect(response).to redirect_to root_path
    end
  end 

  describe 'GET edit' do
    it 'edit a course record' do
      course = create(:course)
      get :edit, params: { id: course.id}
      expect(assigns[:course]).to eq(course)
    end

    it 'renders the edit' do
      course = create(:course)
      get :edit, params: { id: course.id}
      expect(response).to render_template('edit')
    end
  end

  describe 'PTTCH update' do
    context "when course has title" do
      it 'assign @course' do
        course = create(:course)
        patch :update, params: { id: course.id, course: { title: "Title", description: "Description" } }
        expect(assigns[:course]).to eq(course)
      end

      it 'change the value' do
        course = create(:course)
        patch :update, params: { id: course.id, course: { title: "Title", description: "Description" } }
        expect(assigns[:course].title).to eq('Title')
        expect(assigns[:course].description).to eq('Description')
      end

      it "redirects to course_path" do
        course = create(:course)
    
        patch :update , params: { id: course.id, course: { title: "Title", description: "Description" } }
        expect(response).to redirect_to course_path(course)
      end
    end

    context "when course hasn't title" do
      it "doesn't update a record " do
        course = create(:course)
        put :update, params: { id: course.id, course: { title: '', description: "123" } }
        expect(course.description).not_to eq("123")
      end

      it "renders edit template" do
        course = create(:course)
  
        put :update, params: { id: course.id, course: { title: "", description: "123" } }
  
        expect(response).to render_template("edit")                
      end
    end
   
  end

  describe 'DELETE destroy' do
    it 'deletes a record' do
      course = create(:course)
      delete :destroy, params: { id: course.id}
      expect(Course.count).to be 0
    end

    it 'renders destroy template' do
      course = create(:course)
      delete :destroy, params: { id: course.id}
      expect(response).to redirect_to courses_path
    end
  end
  
end