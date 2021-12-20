class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        items = Freebie.all.filter {|t|
            t.item_name == item_name
        }
        puts items
        freebie = items.find {|t| t.dev_id == self.id} 
        freebie ? true : false
    end

    def give_away(dev , freebie)
        found = self.freebies.find {|t| t.id == freebie.id} 
        binding.pry
        found ? freebie.dev_id = dev.id : nil
        freebie.save
    end
end
