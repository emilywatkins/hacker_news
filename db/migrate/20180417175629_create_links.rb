class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.column :headline, :string
      t.column :points, :integer
      t.column :source, :string

      t.timestamps
    end
  end
end
