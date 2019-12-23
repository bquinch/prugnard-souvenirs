class CreateSouvenirs < ActiveRecord::Migration[5.2]
  def change
    create_table :souvenirs do |t|
      t.text :description
      t.string :title
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
