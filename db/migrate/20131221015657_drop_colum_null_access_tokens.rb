class DropColumNullAccessTokens < ActiveRecord::Migration
  def change
    sql = "alter table oauth_access_tokens alter application_id drop not null"

    execute sql
  end
end
