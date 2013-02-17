# == Schema Information
#
# Table name: concursos
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  ano        :integer
#  cargo      :string(255)
#  edital     :string(255)
#  gabarito   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  banca_id   :integer
#  prova      :string(255)
#

require 'spec_helper'

describe Concurso do
  pending "add some examples to (or delete) #{__FILE__}"
end
