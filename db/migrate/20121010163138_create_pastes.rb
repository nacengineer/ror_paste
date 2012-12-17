class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes do |t|
      t.datetime :expire
      t.string   :title, :limit => 100
      t.text     :paste

      t.timestamps
    end
  end
end
