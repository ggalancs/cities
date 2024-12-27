require 'spec_helper'

describe Cities::City do
  context 'toronto' do
    subject(:toronto) { Cities.cities_in_country('CA')['toronto'] }

    it { expect(toronto).to be_a(Cities::City) }
    it { expect(toronto.name).to eq('Toronto') }
    it { expect(toronto.latitude).to be_a(Float) }
    it { expect(toronto.longitude).to be_a(Float) }
    it { expect(toronto.latlong).to be_an(Array) }
    it { expect(toronto.population).to be_an(Integer) }
    it { expect(toronto.region).to be_a(String) }
  end

  context 'dvadtsat' do
    subject(:dvadtsat) { Cities.cities_in_country('TJ')["22 (dvadtsat' vtorogo) parts''yezd"] }

    it { expect(dvadtsat).to be_a(Cities::City) }
    it { expect(dvadtsat.name).to eq("22 (Dvadtsat' Vtorogo) Parts''yezd") }
    it { expect(dvadtsat.population).to be_nil }
  end

  describe '::cities_in_country' do
    subject { Cities.cities_in_country('US') }

    it { expect(subject).to be_a(Hash) }
    it { expect(subject.keys).to include('seattle') }
    it { expect(subject['seattle']).to be_a(Cities::City) }
  end

  describe '::cities_in_country?' do
    it 'returns true for country with cities file' do
      expect(Cities.cities_in_country?('US')).to be_truthy
    end

    it 'returns false otherwise' do
      expect(Cities.cities_in_country?('XX')).to be_falsey
    end
  end
end