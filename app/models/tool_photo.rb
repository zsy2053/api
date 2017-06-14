class ToolPhoto < ApplicationRecord
  belongs_to :tool

  validates :url, presence: true
  validates :tool_id, presence: true
end
