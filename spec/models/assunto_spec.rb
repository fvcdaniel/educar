# == Schema Information
#
# Table name: assuntos
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  materia_id :integer
#  assunto_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Assunto do
  pending "add some examples to (or delete) #{__FILE__}"
end
