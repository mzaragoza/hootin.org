class CreateLogs < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :from,           null: false, default: ""
      t.string :to,             null: false, default: ""
      t.boolean :answered,      null: false, default: false
    end
  end
end
