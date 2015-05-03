require 'spec_helper'

RSpec.describe Event::Address, type: :model do
  describe 'is a document' do
    it { is_expected.to be_mongoid_document }
  end

  describe 'fields' do
    it { is_expected.to have_field(:latitude).of_type(Float) }
    it { is_expected.to have_field(:longitude).of_type(Float) }
    it { is_expected.to have_field(:street).of_type(String) }
    it { is_expected.to have_field(:street_number).of_type(String) }
    it { is_expected.to have_field(:city).of_type(String) }
    it { is_expected.to have_field(:zip).of_type(String) }
    it { is_expected.to have_field(:region).of_type(String) }
    it { is_expected.to have_field(:country).of_type(String) }
    it { is_expected.to have_field(:google_map_url).of_type(String) }
  end

  describe 'associations' do
    it { is_expected.to be_embedded_in(:event).as_inverse_of(:address) }
  end

  describe 'indexes' do
    it { is_expected.to have_index_for(city: 1).with_options(background: true) }
    it { is_expected.to have_index_for(region: 1).with_options(background: true) }
  end
end
