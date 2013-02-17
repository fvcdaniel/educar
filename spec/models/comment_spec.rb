# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  texto      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ancestry   :string(255)
#  questao_id :integer
#  user_id    :integer
#

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
