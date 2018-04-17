class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.column :link_id, :integer
      t.column :body, :string
      
      t.timestamps
    end
  end
end
