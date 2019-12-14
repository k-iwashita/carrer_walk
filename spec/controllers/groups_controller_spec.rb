require 'rails_helper'

RSpec.describe GroupsController, type: :controller do


  describe 'GET #index'do
  before do
    @group = FactoryBot.create(:group)

    get 'index'
  end
  it 'リクエストは200 OKとなること'  do
    expect(response.status).to eq 200
  end
  it '@groupsに全てのユーザーを割り当てること' do
    expect(assigns(:groups)).to match_array([@group])
  end
  it ':indexテンプレートを表示すること' do
    expect(response).to render_template :index
  end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

  end

  describe 'GET #show'do
    it 'assign request group'do
      group = FactoryBot.create(:group)
      get :show, params: { id: group.id }
      expect(assigns(:group)).to eq group
    end

    it 'render show template'do
      group = FactoryBot.create(:group)
      get :show, params: {id: group.id}
      expect(response).to render_template :show
    end
  end



  describe 'POST #create'do
  let(:group_attribues){FactoryBot.attributes_for(:group)}

    it 'save new group'do
      expect do
        post :create, params: {group: group_attribues}
      end.to change(Group, :count).by(1)
    end

    it 'redirects the :create' do
      post :create, params: {group: group_attribues}

      expect(response).to redirect_to groups_path
    end
  end

  describe 'PATCH #update'do
    it '＠groupのリクエストがあるかどうか'do
      group = FactoryBot.create(:group)
      patch :update, params: {id: group.id, group: FactoryBot.attributes_for(:group)}
      expect(assigns(:group)).to eq group
    end

    it '@groupの中身を変更する'do
      group = FactoryBot.create(:group)
      patch :update, params: {id: group.id, group: FactoryBot.attributes_for(:group, name: '七七七七',description: 'テスト')}
      group.reload
      expect(group.name).to eq('七七七七')
      expect(group.description).to eq("テスト")
    end

    it 'リダイレクトがされるかどうか'do
      group = FactoryBot.create(:group)
      patch :update, params: {id: group.id, group: FactoryBot.attributes_for(:group)}
      expect(response).to redirect_to group_path
    end

  end

end
