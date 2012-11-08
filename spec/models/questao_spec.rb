# == Schema Information
#
# Table name: questoes
#
#  id          :integer          not null, primary key
#  materia_id  :integer
#  concurso_id :integer
#  assunto_id  :integer
#  texto       :text
#  gabarito    :string(255)
#  tipo        :string(255)      default("M")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Questao do
  pending "add some examples to (or delete) #{__FILE__}"
end
