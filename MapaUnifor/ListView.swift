//
//  ListView.swift
//  MapaUnifor
//
//  Created by Turma01-7 on 11/11/25.
//

import SwiftUI

struct ListView: View {
    let localidades : [Location] = [
        Location(id: 1, latitude: -3.768089, longitude: -38.479180, descricao: "massa"),
        Location(id: 2, latitude: -3.768089, longitude: -38.479180, descricao: "legal"),
        Location(id: 3, latitude: -3.768089, longitude: -38.479180, descricao: "bacana"),
        Location(id: 4, latitude: -3.768089, longitude: -38.479180, descricao: "testado")
    ]
    let blocos : [Bloco] = [
        Bloco(id: 1, locationID: 1, nome: "Bloco R"),
        Bloco(id: 2, locationID: 2, nome: "Bloco X"),
        Bloco(id: 3, locationID: 4, nome: "Bloco D")
    ]
    let localidadesDeInteresse : [LocalizacaoDeInteresse] = [
        LocalizacaoDeInteresse(id: 1, blocoID: 1, locationID: 3, nome: "Centro academia de Medicina", categoria: Categoria.centroAcademico),
        LocalizacaoDeInteresse(id: 2, blocoID: 2, locationID: 4, nome: "Centro academia de odontologia", categoria: Categoria.centroAcademico),
        LocalizacaoDeInteresse(id: 3, blocoID: 2, locationID: 4, nome: "Centro academia de tecnologia", categoria: Categoria.centroAcademico),
        LocalizacaoDeInteresse(id: 4, blocoID: 3, locationID: 4, nome: "Centro academia de biografias", categoria: Categoria.centroAcademico)
    ]
    var body: some View {
        ZStack {
            Color.red
            .ignoresSafeArea()
            NavigationStack{
                ScrollView(.vertical) {
                    VStack{
                        ForEach(blocos){ bloco in
                            VStack {
                                Text("\(bloco.nome)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding([.bottom], 10)
                                ForEach(localidadesDeInteresse){ local in
                                    if(bloco.id == local.blocoID){
                                        //Add Navigation link
                                        HStack {
                                            Text("\(local.nome)")
                                                .font(.title3)
                                                .fontWeight(.medium)
                                                .padding([.vertical], 5)
                                                .padding([.trailing], -20)
                                            Spacer()
                                            Image(systemName: "questionmark.circle.fill")
                                        }
                                            
                                    }
                                }
                            }
                            .padding([.horizontal])
                            .padding([.vertical], 5)
                            .frame(width: 350)
                            .foregroundStyle(.branco)
                            .background(.azul)
                            .cornerRadius(8)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ListView()
}
