require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, password" do
    user = User.new(
      name: "Aaron",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    expect(user).to be_valid
  end

  it "is valid with a name, email, password"
  it "is invalid without a name"
  it "is invalid without an email"
  it "is invalid without a password"

  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid without an email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "is invalid without a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "is invalid with a duplicate email" do
    User.create(
      name: "Joe",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
    )
    user = User.new(
      name: "Jane",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

end
