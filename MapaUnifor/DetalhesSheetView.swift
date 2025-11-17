//
//  DetalhesSheetView.swift
//  MapaUnifor
//
//  Created by Turma01-7 on 12/11/25.
//

import SwiftUI
import MapKit

struct DetalhesSheetView: View {
    let local: LocalizacaoDeInteresse
//    let defaultView = DefaultView()
    var routeManager: RouteManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(.azul)
                .ignoresSafeArea()
            ScrollView {
                VStack (alignment: .center){
                    AsyncImage(url: URL(string: "https://example.com/your_image.jpg"))
                        .frame(width: 300, height: 400)
                    Text(local.nome)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                    if local.location?.andar ?? 0 > 0 {
//                        Text("Bloco M - " + String(local.location?.andar ?? 0) + "º andar")
//                            .font(.headline)
//                        
//                    } else {
                    Text("Bloco M - " + (local.location?.andar!)!)
                            .font(.headline)
//                    }
                    Text(local.categoria.displayName)
                        .font(.subheadline)
                    if ((local.location?.descricao) != nil) {
                        ScrollView{
                            Text(local.location?.descricao ?? "")
                            
                        }
                        .frame(width: 300)
                        .frame(maxHeight: 120)
                        .padding(.top)
                    }
                }
                .padding()
                .background(.branco)
                .cornerRadius(8)
                
                Button("Mostrar Rota") {
                    if let lat = local.location?.latitude,
                       let lon = local.location?.longitude {
                        routeManager.setDestination(latitude: lat, longitude: lon)
                        routeManager.getDirections()
                        routeManager.showingRoute = true
                        
                    }
                    dismiss()
                }
                .padding()
                .background(.branco)
                .foregroundStyle(.black)
                .cornerRadius(8)
                .padding()
            }
        }
    }
}



#Preview {
    DetalhesSheetView(local: LocalizacaoDeInteresse(id: 0, blocoID: 0, locationID: 0, nome: "Laboratório Vortex", categoria: Categoria.laboratorio, location: Location(id: 0, latitude: 0, longitude: 0, andar: "terreo", descricao: "O Vortex desenvolve projetos de inovação tecnologica e capacita alunos para atuarem nessa área. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla commodo libero aliquet consequat fringilla. Aliquam nulla purus, pellentesque sit amet volutpat ac, accumsan in purus. Proin id convallis tortor, nec ultrices sem. Quisque sodales leo quis leo blandit egestas. Curabitur id arcu eros. Praesent sed metus orci. Quisque dictum vel nibh eget dapibus. Fusce pulvinar porttitor dignissim. Vivamus eleifend justo et justo malesuada pellentesque. Sed non urna ut orci volutpat facilisis sodales sed massa. Morbi eget ligula vehicula, pretium arcu at, sodales tortor. Nulla id consectetur lectus. Maecenas blandit leo ac convallis facilisis.")), routeManager: RouteManager())
        .environmentObject(MapCoordinator())

}
