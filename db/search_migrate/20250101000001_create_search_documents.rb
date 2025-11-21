class CreateSearchDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :search_documents do |t|
      t.string :searchable_type, null: false
      t.integer :searchable_id, null: false
      t.string :title
      t.text :content
      t.string :url

      t.timestamps
    end

    add_index :search_documents, [:searchable_type, :searchable_id], unique: true

    # Create FTS5 virtual table for full-text search
    # This table will be automatically kept in sync via triggers
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE VIRTUAL TABLE search_documents_fts USING fts5(
            title,
            content,
            content='search_documents',
            content_rowid='id',
            tokenize='porter unicode61'
          );
        SQL

        # Create triggers to keep FTS5 index in sync
        execute <<-SQL
          CREATE TRIGGER search_documents_ai AFTER INSERT ON search_documents BEGIN
            INSERT INTO search_documents_fts(rowid, title, content)
            VALUES (new.id, new.title, new.content);
          END;
        SQL

        execute <<-SQL
          CREATE TRIGGER search_documents_ad AFTER DELETE ON search_documents BEGIN
            INSERT INTO search_documents_fts(search_documents_fts, rowid, title, content)
            VALUES('delete', old.id, old.title, old.content);
          END;
        SQL

        execute <<-SQL
          CREATE TRIGGER search_documents_au AFTER UPDATE ON search_documents BEGIN
            INSERT INTO search_documents_fts(search_documents_fts, rowid, title, content)
            VALUES('delete', old.id, old.title, old.content);
            INSERT INTO search_documents_fts(rowid, title, content)
            VALUES (new.id, new.title, new.content);
          END;
        SQL
      end

      dir.down do
        execute "DROP TRIGGER IF EXISTS search_documents_au;"
        execute "DROP TRIGGER IF EXISTS search_documents_ad;"
        execute "DROP TRIGGER IF EXISTS search_documents_ai;"
        execute "DROP TABLE IF EXISTS search_documents_fts;"
      end
    end
  end
end
