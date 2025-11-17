import SwiftUI
import MapKit
// MARK: - Icones

func getLocationPin(local: LocalizacaoDeInteresse) -> Image {
    switch local.categoria {
    case .laboratorio:
        return Image(systemName: "testtube.2")
    case .centroAcademico:
        return Image(systemName: "person.3.sequence")
    case .secretariaAcademica:
        return Image(systemName: "doc.text.fill")
    case .pontoCarrinho:
        return Image(systemName: "cablecar.fill")
    case .lanchonete:
        return Image(systemName: "fork.knife.circle.fill")
    case .vendinha:
        return Image(systemName: "bag.fill")
    case .pontoInstitucional:
        return Image(systemName: "building.columns.fill")
    case .equipamentoEsportivo:
        return Image(systemName: "volleyball")
    case .auditorio:
        return Image(systemName: "rectangle.inset.filled.and.person.filled")
    default:
        return Image(systemName: "mappin")
    }
}


// MARK: - VIEW

struct DefaultView: View {
    @StateObject var viewModel = ViewModel()
    @EnvironmentObject var coordinator: MapCoordinator
    @StateObject var routeManager = RouteManager()
    @StateObject var locationManager = LocationManager()
    
    // MARK: Dados fixos
    
    let coordenadasRotaCarrinho = [
        CLLocationCoordinate2D(latitude: -3.76834, longitude: -38.47850),
        CLLocationCoordinate2D(latitude: -3.76872, longitude: -38.47944),
        CLLocationCoordinate2D(latitude: -3.76658, longitude: -38.48036),
        CLLocationCoordinate2D(latitude: -3.76650, longitude: -38.47932),
        CLLocationCoordinate2D(latitude: -3.76905, longitude: -38.47826),
        CLLocationCoordinate2D(latitude: -3.76923, longitude: -38.47836),
        CLLocationCoordinate2D(latitude: -3.76934, longitude: -38.47863),
        CLLocationCoordinate2D(latitude: -3.77036, longitude: -38.47823),
        CLLocationCoordinate2D(latitude: -3.77010, longitude: -38.47588),
        CLLocationCoordinate2D(latitude: -3.76706, longitude: -38.47624),
        CLLocationCoordinate2D(latitude: -3.76695, longitude: -38.47642),
        CLLocationCoordinate2D(latitude: -3.76703, longitude: -38.47766),
        CLLocationCoordinate2D(latitude: -3.76857, longitude: -38.47752),
        CLLocationCoordinate2D(latitude: -3.76860, longitude: -38.47813),
        CLLocationCoordinate2D(latitude: -3.76827, longitude: -38.47836),
        CLLocationCoordinate2D(latitude: -3.76834, longitude: -38.47850)
    ]
    
    var rotaCarrinho: MKPolyline {
        MKPolyline(coordinates: coordenadasRotaCarrinho, count: coordenadasRotaCarrinho.count)
    }
    
    
    let localizacoes = [
        LocalizacaoDeInteresse(id: 1, blocoID: 1, locationID: 4,
                               nome: "Lab. de Informática", categoria: .laboratorio,
                               location: Location(id: 4, latitude: -3.7697, longitude: -38.4789)),
        
        LocalizacaoDeInteresse(id: 2, blocoID: 2, locationID: 5,
                               nome: "Cantina Bloco J", categoria: .lanchonete,
                               location: Location(id: 5, latitude: -3.7707, longitude: -38.4791)),
        
        LocalizacaoDeInteresse(id: 3, blocoID: 3, locationID: 6,
                               nome: "Secretaria Acadêmica", categoria: .secretariaAcademica,
                               location: Location(id: 6, latitude: -3.7709, longitude: -38.4781)),
    ]
    
    let banheiros = [
        Banheiro(id: 1, blocoID: 1, locationID: 7, sexo: "M", acessivel: true,
                 location: Location(id: 7, latitude: -3.76975, longitude: -38.47885)),
        Banheiro(id: 2, blocoID: 1, locationID: 8, sexo: "F", acessivel: true,
                 location: Location(id: 8, latitude: -3.76978, longitude: -38.47882))
    ]
    
