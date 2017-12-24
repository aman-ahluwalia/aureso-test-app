require 'rails_helper'

RSpec.describe 'V3', type: :request do
  describe 'Calculate and Get car info' do

    let(:headers) do
      {
        'Accept' => 'application/json',
        'Api-Version' => 'application/vnd.aureso-v1+json'
      }
    end

    before(:each) do
      load "#{Rails.root}/db/seeds.rb"

      # Setting "now" to December 25, 2017 4:00:00 AM
      Timecop.travel(Time.local(2017, 12, 25, 4, 0, 0))
    end

    it 'car not found with the particular slug' do
      get "/api/v1/cars/foobar", {}, headers
      expect(response).to have_http_status(200)
      rsp = JSON.parse(response.body)
      expect(rsp).to be_a(Hash)
      expect(rsp['message']).to eql('Car not found')
    end

    it 'track not specified' do
      get "/api/v1/cars/subaru_impreza", {}, headers
      expect(response).to have_http_status(200)
      rsp = JSON.parse(response.body)
      expect(rsp).to be_a(Hash)
      expect(rsp['car']['max_speed_on_track']).to eql('no track selected')
    end

    it 'invalid track mentioned' do
      get "/api/v1/cars/subaru_impreza", {'track'=>'foobar'}, headers
      expect(response).to have_http_status(200)
      rsp = JSON.parse(response.body)
      expect(rsp).to be_a(Hash)
      expect(rsp['car']['max_speed_on_track']).to eql('track not found')
    end

    it 'correctly retards the speed with time (morning 4 am) and track condition' do
      factor = Factor.create(property: 'surface_type', kind: 'sand', resistance: 25)
      track = Track.create(name: 'foobar', country: 'Germany', timezone: '+0:00', factor: factor)
      get "/api/v1/cars/subaru_impreza", {'track'=>'foobar'}, headers
      expect(response).to have_http_status(200)
      rsp = JSON.parse(response.body)
      expect(rsp).to be_a(Hash)
      expect(rsp['car']['max_speed']).to eql('280km/h')
      expect(rsp['car']['max_speed_on_track']).to eql('178.5km/h')
    end


  end
end
