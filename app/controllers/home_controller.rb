class HomeController < ApplicationController
  respond_to :html
  include Core::ControllerHelpers::Search
  include Core::Common

  def index
    @searcher = build_searcher(params)
    @campaigns = @searcher.retrieve_campaigns
    #@taxonomies = Taxonomy.includes(root: :children)
  end
end
