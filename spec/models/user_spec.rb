require 'rails_helper'

describe User, type: :model do
  it "has no users at the start" do
    expect(User.count).to eq(0)
  end
end
