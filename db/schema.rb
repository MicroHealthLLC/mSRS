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

ActiveRecord::Schema.define(version: 2019_07_31_105320) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "address_type_id"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.string "state"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "extend_demography_id"
    t.integer "country_id"
    t.integer "state_id"
    t.string "second_address"
    t.float "location_lat"
    t.float "location_long"
  end

  create_table "attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "type"
    t.string "file"
    t.string "description"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "updated_by_id"
    t.integer "created_by_id"
    t.index ["user_id"], name: "index_attachments_on_user_id"
  end

  create_table "core_demographics", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.integer "gender_id"
    t.date "birth_date"
    t.integer "religion_id"
    t.string "title"
    t.text "note"
    t.integer "ethnicity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "citizenship_type_id"
    t.integer "marital_status_id"
    t.integer "updated_by_id"
    t.integer "created_by_id"
    t.float "height"
    t.float "weight"
    t.string "ethnicity"
    t.string "religion"
    t.string "gender"
    t.integer "civility_title_id"
    t.integer "organization_id"
  end

  create_table "dashboards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "report_id"
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "plan_id"
    t.boolean "is_locked"
    t.text "strategic_description"
    t.text "customer_description"
    t.text "internal_description"
    t.text "learning_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_notifications", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "email_type"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_type"], name: "index_email_notifications_on_email_type"
    t.index ["name"], name: "index_email_notifications_on_name"
  end

  create_table "email_templates", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "header"
    t.text "body"
    t.text "footer"
    t.string "model"
    t.text "stylesheet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email_address"
    t.integer "email_type_id"
    t.integer "extend_demography_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enabled_modules", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enumerations", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 100, default: "", null: false
    t.integer "position"
    t.boolean "is_default", default: false, null: false
    t.string "type"
    t.boolean "active", default: true, null: false
    t.string "position_name", limit: 100
    t.boolean "is_flagged", default: false
    t.boolean "is_closed", default: false
  end

  create_table "extend_demographies", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.integer "updated_by_id"
    t.integer "created_by_id"
    t.index ["user_id"], name: "index_extend_demographies_on_user_id"
  end

  create_table "faxes", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "fax_number"
    t.integer "fax_type_id"
    t.integer "extend_demography_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifications", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "identification_number"
    t.boolean "status"
    t.date "date_expired"
    t.string "date_issued"
    t.text "note"
    t.integer "identification_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "extend_demography_id"
    t.integer "issued_by_type_id"
    t.integer "identification_status_id"
  end

  create_table "news", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.text "description"
    t.integer "user_id"
    t.integer "notes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "updated_by_id"
    t.integer "created_by_id"
  end

  create_table "note_templates", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "updated_by_id"
    t.integer "created_by_id"
    t.integer "organization_id"
    t.index ["organization_id"], name: "index_note_templates_on_organization_id"
  end

  create_table "notes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "type"
    t.integer "owner_id"
    t.text "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_private", default: false
    t.integer "private_author_id"
    t.integer "updated_by_id"
    t.integer "created_by_id"
    t.index ["owner_id"], name: "index_notes_on_owner_id"
    t.index ["type"], name: "index_notes_on_type"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "old_passwords", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "encrypted_password", null: false
    t.string "password_archivable_type", null: false
    t.string "password_salt"
    t.integer "password_archivable_id", null: false
    t.datetime "created_at"
    t.index ["password_archivable_type", "password_archivable_id"], name: "index_password_archivable"
  end

  create_table "organizations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "plan_id"
    t.boolean "is_locked"
    t.text "strategic_description"
    t.text "customer_description"
    t.text "internal_description"
    t.text "learning_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "phone_number"
    t.integer "phone_type_id"
    t.integer "extend_demography_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "date"
    t.boolean "is_locked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "principals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "enumeration_type"
    t.integer "enumeration_id"
    t.integer "object_id"
    t.string "object_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.boolean "state"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_type_id"
    t.text "permissions"
    t.string "name"
    t.integer "updated_by_id"
    t.integer "created_by_id"
  end

  create_table "save_pivot_tables", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "report_id"
    t.integer "user_id"
    t.text "content"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_save_pivot_tables_on_report_id"
    t.index ["user_id"], name: "index_save_pivot_tables_on_user_id"
  end

  create_table "settings", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "home_page_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "setting_type"
    t.text "value"
  end

  create_table "social_media", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "social_media_type_id"
    t.text "note"
    t.string "social_media_handle"
    t.integer "extend_demography_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "login", default: "", null: false
    t.text "note"
    t.boolean "state", default: false
    t.boolean "admin", default: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.datetime "deleted_at"
    t.string "provider"
    t.string "uid"
    t.string "database_authenticatable"
    t.string "ldap_authenticatable", default: "", null: false
    t.datetime "last_seen_at"
    t.integer "role_id"
    t.boolean "anonyme_user", default: false
    t.datetime "password_changed_at"
    t.datetime "last_activity_at"
    t.datetime "expired_at"
    t.string "unique_session_id", limit: 20
    t.integer "last_project_used_id"
    t.string "authy_id"
    t.datetime "last_sign_in_with_authy"
    t.boolean "authy_enabled", default: false
    t.string "time_zone"
    t.string "uuid"
    t.index ["authy_id"], name: "index_users_on_authy_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["expired_at"], name: "index_users_on_expired_at"
    t.index ["last_activity_at"], name: "index_users_on_last_activity_at"
    t.index ["password_changed_at"], name: "index_users_on_password_changed_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
