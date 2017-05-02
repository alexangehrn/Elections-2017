class Admin::VotesController < ApplicationController

  # GET /votes
  # GET /votes.json
  def index
    is_admin_logged
    @votest1 = Vote.where(id_tour: 1)
    @resultst1 = Vote.where(id_tour: 1).group(:id_candidate).count.sort_by(&:last).reverse
    @votest2 = Vote.where(id_tour: 2)
    @resultst2 = Vote.where(id_tour: 2).group(:id_candidate).count.sort_by(&:last).reverse.first(2)
    @candidates = Candidate.all
    @votes = Vote.all
  end

 
  def filter
  	@candidates = Candidate.all
  	@votes = Vote.where(code_postal: params[:search]).where(id_tour: params[:tour])
  	@count = @votes.count
    @resultst1 = Vote.where(id_tour: 1).where(code_postal: params[:search]).group(:id_candidate).count.sort_by(&:last).reverse
	@votes = Vote.where(id_tour: params[:tour]).where(code_postal: params[:search])
	@resultst2 = Vote.where(id_tour: 2).where(code_postal: params[:search]).group(:id_candidate).count.sort_by(&:last).reverse.first(2)
  end

end
