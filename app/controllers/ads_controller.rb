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
        nation = Nation.find_by_name(nation_name)
        state  = nation.states.find_by_name(state_name)
        town   = state.towns.find_by_name(town_name)

        @ads    = town.ads.all
    end

    # GET
    def show
        errors = {'errors' => []}
        @ad = Ad.find(ad_id)

        if @ad.errors.any?
            errors['errors'] = @ad.errors.full_messages

            respond_to do |format|
                format.any { render json: errors, status: :not_found }
            end
        end
    end

    # PATCH
    def update
        # @nation = Nation.find(nation_id)
        # @state  = @nation.states.find(state_id)
        # @town   = @state.towns.find(town_id)

        # @ad     = @town.ads.find(ad_id)

        # @ad.update(ad_params)
    end

    # POST
    def create
        @ad = Ad.new
        errors = {'errors'=> []}
        status = chech_if_param
        if status == true
            nation = Nation.find_by_name(nation_name)
            state = nation.states.find_by_name(state_name)
            town = state.towns.find_by_name(town_name)
            @ad = town.ads.create(ad_params)
            if @ad.errors.any?
                errors['errors'] = @ad.errors.full_messages
            end
        else
            errors['errors'] = status
        end

        if errors['errors'].any?
            respond_to do |format|
                format.any { render json: errors, status: :unprocessable_entity }
            end
        end 
    end

    # DELETE
    def destroy
        # @nation = Nation.find(nation_id)
        # @state  = @nation.states.find(state_id)
        # @town   = @state.towns.find(town_id)

        # @ad     = @town.ads.find(ad_id)

        # @ad.destroy
    end

    private    
        def nation_name
            params[:nation]
        end

        def state_name
            params[:state]
        end

        def town_name
            params[:town]
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
            retval = true
            errors = []

            if !nation_name || nation_name == ""
                retval = false
                errors << "No Value for Required Parameter (Nation)"
            end

            if !state_name || state_name == ""
                retval = false
                errors << "No Value for Required Parameter (State)"
            end

            if !town_name || town_name == ""
                retval = false
                errors << "No Value for Required Parameter (Town)"
            end
            
            return retval ? retval : errors
        end
end
