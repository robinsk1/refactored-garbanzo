# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Github::Api::Search do
  describe '.repos' do
    let(:search_term) { 'adjust' }
    subject { described_class.new(search_term) }
    it 'calls github search repo api with search params' do
      stub_request(:get, 'https://api.github.com/search/repositories')
        .with(query: { 'q' => search_term })
        .to_return(body: [{ name: 'adjust-repo' }], status: 200)

      expect(subject.repos.body).to eq([{ name: 'adjust-repo' }])
    end
  end
end
