class HomeController < ApplicationController
    respond_to :html
    include Core::ControllerHelpers::Search
    include Core::Common

    def index
        @searcher = build_searcher(params)
        @campaigns = @searcher.retrieve_campaigns
        carousel_size = Settings.carousel_size rescue 3
        @featured_campaigns = @campaigns[0...carousel_size]
        #@taxonomies = Taxonomy.includes(root: :children)
    end
end
