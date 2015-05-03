require 'spec_helper'

RSpec.describe Event, type: :model do
  describe 'is a document' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to be_timestamped_document }
  end

  describe 'fields' do
    it { is_expected.to have_field(:title).of_type(String) }
    it { is_expected.to validate_presence_of(:title) }

    it { is_expected.to have_field(:summary).of_type(String) }

    it { is_expected.to have_field(:description).of_type(String) }
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to have_field(:coordinates).of_type(Array) }
    it { is_expected.to have_field(:tags).of_type(Array).with_default_value_of([]) }
  end

  describe 'associations' do
    it { is_expected.to embed_one(:address) }
    it { is_expected.to embed_one(:date) }
    it { is_expected.to embed_one(:organizer) }
    it { is_expected.to embed_one(:origin) }
    it { is_expected.to embed_many(:images) }
  end

  describe 'indexes' do
    it { is_expected.to have_index_for(coordinates: '2d').with_options(min: -180, max: 180) }
  end
end
