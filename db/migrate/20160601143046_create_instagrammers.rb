class CreateInstagrammers < ActiveRecord::Migration[5.0]
  def change
    create_table :instagrammers do |t|

      t.string :instagram
      t.string :surname
      t.string :family_name
      t.string :sex
      t.string :age
      t.string :email
      t.string :favorite_brands
      t.string :desired_products
      t.string :other_support
      t.string :newsletter
      t.string :hobbies
      t.string :town
      t.string :job
      t.string :sponsor
      t.string :address
      t.string :introduction
      t.string :favorite_instagrammer
      	
      t.timestamps
    end
  end
end