    let pontoCarrinho: [LocalizacaoDeInteresse] = [
        LocalizacaoDeInteresse(
            id: 300,
            blocoID: 0,
            locationID: 300,
            nome: "Ponto de Carrinho",
            categoria: .pontoCarrinho,
            location: Location(id: 300, latitude: -3.7670436, longitude: -38.4792094)
        ),
        LocalizacaoDeInteresse(
            id: 301,
            blocoID: 0,
            locationID: 301,
            nome: "Ponto de Carrinho",
            categoria: .pontoCarrinho,
            location: Location(id: 301, latitude: -3.767450, longitude: -38.480101)
        ),
        LocalizacaoDeInteresse(
            id: 302,
            blocoID: 0,
            locationID: 302,
            nome: "Ponto de Carrinho",
            categoria: .pontoCarrinho,
            location: Location(id: 302, latitude: -3.768541, longitude: -38.479597)
        ),
        LocalizacaoDeInteresse(
            id: 303,
            blocoID: 0,
            locationID: 303,
            nome: "Ponto de Carrinho",
            categoria: .pontoCarrinho,
            location: Location(id: 303, latitude: -3.768186, longitude: -38.478787)
        ),
        LocalizacaoDeInteresse(
            id: 304,
            blocoID: 0,
            locationID: 304,
            nome: "Ponto de Carrinho",
            categoria: .pontoCarrinho,
            location: Location(id: 304, latitude: -3.768836, longitude: -38.478438)
        ),
        LocalizacaoDeInteresse(
            id: 305,
            blocoID: 0,
            locationID: 305,
            nome: "Ponto de Carrinho",
            categoria: .pontoCarrinho,
            location: Location(id: 305, latitude: -3.770313, longitude: -38.478229)
        ),
        LocalizacaoDeInteresse(
            id: 306,
            blocoID: 0,
            locationID: 306,
            nome: "Ponto de Carrinho",
            categoria: .pontoCarrinho,
            location: Location(id: 306, latitude: -3.770047, longitude: -38.475990)
        ),
        LocalizacaoDeInteresse(
            id: 307,
            blocoID: 0,
            locationID: 307,
            nome: "Ponto de Carrinho",
            categoria: .pontoCarrinho,
            location: Location(id: 307, latitude: -3.767044, longitude: -38.476450)
        ),
        LocalizacaoDeInteresse(
            id: 308,
            blocoID: 0,
            locationID: 308,
            nome: "Ponto de Carrinho",
            categoria: .pontoCarrinho,
            location: Location(id: 308, latitude: -3.767161, longitude: -38.477543)
        ),
        LocalizacaoDeInteresse(
            id: 309,
            blocoID: 0,
            locationID: 309,
            nome: "Ponto de Carrinho",
            categoria: .pontoCarrinho,
            location: Location(id: 309, latitude: -3.768451, longitude: -38.477617)
        )
    ]

    
    
    // MARK: Estados
    @State private var selectedBlocoID: Int?
    @State private var selectedBloco: Bloco?
    @State private var selectedLocalizacao: LocalizacaoDeInteresse?
    @State private var showingRotaCarrinho = false
    @State private var didApplyInitialZoom = false
    
    @State private var position: MapCameraPosition
    
    var preselectedLocation: LocalizacaoDeInteresse?
    
    
    // MARK: Init
    
