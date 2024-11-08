class Pet < ApplicationRecord

    has_secure_password
    
    validates :bio, length: { maximum: 500 }

end
