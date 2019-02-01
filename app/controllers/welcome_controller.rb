class WelcomeController < ApplicationController
    def index 
        @microposts = Micropost.all.limit(3)
    end
end
