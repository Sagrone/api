require 'spec_helper'

RSpec.describe Event::Origin, type: :model do
  describe 'is a document' do
    it { is_expected.to be_mongoid_document }
  end

  describe 'fields' do
    it { is_expected.to have_field(:name).of_type(String) }
    it { is_expected.to have_field(:code_name).of_type(String) }
    it { is_expected.to have_field(:website).of_type(String) }
    it { is_expected.to have_field(:page_url).of_type(String) }
  end

  describe 'associations' do
    it { is_expected.to be_embedded_in(:event).as_inverse_of(:origin) }
  end
end
