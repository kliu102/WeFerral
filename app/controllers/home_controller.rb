class HomeController < ApplicationController
  respond_to :html

  def index
    @searcher = build_searcher(params)
    @campaigns = @searcher.retrieve_products
    #@taxonomies = Taxonomy.includes(root: :children)
  end
end
