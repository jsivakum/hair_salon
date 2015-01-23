class Stylist
  attr_reader :id, :name

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM STYLISTS;")
    stylists = []
    returned_stylists.each do |stylist|
      id = stylist.fetch("id").to_i
      name = stylist.fetch("name")
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all.each do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:add_stylist) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()} ORDER BY appointment;")
    clients.each do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i
      appointment = client.fetch("appointment")
      id = client.fetch("id").to_i
      stylist_clients.push(Client.new(:id => id, :name => name, :stylist_id => stylist_id, :appointment => appointment))
    end
    stylist_clients
  end

  define_method(:==) do |another_stylist|
    self.name == another_stylist.name && self.id == another_stylist.id
  end
end
