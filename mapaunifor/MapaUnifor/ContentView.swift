//
//  ContentView.swift
//  MapaUnifor
//
//  Created by Turma01-8 on 10/11/25.
//

import SwiftUI


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

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
