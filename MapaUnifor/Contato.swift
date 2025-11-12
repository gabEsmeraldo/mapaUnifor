//
//  Contato.swift
//  MapaUnifor
//
//  Created by Turma01-7 on 11/11/25.
//

import Foundation

struct Contato: Hashable {
    let nome: String
    let tel: String
    let whats: String?
    let email: String?
}

//numbersOnlyString = originalString.filter { $0.isWholeNumber }

let contatos: [Contato] = [
    Contato(nome: "Segurança", tel: "(85) 3477-3134", whats: "(85) 99109-6657", email: nil),
    Contato(nome: "Central de Atendimento", tel: "(85) 3477-3000", whats: "(85) 99246-6625", email: "sucessodoaluno@unifor.br"),
    Contato(nome: "Biblioteca Central", tel: "(85) 3477-3257", whats: nil, email: "bib@unifor.br"),
    Contato(nome: "Central de Carreiras e Egressos", tel: "(85) 3477-3142", whats: "(85) 99249-5956", email: "estagio@unifor.br"),
    Contato(nome: "Núcleo de Atenção Médica Integrada (NAMI)", tel: "(85) 99200-7069", whats: nil, email: "nami@unifor.br"),
    Contato(nome: "Programa de Apoio Psicopedagógico (PAP)", tel: "(85) 3477-3399", whats: "(85) 99250-7530", email: "pap@unifor.br"),
    Contato(nome: "Núcleo de Tecnologias Educacionais (NTE)", tel: "(85) 3477-3479", whats: nil, email: "curso.ead@unifor.br"),
    Contato(nome: "Diretoria de Tecnologia (DTec)", tel: "(85) 3477-3000", whats: nil, email: nil),
    Contato(nome: "Núcleo de Apoio Contábil e Fiscal (NAF)", tel: "(85) 3477-3193", whats: nil, email: "naf@unifor.br"),
    Contato(nome: "Escritório de Prática Jurídica (EPJ)", tel: "(85) 3477-3332", whats: nil, email: nil),
    Contato(nome: "Núcleo de Estratégias Internacionais", tel: "(85) 3477-3834", whats: nil, email: "nei@unifor.br"),
    Contato(nome: "Escritório EducationUSA/UNIFOR", tel: "(85) 3477-3481", whats: nil, email: "educationusa@unifor.br"),
    Contato(nome: "Vice-Reitoria de Pesquisa (VRP)", tel: "(85) 3477-3889", whats: nil, email: "dpdi@unifor.br"),
    Contato(nome: "Vice-Reitoria de Extensão e Comunidade Universitária", tel: "(85) 3477-3311", whats: nil, email: "extensao@unifor.br"),
    Contato(nome: "Diretório Central dos Estudantes (DCE)", tel: "(85) 3185-3477", whats: nil, email: nil),
]


