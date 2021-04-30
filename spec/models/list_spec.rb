require 'rails_helper'

describe List, type: :model do
  it "has no lists at the start" do
    expect(List.count).to eq(0)
  end
end
