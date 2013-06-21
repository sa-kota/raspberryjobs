class CreateJobdetails < ActiveRecord::Migration
  def change
    create_table :jobdetails do |t|

      t.timestamps
    end
  end
end
