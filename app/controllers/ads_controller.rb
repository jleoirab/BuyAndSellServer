class AdsController < ApplicationController
    # ===================================================
    # Parameters for Ads include the following
    # - :nation_id
    # - :state_id
    # - :town_id
    # - :id
    # - :creator_name 
    # - :creator_email
    # - :creator_phone
    # - :description
    # - :price
    # - :town_id
    # ===============================================


    # GET
    def index
        @nation = Nation.find(nation_id)
        @state  = @nation.states.find(state_id)
        @town   = @state.towns.find(town_id)

        @ads    = @town.ads.all
    end

    # GET
    def show
        @nation = Nation.find(nation_id)
        @state  = @nation.states.find(state_id)
        @town   = @state.towns.find(town_id)

        @ad     = @town.ads.find(ad_id)
    end

    # PATCH
    def update
        @nation = Nation.find(nation_id)
        @state  = @nation.states.find(state_id)
        @town   = @state.towns.find(town_id)

        @ad     = @town.ads.find(ad_id)

        @ad.update(ad_params)
    end

    # POST
    def create

        if chech_if_param
            nation_name = params[:nation]
            state_name = params[:state]
            town_name = params[:town]

            nation = Nation.find_by_name(nation_name)
            state = nation.states.find_by_name(state_name)
            town = state.towns.find_by_name(town_name)
            @ad = town.ads.create(ad_params)
        end
        render plain: params[:ad].inspect       
    end

    # DELETE
    def destroy
        @nation = Nation.find(nation_id)
        @state  = @nation.states.find(state_id)
        @town   = @state.towns.find(town_id)

        @ad     = @town.ads.find(ad_id)

        @ad.destroy
    end

    private    
        def nation_id
            params[:nation_id]
        end

        def state_id
            params[:state_id]
        end

        def town_id
            params[:town_id]
        end

        def ad_id
            params[:id]
        end

        def keys_for_ads
            Ad.column_names
        end

        def ad_params
            params.require(:ad).permit(:name,
                          :creator_name, 
                          :creator_email,
                          :creator_phone,
                          :description,
                          :address,
                          :price)
        end

        def chech_if_param
            return (params[:nation] && params[:nation] != "" &&
            params[:state] && params[:state] != "" && params[:town] &&
            params[:town] != "")
        end
end
