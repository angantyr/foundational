
# drops data for a give model and resets the counter
def reset_model_table(model)
  model.delete_all

  cmd = case ActiveRecord::Base.connection.adapter_name
  when "SQLite"
          "UPDATE SQLITE_SEQUENCE SET SEQ= '0' WHERE NAME='#{model.table_name}';"
  when "Mysql2"
          "ALTER TABLE #{model.table_name} AUTO_INCREMENT = 1"
  when "PostgreSQL"
          "TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE;"
  end

  raise UnsupportedDatabaseError unless cmd
  ActiveRecord::Base.connection.execute(cmd)
end

def reset_model_table_sequence_id(model)
  cmd = case ActiveRecord::Base.connection.adapter_name
  # only needed on PostgreSQL
  when "PostgreSQL"
          "SELECT setval('#{model.table_name}_id_seq', (SELECT MAX(id) from \"#{model.table_name}\"));"
  end

  raise UnsupportedDatabaseError unless cmd
  ActiveRecord::Base.connection.execute(cmd)
end


def truncate_action_text_tables
  puts "truncating action text tables"

  case ActiveRecord::Base.connection.adapter_name
  when "SQLite"
    # SQLite doesn't support TRUNCATE, use DELETE and reset sequence
    ActiveRecord::Base.connection.execute("DELETE FROM action_text_rich_texts")
    ActiveRecord::Base.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='action_text_rich_texts'")
  when "Mysql2"
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE action_text_rich_texts")
  when "PostgreSQL"
    ActiveRecord::Base.connection.execute("TRUNCATE action_text_rich_texts RESTART IDENTITY CASCADE")
  else
    raise UnsupportedDatabaseError
  end
end
