class Pet < ApplicationRecord
    
    validates :bio, length: { maximum: 500 }

end
