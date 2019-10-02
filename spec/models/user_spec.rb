require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name, email" do 
    user = FactoryBot.build(:user) 
    expect(user).to be_valid
  end 

  it "is invalid without a name" do
    user = FactoryBot.build(:user)
    user.name = nil
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end 

  it "is invalid without an email address" do 
    user = FactoryBot.build(:user)
    user.email = nil 
    user.valid? 
    expect(user.errors[:email]).to include("を入力してください")
  end 

  it "is invalid without an encrypted_password" do 
    user = FactoryBot.build(:user)
    user.password = nil 
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end 

  it "is invalid if email is already exist" do 
    user = FactoryBot.create(:user)
    user = User.new(
      email: "test@example.com"
    )
    user.invalid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end 
end
