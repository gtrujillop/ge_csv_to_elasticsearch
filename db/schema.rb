# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170224135849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "csv_processors", force: :cascade do |t|
    t.integer  "status",            default: 0
    t.text     "error_trace"
    t.integer  "processed",         default: 0
    t.integer  "non_processed",     default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "csv_records_ges", force: :cascade do |t|
    t.string   "mipr_number"
    t.string   "mipro_u_number"
    t.string   "mipr_u_submitter"
    t.string   "mipr_u_status"
    t.string   "mipr_u_submitter_email"
    t.string   "mid_value"
    t.integer  "mid_duration"
    t.datetime "mid_start"
    t.datetime "mid_end"
    t.string   "mid_calculation_complete"
    t.string   "mipr_assignment_group"
    t.string   "mipr_assigned_to"
    t.string   "mipr_u_cod_impact"
    t.string   "mipr_u_coq"
    t.datetime "mipr_sys_created_on"
    t.string   "mipr_u_failure_mode"
    t.string   "mipr_u_frame"
    t.string   "mipr_u_gt_aero_type"
    t.string   "mipr_u_impact_on_safety"
    t.string   "mipr_u_ips_number"
    t.string   "mipr_u_isue_orgn"
    t.string   "mipr_u_ipr_name"
    t.string   "mipr_u_origin_of_the_request"
    t.string   "mipr_u_origin_supply"
    t.string   "mipr_u_project_status"
    t.string   "mipr_u_region"
    t.string   "mipr_u_responsability_group_code"
    t.string   "mipr_u_responsibility_description"
    t.string   "mipr_u_serial_number"
    t.date     "mipr_u_site_need_date"
    t.string   "mipr_u_site_station"
    t.string   "mipr_u_sn_turbine"
    t.string   "mipr_u_sn"
    t.string   "mipr_u_frontline_take_ownership_by"
    t.datetime "mipro_u_actu_pic_date"
    t.string   "mipro_u_buyer_name"
    t.datetime "mipro_u_con_del_date"
    t.string   "mipro_u_group"
    t.string   "mipro_u_module_ml_mli_sins"
    t.string   "mipro_u_original_supplier"
    t.string   "mipro_u_part_number"
    t.string   "mipro_u_po"
    t.integer  "mipro_u_poline"
    t.integer  "mipro_u_po_ship"
    t.integer  "mipro_u_required_quantity"
    t.string   "mipro_u_standard_logistic"
    t.string   "mipro_u_dhl_fedex"
    t.decimal  "event_latitude"
    t.decimal  "event_longitude"
    t.string   "event_address"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
