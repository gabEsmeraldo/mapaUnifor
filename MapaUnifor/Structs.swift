//
//  Structs.swift
//  MapaUnifor
//
//  Created by Turma01-7 on 11/11/25.
//

import Foundation

struct Location {
    var latitude: Double
    var longitude: Double
    var andar: Int
    var descricao: String
}

struct Bloco {
    var location: Location
    var nome: String
}

struct Banheiro {
    var bloco: Bloco
    var location: Location
    var sexo: Character
    var acessivel: Bool
}

enum Categoria {
    case laboratorio
    case centroacademico
    case secretariaacademica
    case pontocarrinho
    // TODO adicionar mais
}

struct LocalizacaoDeInteresse {
    var bloco: Bloco
    var location: Location
    var nome: String
    var categoria: Categoria
}
