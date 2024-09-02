require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'User CRUD' do
    describe 'in before login' do
      describe 'create new user' do
        context 'do input correct value to form' do
          it 'is successed create new user' do
            visit login_path
            fill_in 'Email', with: 'test@example.com'
            fill_in 'Password', with: 'password'
            fill_in 'password confirmation', with: 'password'
            click_button 'Regist'
            expect(current_path).to eq login_path
            expect(page).to have_content 'User was successfully created.'
          end
        end

        context "don't input email address" do
          it 'is failed create new user' do
            visit login_path
            fill_in 'Email', with: nil
            fill_in 'Password', with: 'password'
            fill_in 'Password confirmation', with: 'password'
            click_button 'Regist'
            expect(current_path).to eq users_path
            expect(page).to have_content "Email can't be blank."
          end
        end
        context 'duplidcate email address' do
          it 'is failed create new user' do
            visit login_path
            fill_in 'Email', with: user.email
            fill_in 'Password', with: 'password'
            fill_in 'password confirmation', with: 'password'
            click_button 'Regist'
            expect(current_path).to eq users_path
            expect(page).to have_content 'Email has already been taken.'
          end
        end
      end
    end
  end
end