require "sinatra"
require "sinatra/reloader"



get("/") do
  erb(:new_square_calc)
end

get("/square/new") do
  erb(:new_square_calc)
end
get("/square/results") do
  erb(:square_results)
end

get("/square_root/new") do
  erb(:squareroot)
end
get("/square_root/results") do
  erb(:sqroot_results)
end

get("/payment/new") do
  erb(:payment)
end
get("/payment/results") do
    r = params.fetch("user_apr").to_f / 100 / 12
    n = params.fetch("user_years").to_i * 12
    pv = params.fetch("user_pv").to_f
    numerator = r * pv
    denominator = 1 - (1 + r) ** -n
    @payment = (numerator / denominator).round(2)
    @interest_rate=(r*12*100).round(4)
   erb(:payment_results) 
end

get("/random/new") do
  erb(:random)
end
get("/random/results") do
  erb(:random_results)
end
