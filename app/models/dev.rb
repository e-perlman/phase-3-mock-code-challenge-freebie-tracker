class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.exists?(:item_name=> item_name)
    end
    def give_away(dev,freebie)
        if self.received_one?(freebie.item_name)
            dev.freebies<<freebie
            self.freebies.find(freebie.id).destroy
        else
        end
    end
end
