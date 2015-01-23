require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")


DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

post("/clients") do
  name = params.fetch("name")
  appointment = params.fetch("appointment")
  stylist_id = params.fetch("stylist_id").to_i()
  client = Client.new({:id => nil, :name => name, :stylist_id => stylist_id, :appointment => appointment})
  client.add_client()
  @stylist = Stylist.find(stylist_id)
  erb(:clients)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.add_stylist()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:clients)
end
