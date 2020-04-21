class AddDetailsToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :city_id, :integer
    add_column :locations, :district, :string
    add_column :locations, :district_id, :integer
    add_column :locations, :sub_district, :string
    add_column :locations, :sub_district_id, :integer
  end
end
