require 'rails_helper'

describe 'イベント作成', type: :system do
    let(:user) { FactoryBot.create(:user, name: 'user_a', email: 'user@test.com')}

    before do
      visit user_session_path
      fill_in 'Eメール', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'Log in'
      visit event_path(event)
    end

    let(:event){FactoryBot.create(:event)}

    describe 'イベントの作成'do
      before do
        visit new_event_path
        fill_in 'タイトル',with: "title"
        fill_in '会場', with: "location"
        select_date("2019,9,28", from: "event_started_at")
        select_time("13", "00", from: "event_started_at")
        click_button 'イベント作成'
      end

      context '有効な値を入力する' do
        let(:title){'test'}
        let(:location){'test'}
        let(:started_at){"2019-11-23 03:18:38"}


      end
      context '無効な値を入力する'do
        let(:title){''}
        let(:location){''}
        let(:started_at){" "}
      end

      it '作成されない' do
        expect(page).to have_content '作成できませんでした'
      end


    end




end
