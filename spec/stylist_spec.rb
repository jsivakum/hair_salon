require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all).to eq []
    end
  end

  describe(".find") do
    it ("returns a stylist by their ID number") do
      test_stylist = Stylist.new({:name => "Harry Styles", :id => nil})
      test_stylist.add_stylist
      test_stylist2 = Stylist.new({:name => "Scruffy Joe", :id => nil})
      test_stylist2.add_stylist
      expect(Stylist.find(test_stylist2.id)).to eq test_stylist2
    end
  end

  describe("#add_stylist") do
    it("lets you add stylists to the database") do
      stylist = Stylist.new({:name => "Scruffy Joe", :id => nil})
      stylist.add_stylist
      expect(Stylist.all).to eq [stylist]
    end
  end


  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Harry Styles", :id => nil})
      test_stylist.add_stylist
      test_client = Client.new({:id => nil, :name => "Mike", :stylist_id => test_stylist.id, :appointment => "2016-01-25 09:00:00"})
      test_client.add_client
      test_client2 = Client.new({:id => nil, :name => "Joe", :stylist_id => test_stylist.id, :appointment => "2016-01-26 09:00:00"})
      test_client2.add_client
      expect(test_stylist.clients).to eq [test_client, test_client2]
    end
  end

  describe("#==") do
    it("are the same stylist if they have the same name") do
      stylist1 = Stylist.new({:name => "Scruffy Joe", :id => nil})
      stylist2 = Stylist.new({:name => "Scruffy Joe", :id => nil})
      expect(stylist1).to eq stylist2
    end
  end
end
