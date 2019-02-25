class WelcomeController < ApplicationController
    def index 
        @microposts = Micropost.all.limit(3)
        @news_items = NewsItem.all.limit(3)
    end

    def handbook
    end
end
