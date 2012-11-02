FactoryGirl.define do
  
  factory :user do
    email    "michael@example.com"
    password "foobar123"
    password_confirmation "foobar123"
  end
  
  factory :role do
    name     "admin"
  end

  factory :assunto do
  	nome	"Crase"
  end

  factory :materia do
    nome "portugues"
  end
  factory :materia2, class: Materia do
    nome "programacao"
  end
  factory :materia3, class: Materia do
    nome "matematica"
  end

end