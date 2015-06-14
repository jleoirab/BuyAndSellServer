json.ads @ads, partial: 'ad', as: :ad

json.items_in_page @ads.size

json.number_of_pages @number_of_pages

json.current_page @current_page

json.ads_per_page @ads_per_page
