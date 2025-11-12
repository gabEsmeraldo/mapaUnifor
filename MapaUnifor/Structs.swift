//
//  Structs.swift
//  MapaUnifor
//
//  Created by Turma01-7 on 11/11/25.
//

import Foundation
//Analisar como organizar o banco baseado nas structs, também checar se seria possível usar somente um, ou necessario usar um por struct.
//Checar se realmente a implementação utilizando id é mais facil do que com os objetos
struct Location: Identifiable {
    var id: Int
    var latitude: Double
    var longitude: Double
    var andar: Int?
    var descricao: String?
}

struct Bloco: Identifiable, Hashable {
    var id: Int
    var locationID: Int
    var nome: String
    var location: Location?
    
    static func == (lhs: Bloco, rhs: Bloco?) -> Bool {
        if let rhs {
            return lhs.id == rhs.id
        }
        return false
    }
    
    static func == (lhs: Bloco, rhs: Bloco) -> Bool {
        return false
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}



struct Banheiro: Hashable {
    var blocoID: Int
    var locationID: Int
    //    var bloco: Bloco
    //    var location: Location
    var sexo: Character
    var acessivel: Bool
    var location: Location?
    
    
    func inIn (bloco: Bloco) -> Bool {
        return self.blocoID == bloco.id
    }
    
    static func == (lhs: Banheiro, rhs: Banheiro) -> Bool {
        return lhs.blocoID == rhs.blocoID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(blocoID)
    }
}

enum Categoria: CaseIterable, Identifiable {
    case laboratorio
    case centroAcademico
    case secretariaAcademica
    case equipamentoEsportivo
    case auditorio
    case pontoCarrinho
    case lanchonete
    case vendinha
    case pontoInstitucional
    // TODO adicionar mais
    var id: Self { self }
    
    var string: String {
        switch self {
        case .laboratorio: return "Laboratório"
        case .centroAcademico: return "Centro Acadêmico"
        case .secretariaAcademica: return "Secretaria Acadêmica"
        case .equipamentoEsportivo: return "Equipamento Esportivo"
        case .auditorio: return "Auditório"
        case .pontoCarrinho: return "Ponto de Carrinho"
        case .lanchonete: return "Lanchonete"
        case .vendinha: return "Vendinha"
        case .pontoInstitucional: return "Ponto Institucional"
        }
    }
}

struct LocalizacaoDeInteresse: Identifiable, Hashable{
    var id: Int
    var blocoID: Int
    var locationID: Int
    //    var bloco: Bloco
    //    var location: Location
    var nome: String
    var categoria: Categoria
    var location: Location?
    
    func inIn (bloco: Bloco) -> Bool {
        return self.blocoID == bloco.id
    }
    
    static func == (lhs: LocalizacaoDeInteresse, rhs: LocalizacaoDeInteresse) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(blocoID)
    }
}


