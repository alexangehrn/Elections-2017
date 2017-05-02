class Admin::CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]

  # GET /candidates
  # GET /candidates.json
  def index
    is_admin_logged
    is_admin_super_admin
    @candidates = Candidate.all
  end

  # GET /candidates
  # GET /candidates.json
  def vote
    if tour.date_debut < date && date < tour.date_fin
        cookies[:tour] = tour.id
         if tour.id == 2
          @vote_status = @user.tour2
          @votes = Vote.where(id_tour: 1).group(:id_candidate).count.sort_by(&:last).reverse.first(2)
          @candidate1 = @votes[0][0]
          @candidate2 = @votes[1][0]
          @candidates = Candidate.where('id= ? OR id= ?', @candidate1, @candidate2 )

        else
          @vote_status = @user.tour1
          @candidates = Candidate.all
        end
    end

  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    is_admin_logged
    is_admin_super_admin
    @candidate = Candidate.find(params[:id])
  end

  # GET /candidates/new
  def new
    is_admin_logged
    is_admin_super_admin
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
    is_admin_logged
    is_admin_super_admin
    @candidate = Candidate.find(params[:id])
  end

  # POST /candidates
  # POST /candidates.json
  def create
    is_admin_logged
    is_admin_super_admin
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to admin_candidates_path, notice: 'Le candidat a été correctement créé' }
        format.json { render :show, status: :created, location: admin_candidates_path }
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    is_admin_logged
    is_admin_super_admin
    respond_to do |format|
      @candidate = Candidate.find(params[:id])

      if @candidate.update(candidate_params)
        format.html { redirect_to admin_candidates_path, notice: 'Le candidat a été correctement modifié' }
        format.json { render :show, status: :ok, location: admin_candidates_path }
      else
        format.html { render :edit }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE candidates/1
  # DELETE candidates/1.json
  def destroy
    is_admin_logged
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to admin_candidates_url, notice: 'Le candidat a été correctement supprimé' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def candidate_params
    params.require(:candidate).permit(:nom, :prenom, :affiliation, :photo, :descriptif)
  end
end
