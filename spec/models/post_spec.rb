require 'spec_helper'

describe Post do
  subject { described_class.new(title: 'A title', body: 'A body') }

  describe 'validations' do
    context 'with valid attributes' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'without a title' do
      it 'returns errors on title' do
        subject.title = nil
        expect(subject).to_not be_valid
      end
    end

    context 'without a body' do
      it 'returns errors on body' do
        subject.body = nil
        expect(subject).to_not be_valid
      end
    end
  end

  describe '.published' do
    context 'when there are published posts' do
      let!(:post) { create(:post) }

      it 'returns published posts' do
        expect(Post.published.count).to eq(1)
      end
    end
  end
end
