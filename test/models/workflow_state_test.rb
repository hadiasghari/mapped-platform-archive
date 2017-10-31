# == Schema Information
#
# Table name: workflow_states
#
#  id                       :integer          not null, primary key
#  name                     :string
#  workflow_type_version_id :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class WorkflowStateTest < ActiveSupport::TestCase
  test "User should NOT be able to add/remove/change an state if workflow is active" do
    state = workflow_states(:ar_created)
    state.name = 'Initial state'
    assert_not state.save
    assert_equal 1, state.errors.count, "There should be one validation error: #{state.errors}"
    assert_equal 1, state.errors.messages[:workflow_type_version].count, "There should be one error about workflow_type_version in code: #{state.errors.messages[:workflow_type_version]}"
    assert_equal I18n.t('validations.workflow_type_is_active'), state.errors.messages[:workflow_type_version].first
  end

  test 'User shoud BE able to change an state if workflow is NOT active' do
    state = workflow_states(:ar_created_old)
    state.name = 'Initial state'
    assert state.save
  end
end
