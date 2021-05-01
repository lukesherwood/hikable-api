require 'rails_helper'

describe Review, type: :model do
  it 'has no reviews at the start' do
    expect(Review.count).to eq(0)
  end
end
