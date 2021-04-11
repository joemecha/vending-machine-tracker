class MachineSnack < ApplicationRecord
  validates_uniqueness_of :machine_id, scope: :snack_id

  belongs_to :machine
  belongs_to :snack
end
