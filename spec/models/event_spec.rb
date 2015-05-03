require 'spec_helper'

RSpec.describe Event, type: :model do
  it 'should be defined' do
    expect(described_class).to_not be_nil
  end

  describe 'is a document' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to be_timestamped_document }
  end

  describe 'has fields' do
    it { is_expected.to have_field(:title).of_type(String) }
    it { is_expected.to validate_presence_of(:title) }

    it { is_expected.to have_field(:description).of_type(String) }
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to have_field(:coordinates).of_type(Array) }
  end

  describe 'associations' do
    it { is_expected.to embed_one(:organizer) }
  end

  describe 'indexes' do
    it { is_expected.to have_index_for(coordinates: '2d').with_options(min: -180, max: 180) }
  end
end
