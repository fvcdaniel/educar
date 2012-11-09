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
    association :materia, factory: :materia, nome: "logica"
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

  factory :concurso do
    nome  "concurso"
    ano   "ano"
    cargo "cargo"
  end

  factory :concurso2, class: Concurso do
    nome  "concurso2"
    ano   "ano2"
    cargo "cargo2"
  end

  factory :questao do
    texto "Texto da questao"
    association "materia"
    association "concurso"
    association "assunto" 
  end

  factory :questao2, class: Questao do
    texto "Texto da questao"
    association "materia"
    association "concurso"
    association "assunto" 
    association "user"
  end

end