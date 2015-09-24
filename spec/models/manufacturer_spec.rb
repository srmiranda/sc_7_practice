require 'rails_helper'

RSpec.describe Manufacturer, type: :model do

  context 'manufacturers' do
    let!(:manufacturer) do
      FactoryGirl.create(:manufacturer)
    end

    it "should have a name" do
      expect(manufacturer.name).to eq("Atlas Tech")
    end

    it "should have a country" do
      expect(manufacturer.country).to eq("USA")
    end
  end
end
