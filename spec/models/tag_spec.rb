require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "is valid with a id, name" do
    tag = Tag.new(
      id: "1",
      name: "ソロキャンプ"
    )
    expect(tag).to be_valid
  end
  
  it "is valid with a id, name"
  
end
