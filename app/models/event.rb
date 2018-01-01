# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  workflow_state_id :integer
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Event < ApplicationRecord
  belongs_to :workflow_state

  validates_presence_of :title
end
