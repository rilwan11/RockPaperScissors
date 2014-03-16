require 'rubygems'
require 'sinatra'
require 'thin'

set :server, "thin"

get "/" do
	erb :index
end

post '/throw' do 
	@sign = params[:sign].to_s

	@computer = "rsp"[rand(3)].chr
	r = nil

	case [@sign, @computer]

	when ['r','s'], ['s','p'], ['p','r']
		r = 1
	when ['r','r'], ['s','s'],['p','p']
		r = 0
	else
		r = -1
	end

	if @computer == 'r'
		@computer = "Rock"
	elsif @computer == 'p'
		@computer = "Paper"
	else @computer == 's'
		@computer = "Scissors"
	end

	if @sign == 'r'
		@sign = "Rock"
	elsif @sign == 'p'
		@sign = "Paper"
	else @sign == 's'
		@sign = "Scissors"
	end	

	case r
    	when 1 then r = "You Won!"
    	when 0 then r = "Tie!!"
    	else r ="You Lost!"
	end

	erb :result, :locals => {:your_choice => @sign, :computer => @computer, :result => r}
end