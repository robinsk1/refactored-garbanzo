# frozen_string_literal: true

#
# search github repos
#
class SearchController < ApplicationController
  def index
    results = Github::Api::Search.new(params[:q]).repos if params[:q].present?
    @search_results = JSON.parse(results.body, object_class: OpenStruct) if results
  rescue Faraday::Error
    flash.now.alert = 'service unavailable'
  end
end
