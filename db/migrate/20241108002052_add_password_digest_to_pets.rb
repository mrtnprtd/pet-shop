class AddPasswordDigestToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :password_digest, :string
  end
end
