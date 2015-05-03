require 'spec_helper'

RSpec.describe Event::Image, type: :model do
  describe 'is a document' do
    it { is_expected.to be_mongoid_document }
  end

  describe 'fields' do
    it { is_expected.to have_field(:title).of_type(String) }

    it { is_expected.to have_field(:url).of_type(String) }
    it { is_expected.to validate_presence_of(:url) }

    it { is_expected.to have_field(:width).of_type(Integer) }
    it { is_expected.to have_field(:height).of_type(Integer) }
  end

  describe 'associations' do
    it { is_expected.to be_embedded_in(:event).as_inverse_of(:images) }
  end
end
