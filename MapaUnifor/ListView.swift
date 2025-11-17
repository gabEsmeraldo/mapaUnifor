//
//  ListView.swift
//  MapaUnifor
//
//  Created by Turma01-7 on 11/11/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var coordinator: MapCoordinator
    @State var showingBloco: Bloco? = nil
     
    var blocos = [
        Bloco(id: 1, positionID: 1, nome: "K", location: Location(
            id: 1, latitude: -3.7698, longitude: -38.4788
        )),
        Bloco(id: 2, positionID: 2, nome: "J", location: Location(
            id: 2, latitude: -3.7705, longitude: -38.4792
        )),
        Bloco(id: 3, positionID: 3, nome: "H", location: Location(
            id: 3, latitude: -3.7710, longitude: -38.4782
        )),
    ]
    
    var localidadesDeInteresse = [
        LocalizacaoDeInteresse(id: 1,
                               blocoID: 1, locationID: 4, nome: "Lab. de Informática", categoria: .laboratorio,
                               location: Location(id: 4, latitude: -3.7697, longitude: -38.4789)
                              ),
        LocalizacaoDeInteresse(id: 2,
                               blocoID: 2, locationID: 5, nome: "Cantina Bloco J", categoria: .lanchonete,
                               location: Location(id: 5, latitude: -3.7707, longitude: -38.4791)
                              ),
        LocalizacaoDeInteresse(id: 3,
                               blocoID: 3, locationID: 6, nome: "Secretaria Acadêmica", categoria: .secretariaAcademica,
                               location: Location(id: 6, latitude: -3.7709, longitude: -38.4781)
                              ),
    ]
    
    var banheiros = [
        Banheiro(id: 1, blocoID: 1, locationID: 7, sexo: "M", acessivel: true,
                 location: Location(id: 7, latitude: -3.76975, longitude: -38.47885)),
        Banheiro(id: 2, blocoID: 1, locationID: 8, sexo: "F", acessivel: true,
                 location: Location(id: 8, latitude: -3.76978, longitude: -38.47882))
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
                                    .onTapGesture {
                                        withAnimation {
                                            if bloco == showingBloco{
                                                showingBloco = nil
                                            } else {
                                                showingBloco = bloco
                                            }
                                        }
                                    }
                                if (showingBloco == bloco){
                                    ForEach(localidadesDeInteresse){ local in
                                        if(bloco.id == local.blocoID){
                                            //Add Navigation link
                                            HStack {
                                                //                                            NavigationLink(destination: DefaultView(preselectedLocation: local)) {
                                                //                                                Image(systemName: "house")
                                                //                                            }
                                                Text("\(local.nome)")
                                                    .font(.title3)
                                                    .fontWeight(.medium)
                                                    .padding([.vertical], 5)
                                                    .padding([.trailing], -20)
                                                Spacer()
                                                Image(systemName: "questionmark.circle.fill")
                                                    .onTapGesture{
                                                        coordinator.selectedLocalizacao = local
                                                                                                        coordinator.selectedTab = 0

                                                    }
                                            }
                                            
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
        .environmentObject(MapCoordinator())

}
