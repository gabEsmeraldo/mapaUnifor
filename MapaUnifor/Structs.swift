//
//  Structs.swift
//  MapaUnifor
//
//  Created by Turma01-7 on 11/11/25.
//

import Foundation
//Analisar como organizar o banco baseado nas structs, também checar se seria possível usar somente um, ou necessario usar um por struct.
//Checar se realmente a implementação utilizando id é mais facil do que com os objetos
struct Location: Identifiable, Codable {
    var id: Int
    var latitude: Double
    var longitude: Double
    var andar: String?
    var descricao: String?
}

struct Bloco: Identifiable, Hashable, Equatable, Codable {
    var id: Int
    var positionID: Int
    var nome: String
    var location: Location?
    
    static func == (lhs: Bloco, rhs: Bloco?) -> Bool {
        if let rhs {
            return lhs.id == rhs.id
        }
        return false
    }
    
    static func == (lhs: Bloco, rhs: Bloco) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}



struct Banheiro: Hashable, Identifiable {
    var id: Int
    var blocoID: Int
    var locationID: Int
    //    var bloco: Bloco
    //    var location: Location
    var sexo: String
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

enum Categoria: String, Codable, CaseIterable, Identifiable {
    case laboratorio = "laboratorio"
    case centroAcademico = "centroAcademico"
    case secretariaAcademica = "secretariaAcademica"
    case diretoriaAcademica = "diretoriaAcadêmica"
    case equipamentoEsportivo = "equipamentoEsportivo"
    case auditorio = "auditorio"
    case pontoCarrinho = "pontoCarrinho"
    case lanchonete = "lanchonete"
    case vendinha = "vendinha"
    case pontoInstitucional = "pontoInstitucional"
    case unknown = "unknown"   // fallback

    var id: String { rawValue }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)

            self = Categoria(rawValue: value) ?? .unknown
    }

    var displayName: String {
        switch self {
        case .laboratorio: return "Laboratório"
        case .centroAcademico: return "Centro Acadêmico"
        case .secretariaAcademica: return "Secretaria Acadêmica"
        case .diretoriaAcademica: return "Diretoria Acadêmica"
        case .equipamentoEsportivo: return "Equipamento Esportivo"
        case .auditorio: return "Auditório"
        case .pontoCarrinho: return "Ponto de Carrinho"
        case .lanchonete: return "Lanchonete"
        case .vendinha: return "Vendinha"
        case .pontoInstitucional: return "Ponto Institucional"
        case .unknown: return "Outro"
        }
    }
}

struct LocalizacaoDeInteresse: Identifiable, Hashable, Codable{
    var id: Int
    var blocoID: Int
    var locationID: Int
    var nome: String
    var categoria: Categoria
    var location: Location?
    var imageId: Int = 0
    
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
