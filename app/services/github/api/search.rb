# frozen_string_literal: true

module Github
  module Api
    #
    # returns a list of github repos matching our search params
    #
    class Search
      GITHUB_API = 'https://api.github.com/search'
      def initialize(params)
        @params = params
      end

      def repos
        conn = Faraday.new(url: GITHUB_API, headers: { 'Content-Type' => 'application/json' })
        conn.get('repositories', { q: @params })
      rescue Faraday::Error => e
        Rails.logger.error e.to_s
        nil
      end
    end
  end
end
