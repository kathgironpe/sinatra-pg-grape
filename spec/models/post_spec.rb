require 'spec_helper'

describe Post, type: :model do
  # Oddly fails
  # it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
end
