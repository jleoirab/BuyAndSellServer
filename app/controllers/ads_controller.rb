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
    # - :ads_per_page
    # - :current_page
    # ===============================================


    # GET
    def index
        errors = {'errors'=> []}
        status = chech_if_param
        @ads_per_page = 10
        @current_page = 2
        if status == true
            nation = Nation.find_by_name(nation_name)
            state  = nation.states.find_by_name(state_name)
            town   = state.towns.find_by_name(town_name)

            if ads_per_page
                @ads_per_page = ads_per_page
            end

            if current_page
                @current_page = current_page
            end

            ads = town.ads.all
            size = ads.size
            @number_of_pages = (size.to_f/@ads_per_page).ceil

            if @current_page < 0 || @current_page >= @number_of_pages
                @current_page = 0
            end

            start = (@current_page * @ads_per_page)
            
            @ads = ads.slice(start, [@ads_per_page, size - start].min)

        else 
            errors['errors'] = status

            respond_to do |format|
                format.any { render json: errors, status: :not_found }
            end
        end
    end

    # GET
    def show
        errors = {'errors' => []}
        status = check_if_id

        if status == true
            @ad = Ad.find(ad_id)

            if @ad.errors.any?
                errors['errors'] = @ad.errors.full_messages
            end
        else 
            errors['errors'] = status
        end

        if errors['errors'].any?
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

        def ads_per_page
            params[:ads_per_page]
        end

        def current_page
            params[:current_page]
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

        def check_if_id

            if !ad_id || ad_id == ""
                errors = []
                errors << "No Value for Required Parameter ( Ad id)"  
                return errors
            else
                return true
            end
        end
end
