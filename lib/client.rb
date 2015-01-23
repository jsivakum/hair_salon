class Client
  attr_reader :appointment, :name, :stylist_id, :id

  define_method(:initialize) do |attributes|
    @appointment = attributes.fetch(:appointment)
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch("name")
      appointment = client.fetch("appointment")
      stylist_id = client.fetch("stylist_id").to_i
      id = client.fetch("id").to_i
      clients.push(Client.new({:id => id, :name => name, :stylist_id => stylist_id, :appointment => appointment}))
    end
    clients
  end

  define_method(:add_client) do
    result = DB.exec("INSERT INTO clients (name, stylist_id, appointment) VALUES ('#{@name}', #{@stylist_id}, '#{@appointment}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  define_method(:==) do |another_client|
    self.name == another_client.name && self.id == another_client.id && self.stylist_id == another_client.stylist_id
  end
end
