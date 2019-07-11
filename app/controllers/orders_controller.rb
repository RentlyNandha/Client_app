class OrdersController < ApplicationController
    include HTTParty
     
    def index
        if session[:access_token]!=nil
     response=HTTParty.get("http://localhost:3000/api/orders?access_token=#{session[:access_token]}")
     #byebug
     ord= JSON.parse(response.body)
    @orders=ord["data"];
        else 
            render plain: '{unauthorized access}'
        end
    end
end
