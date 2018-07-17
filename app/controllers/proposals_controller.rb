class ProposalsController < ApplicationController
    before_action :authenticate_user!, only: [:new]
    # before_action :authenticate_realtor!, execept: [:new]

    def index
        @proposals = Proposal.all()
    end

end