    init(preselectedLocation: LocalizacaoDeInteresse? = nil) {
        self.preselectedLocation = preselectedLocation
        
        _position = State(initialValue:
            .region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: -3.7700, longitude: -38.4788),
                    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                )
            )
        )
    }
    
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                
                if routeManager.showingRoute, let route = routeManager.route {
                    MapPolyline(route).stroke(.blue, lineWidth: 5)
                }
                
                if showingRotaCarrinho {
                    MapPolyline(rotaCarrinho).stroke(.blue, lineWidth: 4)
                }
                
                // Blocos
                ForEach(viewModel.blocos) { bloco in
                    Annotation(bloco.nome, coordinate: bloco.location?.coordinate ?? CLLocationCoordinate2D()) {
                        Button { selectBloco(bloco) } label: {
                            VStack {
                                Image(systemName: "building.columns")
                                    .foregroundStyle(bloco == selectedBloco ? .red : .blue)
//                                Text(bloco.nome).font(.caption2)
                            }
                        }
                    }
                }
                
                // Locais do bloco selecionado
                if let bloco = selectedBloco {
                    ForEach(localizacoes.filter { $0.blocoID == bloco.id }) { local in
                        Annotation(local.nome, coordinate: local.location!.coordinate) {
                            Button { handleLocalizacaoTap(local) } label: {
                                VStack {
                                    getLocationPin(local: local)
                                        .foregroundStyle(.green)
//                                    Text(local.nome).font(.caption2)
                                }
                            }
                        }
                    }
                }
                
                ForEach(pontoCarrinho) { ponto in
                    Annotation(ponto.nome, coordinate: ponto.location!.coordinate) {
                        Button { showingRotaCarrinho.toggle() } label: {
                            VStack {
                                getLocationPin(local: ponto)
                                    .foregroundStyle(.blue)
//                                Text(ponto.nome).font(.caption2)
                            }
                        }
                    }
                }
                
                // Banheiros
                if let bloco = selectedBloco {
                    ForEach(banheiros.filter { $0.blocoID == bloco.id }) { banheiro in
                        Annotation("Banheiro \(banheiro.sexo)", coordinate: banheiro.location!.coordinate) {
                            Button { zoomInto(banheiro.location!) } label: {
                                VStack {
                                    Image(systemName:
                                            banheiro.sexo == "M"
                                            ? "figure.dress.line.vertical.figure"
                                            : "figure.dress.line.vertical.figure")
                                        .foregroundStyle(.yellow)
//                                    Text("Banheiro \(banheiro.sexo)")
//                                        .font(.caption2)
                                }
                            }
                        }
                    }
                }
            }
            .mapStyle(.imagery(elevation: .realistic))
            .ignoresSafeArea()
            
            // Picker de bloco
            VStack {
                Picker("Bloco", selection: $selectedBlocoID) {
                    ForEach(viewModel.blocos) { b in
                        Text("Bloco \(b.nome)").tag(Optional(b.id))
                    }
                }
                .pickerStyle(.menu)
                .frame(maxWidth: 200)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(12)
                .padding(.top)
                
                Spacer()
            }
        }
        
        .onAppear {
            viewModel.fetch(db: "bloco")
            locationManager.checkLocationAuthorization()
            
            if !didApplyInitialZoom {
                didApplyInitialZoom = true
                
                if let local = preselectedLocation,
                   let bloco = viewModel.blocos.first(where: { $0.id == local.blocoID }),
                   let loc = local.location {
                    
                    selectedBloco = bloco
                    selectedBlocoID = bloco.id
                    zoomInto(loc)
                    selectedLocalizacao = local
                }
            }
        }
        
        .onChange(of: selectedBlocoID) { id in
            if let bloco = viewModel.blocos.first(where: { $0.id == id }) {
                selectBloco(bloco)
            }
        }
        
        .onChange(of: coordinator.selectedLocalizacao) { local in
            if let local { handleLocalizacaoTap(local) }
        }
         
        .sheet(item: $selectedLocalizacao) { local in
            DetalhesSheetView(local: local, routeManager: routeManager)
        }
    }
    
    
    // MARK: Helpers
    
    private func handleLocalizacaoTap(_ local: LocalizacaoDeInteresse) {
        if let loc = local.location {
            zoomInto(loc)
            selectedLocalizacao = local
            routeManager.showingRoute = true
        }
    }
    
    private func selectBloco(_ bloco: Bloco) {
        selectedBloco = bloco
        if let loc = bloco.location { zoomInto(loc) }
    }
    
    private func zoomInto(_ location: Location) {
        withAnimation(.easeInOut(duration: 0.4)) {
            position = .camera(
                MapCamera(
                    centerCoordinate: location.coordinate,
                    distance: 35,
                    heading: 0,
                    pitch: 0
                )
            )
        }
    }
}


// MARK: - Extensões
extension Location {
    var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}

#Preview {
    DefaultView()
        .environmentObject(MapCoordinator())
}
