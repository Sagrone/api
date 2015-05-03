require 'spec_helper'

RSpec.describe Event::Organizer, type: :model do
  describe 'is a document' do
    it { is_expected.to be_mongoid_document }
  end

  describe 'has fields' do
    it { is_expected.to have_field(:email).of_type(String) }
    it { is_expected.to have_field(:name).of_type(String) }
    it { is_expected.to have_field(:phone).of_type(String) }
    it { is_expected.to have_field(:website).of_type(String) }
  end

  describe 'associations' do
    it { is_expected.to be_embedded_in(:event).as_inverse_of(:organizer) }
  end
end
