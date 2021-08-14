class CreateBillets < ActiveRecord::Migration[6.1]
  def change
    create_table :billets do |t|
      t.bigint :remote_id
      t.string :status

      t.timestamps
    end
  end
end
