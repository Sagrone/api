require 'spec_helper'

RSpec.describe Event::Date, type: :model do
  describe 'is a document' do
    it { is_expected.to be_mongoid_document }
  end

  describe 'fields' do
    it { is_expected.to have_field(:start_at).of_type(Time) }
    it { is_expected.to have_field(:end_at).of_type(Time) }
  end

  describe 'associations' do
    it { is_expected.to be_embedded_in(:event).as_inverse_of(:date) }
  end

  describe 'indexes' do
    it { is_expected.to have_index_for(start_at: 1).with_options(background: true) }
    it { is_expected.to have_index_for(end_at: 1).with_options(background: true) }
  end
end
