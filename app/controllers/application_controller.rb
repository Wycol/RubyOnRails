class ApplicationController < ActionController::Base

    def hello
        render plain: "Que dices
         loco"
    end
end
