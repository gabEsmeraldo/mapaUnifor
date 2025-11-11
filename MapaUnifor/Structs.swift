//
//  Structs.swift
//  MapaUnifor
//
//  Created by Turma01-7 on 11/11/25.
//

import Foundation
 //Analisar como organizar o banco baseado nas structs, também checar se seria possível usar somente um, ou necessario usar um por struct.
//Checar se realmente a implementação utilizando id é mais facil do que com os objetos
struct Location {
    var id: Int
    var latitude: Double
    var longitude: Double
    var andar: Int?
    var descricao: String?
}

struct Bloco {
    var blocoID: Int
    var locationID: Int
//    var location: Location
    var nome: String
}

struct Banheiro {
    var blocoID: Int
    var locationID: Int
//    var bloco: Bloco
//    var location: Location
    var sexo: Character
    var acessivel: Bool
}

enum Categoria {
    case laboratorio
    case centroAcademico
    case secretariaAcademica
    case pontoCarrinho
    case lanchonete
    case vendinha
    case pontoInstitucional
    // TODO adicionar mais
}

struct LocalizacaoDeInteresse {
    var blocoID: Int
    var locationID: Int
//    var bloco: Bloco
//    var location: Location
    var nome: String
    var categoria: Categoria
}


