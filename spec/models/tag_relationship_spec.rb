require 'rails_helper'

RSpec.describe TagRelationship, type: :model do
  it "is valid with a id, tag_id, post_id" do
    tagrelationship = TagRelationship.new(
      id: "1",
      tag_id: "1",
      post_id: "1"
    )
    expect(tagrelationship).to be_valid
  end

  it "is valid with a id, tag_id, post_id"
end
