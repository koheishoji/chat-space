require 'rails_helper'

describe MessagesController do

  let(:user) { create(:user) }

  describe 'GET #index' do
    describe 'Login' do
      before do
        login_user user
      end

      it 'assigns the requested contact to @group' do
        group = create(:group)
        get :index, params: { group_id: group.id }
        messages = group.messages
        expect(assigns(:messages)).to eq messages
      end

      it 'renders the :index template' do
        group = create(:group)
        get :index, params: { group_id: group.id }
        expect(response).to render_template :index
      end
    end

    describe 'Logout' do
      it 'redirect_to new_user_session_path' do
        group = create(:group)
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do

    before do
      @group = create(:group)
    end

    describe 'Login' do

      before do
        login_user user
      end

      describe 'can save to the database' do

        it 'save the new message in the database' do
          expect{
            post :create, params: { message: attributes_for(:message), group_id: @group.id }
          }.to change(Message, :count).by(1)
        end

        it 'redirects to messages#index' do
          post :create, params: { message: attributes_for(:message), group_id: @group.id }
          expect(response).to redirect_to group_messages_path(@group.id)
        end
      end

      describe 'can not save to the database' do
        it 'do not save the new message in the database' do
          expect{
            post :create, params: { message: { body: nil, image: nil }, group_id: @group.id }
          }.to change(Message, :count).by(0)
        end

        it 'redirects to messages#index' do
          post :create, params: { message: attributes_for(:message), group_id: @group.id }
          expect(response).to redirect_to group_messages_path(@group.id)
        end
      end
    end

    describe 'Logout' do
      it 'redirect_to new_user_session_path' do
        group = create(:group)
        post :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
