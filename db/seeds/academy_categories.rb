p "CATEGORIA DE ACADEMIAS INICIO"

AcademyCategory.find_or_create_by(name: "Technology")
AcademyCategory.find_or_create_by(name: "Finance")
AcademyCategory.find_or_create_by(name: "Languages")

p "CATEGORIA DE ACADEMIAS FINALIZADO"