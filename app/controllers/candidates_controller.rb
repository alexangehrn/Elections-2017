class CandidatesController < ApplicationController
  def index
    is_home
    @candidates = Candidate.all
    @tours = Tour.all
    @user = current_user
    @tours.each do |tour|
      date = DateTime.now
      if tour.date_debut < date && date < tour.date_fin
        cookies[:tour] = tour.id
         if tour.id == 2
          @votes = Vote.where(id_tour: 1).group(:id_candidate).count.sort_by(&:last).reverse.first(2)
          @candidate1 = @votes[0][0]
          @candidate2 = @votes[1][0]
          @candidates = Candidate.where('id= ? OR id= ?', @candidate1, @candidate2 )
           if current_user
           @vote_status = @user.tour2
           end
        else
          @candidates = Candidate.all
          if current_user
          @vote_status = @user.tour1

          end
        end
      else
        cookies.delete :tour

      end
    end
  end

  def vote

  	is_logged
    @candidates = Candidate.all
    @tours = Tour.all
    @tours.each do |tour|
      date = DateTime.now
      if tour.date_debut < date && date < tour.date_fin
        cookies[:tour] = tour.id
         if tour.id == 2
          @votes = Vote.where(id_tour: 1).group(:id_candidate).count.sort_by(&:last).reverse.first(2)
          @candidate1 = @votes[0][0]
          @candidate2 = @votes[1][0]
          @candidates = Candidate.where('id= ? OR id= ?', @candidate1, @candidate2 )
        else
          @candidates = Candidate.all
        end
      else
        cookies.delete :tour
      end
    end
  end

  def show
    is_home
    @candidate = Candidate.find(params[:id])
  end

end
