//
//  DetalhesSheetView.swift
//  MapaUnifor
//
//  Created by Turma01-7 on 12/11/25.
//

import SwiftUI

struct DetalhesSheetView: View {
    let local: LocalizacaoDeInteresse
     
    var body: some View {
        ZStack {
            Color(.azul)
                .ignoresSafeArea()
            VStack (alignment: .center){
                AsyncImage(url: URL(string: "https://example.com/your_image.jpg"))
                    .frame(width: 300, height: 400)
                Text(local.nome)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                if local.location?.andar == 0 {
                    Text("Bloco M - Térreo")
                        .font(.headline)
                    
                } else {
                    Text("Bloco M - " + String(local.location?.andar ?? 0) + "º andar")
                        .font(.headline)
                }
                Text(local.categoria.string)
                    .font(.subheadline)
                Text(local.location?.descricao ?? "")
                    .frame(width: 300)
                    .padding(.top)
                
            }
            .padding()
            .background(.branco)
            .cornerRadius(8)
        }
    }
}

#Preview {
    DetalhesSheetView(local: LocalizacaoDeInteresse(id: 0, blocoID: 0, locationID: 0, nome: "Laboratório Vortex", categoria: Categoria.laboratorio, location: Location(id: 0, latitude: 0, longitude: 0, andar: 0, descricao: "O Vortex desenvolve projetos de inovação tecnologica e capacita alunos para atuarem nessa área.")))
}
