require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "sets @users" do
      u = FactoryGirl.create(:user)
      get :index
      assigns(:users).should == [u]
    end

    describe "GET 'new'" do
      it "responds with success" do
        get :new
        response.should be_success
      end

      it "displays the new form" do
        get :new
        response.should render_template("new")
      end

      it "assigns @user" do
        get :new
        assigns(:user).should be_instance_of(User)
      end
    end

    describe "POST 'create'" do
      describe "when data is valid" do
        it "saves the user" do
          expect {
            post :create,
                 user: {first_name: "Joe", last_name: "Smith"}
          }.to change{User.count}.by(1)
        end
        it "redirects to the show page" do
          post :create, user: {first_name: "Joe", last_name: "Smith"}
          response.should redirect_to(user_path(User.last.id))
        end
      end
      describe "when data is not valid" do
        it "does not save the user" do
          expect {
            post :create, user:{}
          }.to_not change{User.count}
        end
        it "returns to the new page" do
          post :create, user:{}
        end
      end

    end

    describe "GET 'show'" do
      before do
        @user = FactoryGirl.create(:user)
      end
      it "sets @user" do
        get :show, :id => @user.id
        assigns(:user).should == @user
      end
      it "renders 'show' template" do
        get :show, :id => @user.id
        response.should render_template('show')
      end
    end

    describe "GET 'edit'" do
      before do
        @user = FactoryGirl.create(:user)
      end
      it "sets @user" do
        get :edit, :id => @user.id
        assigns(:user).should == @user
      end
      it "renders 'edit' template" do
        get :edit, :id => @user.id
        response.should render_template('edit')
      end
    end

    describe "PUT 'update'" do

      before do
        @user = FactoryGirl.create(:user)
      end

      describe "when data is valid" do
        it "sets @user" do
          get :update, :id => @user.id
          assigns(:user).should == @user
        end
        it "renders 'show' template" do
          get :update, {:id => @user.id, :first_name => "Bob", :last_name => "Villa"}
          response.should redirect_to(user_path(@user.id))
        end
      end

      describe "when data is invalid" do
        it "does not save the user" do
          put :update, {:id => @user.id, :user => {:first_name => '', :last_name => "Villa"}}
          response.should be_success
          response.should render_template("edit")
        end
      end

    end

  end

end
