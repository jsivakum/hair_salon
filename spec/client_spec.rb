require('spec_helper')

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all).to eq []
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      client1 = Client.new({:id => nil, :name => "Jay", :stylist_id => 1, :appointment => "2016-01-25 18:00:00"})
      client2 = Client.new({:id => nil, :name => "Jay", :stylist_id => 1, :appointment => "2016-01-25 18:00:00"})      
      expect(client1).to(eq(client2))
    end
  end

  describe("#add_client") do
    it("adds a client to the existing list of clients") do
      test_client = Client.new({:id => nil, :name => "Mike", :stylist_id => 2, :appointment => "2016-01-25 09:00:00"})
      test_client.add_client()
      expect(Client.all).to eq [test_client]
    end
  end
end
