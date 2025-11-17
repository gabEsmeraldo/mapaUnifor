import SwiftUI
import MapKit

func getLocationPin(local: LocalizacaoDeInteresse) -> Image { 
    switch local.categoria {
    case .laboratorio:
        Image(systemName: "testtube.2")
    case .centroAcademico: 
        Image(systemName: "person.3.sequence")
    case .secretariaAcademica:
        Image(systemName: "doc.text.fill")
    case .pontoCarrinho: 
        Image(systemName: "cart.fill")
    case .lanchonete:
        Image(systemName: "fork.knife.circle.fill")
    case .vendinha: 
        Image(systemName: "bag.fill")
    case .pontoInstitucional: 
        Image(systemName: "building.columns.fill")
    case .equipamentoEsportivo: 
        Image(systemName: "volleyball")
    case .auditorio: 
        Image(systemName: "rectangle.inset.filled.and.person.filled")
    default:
        Image(systemName: "mappin")
    }
}

struct DefaultView: View {
    
    @EnvironmentObject var coordinator: MapCoordinator
    @StateObject var routeManager = RouteManager()
    
    var blocos = [ Bloco(id: 1, locationID: 1, nome: "K", location: Location( id: 1, latitude: -3.7698, longitude: -38.4788 )), Bloco(id: 2, locationID: 2, nome: "J", location: Location( id: 2, latitude: -3.7705, longitude: -38.4792 )), Bloco(id: 3, locationID: 3, nome: "H", location: Location( id: 3, latitude: -3.7710, longitude: -38.4782 )), ]
    var localizacoes = [ LocalizacaoDeInteresse(id: 1, blocoID: 1, locationID: 4, nome: "Lab. de Informática", categoria: .laboratorio, location: Location(id: 4, latitude: -3.7697, longitude: -38.4789) ), LocalizacaoDeInteresse(id: 2, blocoID: 2, locationID: 5, nome: "Cantina Bloco J", categoria: .lanchonete, location: Location(id: 5, latitude: -3.7707, longitude: -38.4791) ), LocalizacaoDeInteresse(id: 3, blocoID: 3, locationID: 6, nome: "Secretaria Acadêmica", categoria: .secretariaAcademica, location: Location(id: 6, latitude: -3.7709, longitude: -38.4781) ), ]
    var banheiros = [
        Banheiro(id: 1, blocoID: 1, locationID: 7, sexo: "M", acessivel: true, location: Location(id: 7, latitude: -3.76975, longitude: -38.47885)),
        Banheiro(id: 2, blocoID: 1, locationID: 8, sexo: "F", acessivel: true, location: Location(id: 8, latitude: -3.76978, longitude: -38.47882))]
    
    @State private var selectedBlocoID: Int?
    @State private var selectedBloco: Bloco?
    @State private var selectedLocalizacao: LocalizacaoDeInteresse?
    
    @State private var position: MapCameraPosition
    @State private var didApplyInitialZoom = false
    
    var preselectedLocation: LocalizacaoDeInteresse?
    
    init(preselectedLocation: LocalizacaoDeInteresse? = nil) {
        self.preselectedLocation = preselectedLocation
        
        _position = State(initialValue:
                .region(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: -3.7700, longitude: -38.4788),
                    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                ))
        )
    }
    
    var body: some View {
        ZStack {
            
            Map(position: $position) {
                
                if routeManager.showingRoute, let route = routeManager.route {
                    MapPolyline(route)
                        .stroke(.blue, lineWidth: 5)
                }
                
                // Blocos
                ForEach(blocos) { bloco in
                    Annotation(bloco.nome,
                               coordinate: bloco.location!.coordinate) {
                        Button { selectBloco(bloco) } label: {
                            VStack {
                                Image(systemName: "building.columns")
                                    .foregroundStyle(bloco == selectedBloco ? .red : .blue)
                                Text(bloco.nome)
                                    .font(.caption2)
                            }
                        }
                    }
                }
                
                // Locais do bloco selecionado
                if let bloco = selectedBloco {
                    ForEach(localizacoes.filter { $0.blocoID == bloco.id }) { local in
                        Annotation(local.nome,
                                   coordinate: local.location!.coordinate) {
                            Button { handleLocalizacaoTap(local) } label: {
                                VStack {
                                    getLocationPin(local: local)
                                        .foregroundStyle(.green)
                                    Text(local.nome).font(.caption2)
                                }
                            }
                        }
                    }
                }
                
                if let bloco = selectedBloco {
                    ForEach(banheiros.filter { $0.blocoID == bloco.id }) { banheiro in
                        Annotation("Banheiro \(banheiro.sexo)",
                                   coordinate: banheiro.location!.coordinate) {
                            Button { zoomInto(banheiro.location!) } label: {
                                VStack {
                                    Image(systemName:
                                            banheiro.sexo == "M" ? "figure.dress.line.vertical.figure" :
                                            "figure.line.vertical.figure.dress")
                                    .foregroundStyle(.yellow)
                                    Text("Banheiro \(banheiro.sexo)")
                                        .font(.caption2)
                                }
                            }
                        }
                    }
                }
            }
            .id(selectedBloco?.id)
            .mapStyle(.imagery(elevation: .realistic))
            .ignoresSafeArea()
            
            
            VStack {
                Picker("Bloco", selection: $selectedBlocoID) {
                    ForEach(blocos) { bloco in
                        Text("Bloco \(bloco.nome)").tag(Optional(bloco.id))
                    }
                }
                .pickerStyle(.menu)
                .frame(maxWidth: 200)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(12)
                .padding(.top)
                .onChange(of: selectedBlocoID) { id in
                    if let bloco = blocos.first(where: { $0.id == id }) {
                        selectBloco(bloco)
                    }
                }
                
                Spacer()
            }
        }
        
        .onAppear {
            guard !didApplyInitialZoom else { return }
            didApplyInitialZoom = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                
                if let local = preselectedLocation,
                   let bloco = blocos.first(where: { $0.id == local.blocoID }),
                   let loc = local.location {
                    
                    selectedBloco = bloco
                    selectedBlocoID = bloco.id
                    
                    zoomInto(loc)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        selectedLocalizacao = local
                    }
                    
                } else if let primeiro = blocos.first {
                    selectBloco(primeiro)
                    selectedBlocoID = primeiro.id
                }
            }
        }
        
        .onChange(of: coordinator.selectedLocalizacao) { newValue in
            if let local = newValue {
                handleLocalizacaoTap(local)
            }
        }
        
        .sheet(item: $selectedLocalizacao, onDismiss: {
            coordinator.selectedLocalizacao = nil
        }) { local in
            DetalhesSheetView(local: local, routeManager: routeManager)
        }
    }
}

extension DefaultView {
    
    private func handleLocalizacaoTap(_ local: LocalizacaoDeInteresse) {
        if let loc = local.location {
            zoomInto(loc)
            selectedLocalizacao = local
            routeManager.showingRoute = true
        }
    }
    
    private func selectBloco(_ bloco: Bloco) {
        selectedBloco = bloco
        
        if let loc = bloco.location {
            zoomInto(loc)
        }
    }
    
    private func zoomInto(_ location: Location) {
        withAnimation(.easeInOut(duration: 0.4)) {
            position = .camera(
                MapCamera(
                    centerCoordinate: CLLocationCoordinate2D(latitude: location.latitude,
                                                             longitude: location.longitude),
                    distance: 25,
                    heading: 0,
                    pitch: 0
                )
            )
        }
    }
}

extension Location {
    var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}

#Preview {
    DefaultView()
        .environmentObject(MapCoordinator())
}
