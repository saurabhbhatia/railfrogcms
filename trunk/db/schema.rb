# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 3) do

  create_table "chunk_versions", :force => true do |t|
    t.column "chunk_id", :integer
    t.column "version", :integer
    t.column "base_version", :integer
    t.column "content", :binary
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "chunks", :force => true do |t|
    t.column "description", :string
    t.column "mime_type", :string, :limit => 50
    t.column "live_version", :integer
  end

  create_table "layouts", :force => true do |t|
    t.column "name", :string
  end

  create_table "site_mappings", :force => true do |t|
    t.column "path_segment", :string, :default => "", :null => false
    t.column "chunk_id", :integer
    t.column "version", :integer
    t.column "layout_id", :integer
    t.column "updated_at", :datetime
    t.column "root_id", :integer
    t.column "parent_id", :integer
    t.column "depth", :integer
    t.column "lft", :integer
    t.column "rgt", :integer
  end

  add_index "site_mappings", ["path_segment"], :name => "site_mappings_path_segment_index"
  add_index "site_mappings", ["lft"], :name => "site_mappings_lft_index"
  add_index "site_mappings", ["rgt"], :name => "site_mappings_rgt_index"
  add_index "site_mappings", ["depth"], :name => "site_mappings_depth_index"

  create_table "users", :force => true do |t|
    t.column "first_name", :string, :default => "", :null => false
    t.column "last_name", :string, :default => "", :null => false
    t.column "email", :string, :default => "", :null => false
    t.column "password", :string, :limit => 40, :default => "", :null => false
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
  end

end
