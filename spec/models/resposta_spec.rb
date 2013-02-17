# == Schema Information
#
# Table name: resposta
#
#  id         :integer          not null, primary key
#  questao_id :integer
#  user_id    :integer
#  gabarito   :string(255)
#  resposta   :string(255)
#  tempo      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Resposta do
  pending "add some examples to (or delete) #{__FILE__}"
end
