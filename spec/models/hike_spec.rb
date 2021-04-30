require 'rails_helper'

describe Hike, type: :model do
  it "has no hikes at the start" do
    expect(Hike.count).to eq(0)
  end
end
