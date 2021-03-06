class ProposalsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :index]
    # before_action :authenticate_realtor!, execept: [:new]
  
    def index
        @proposals = Proposal.all()
    end

    def new
        @proposal = Proposal.new
        @property = Property.new
    end

    def create
        @proposal = Proposal.new(proposal_params)
        @proposal.property = Property.find(params[:property_id])
        if @proposal.save
          flash[:notice] = 'Proposta cadastrada com sucesso'
          redirect_to property_proposals_path(@proposal)
        else
          render 'new'
        end
    end
    
    def show
      
    end

    private

    def proposal_params
        params.require(:proposal).permit(:start_date, :end_date, 
                                            :total_amount, :total_guests, 
                                            :guest_name, :email, 
                                            :phone, :rent_purpose, 
                                            :pet, :smoker, :details)
    end
end
