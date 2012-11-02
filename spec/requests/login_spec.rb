require 'spec_helper'

describe 'teste tela de login' do

	subject {page}
	before do
		visit new_user_session_path
	end

	it { should_not have_selector('li', :text => 'Materias')}

end