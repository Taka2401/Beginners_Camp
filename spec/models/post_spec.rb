require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a id, user_id, title, image_id" do
    post = Post.new(
      id: "1",
      user_id: "1",
      title: "初めてのキャンプ",
      image_id: "image"
    )
    expect(post).to be_valid
  end

  it "is valid with a id, user_id, title, image_id"
  it "is invalid without a id"
  it "is invalid without a user_id"
  it "is invalid without a title"
  it "is invalid without an image"

  it "is invalid without a title" do
    post = Post.new(title: nil)
    post.valid?
    expect(post.errors[:title]).to include("を入力してください")
  end

  it "is invalid without an image" do
    post = Post.new(image: nil)
    post.valid?
    expect(post.errors[:image]).to include("を選択してください")
  end

end
