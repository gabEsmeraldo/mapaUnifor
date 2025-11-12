import SwiftUI
import MapKit

func getLocationPin(local: LocalizacaoDeInteresse) -> Image{
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
    
    
    var blocos = [
        Bloco(id: 1, locationID: 1, nome: "K", location: Location(
            id: 1, latitude: -3.7698, longitude: -38.4788
        )),
        Bloco(id: 2, locationID: 2, nome: "J", location: Location(
            id: 2, latitude: -3.7705, longitude: -38.4792
        )),
        Bloco(id: 3, locationID: 3, nome: "H", location: Location(
            id: 3, latitude: -3.7710, longitude: -38.4782
        )),
    ]
    
    var localizacoes = [
        LocalizacaoDeInteresse(id:1,
                               blocoID: 1, locationID: 4, nome: "Lab. de Informática", categoria: .laboratorio,
                               location: Location(id: 4, latitude: -3.7697, longitude: -38.4789)
                              ),
        LocalizacaoDeInteresse(id:2,
                               blocoID: 2, locationID: 5, nome: "Cantina Bloco J", categoria: .lanchonete,
                               location: Location(id: 5, latitude: -3.7707, longitude: -38.4791)
                              ),
        LocalizacaoDeInteresse(id:3,
                               blocoID: 3, locationID: 6, nome: "Secretaria Acadêmica", categoria: .secretariaAcademica,
                               location: Location(id: 6, latitude: -3.7709, longitude: -38.4781)
                              ),
    ]
    
    var banheiros = [
        Banheiro(blocoID: 1, locationID: 7, sexo: "M", acessivel: true,
                 location: Location(id: 7, latitude: -3.76975, longitude: -38.47885)),
        Banheiro(blocoID: 1, locationID: 8, sexo: "F", acessivel: true,
                 location: Location(id: 8, latitude: -3.76978, longitude: -38.47882)),
        Banheiro(blocoID: 2, locationID: 9, sexo: "M", acessivel: false,
                 location: Location(id: 9, latitude: -3.77065, longitude: -38.47905)),
        Banheiro(blocoID: 3, locationID: 10, sexo: "F", acessivel: true,
                 location: Location(id: 10, latitude: -3.77095, longitude: -38.47815)),
    ]
    
    // MARK: - Estados
    
    @State var selectedBloco: Bloco? = nil
    @State private var position: MapCameraPosition
    
    // MARK: - Inicialização
    
    init() {
        _position = State(initialValue: .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: -3.7700, longitude: -38.4788),
                span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
            )
        ))
    }
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                
                // MARK: Blocos
                ForEach(blocos, id: \.id) { bloco in
                    Annotation(bloco.nome, coordinate: CLLocationCoordinate2D(
                        latitude: bloco.location?.latitude ?? 0.0,
                        longitude: bloco.location?.longitude ?? 0.0)
                    ) {
                        Button {
                            selectBloco(bloco)
                        } label: {
                            VStack {
                                Image(systemName: "building.columns")
                                    .font(.title)
                                    .foregroundStyle(bloco == selectedBloco ? .red : .blue)
                                Text(bloco.nome)
                                    .font(.caption2)
                                    .bold()
                            }
                        }
                    }
                }
                
                ForEach(localizacoes, id: \.id) { local in
                    if let blocoSelecionado = selectedBloco,
                       local.inIn(bloco: blocoSelecionado) {
                        
                        Annotation(local.nome, coordinate: CLLocationCoordinate2D(
                            latitude: local.location?.latitude ?? 0.0,
                            longitude: local.location?.longitude ?? 0.0)
                        ) {
                            VStack {
                                getLocationPin(local: local)
                                    .font(.title)
                                    .foregroundStyle(.green)
                                Text(local.nome)
                                    .font(.caption2)
                            }
                        }
                    }
                }
                
                ForEach(banheiros, id: \.self) { banheiro in
                    if let blocoSelecionado = selectedBloco,
                       banheiro.inIn(bloco: blocoSelecionado) {
                        
                        Annotation("Banheiro \(banheiro.sexo)", coordinate: CLLocationCoordinate2D(
                            latitude: banheiro.location?.latitude ?? 0.0,
                            longitude: banheiro.location?.longitude ?? 0.0)
                        ) {
                            VStack {
                                Image(systemName: banheiro.sexo == "M" ? "figure.dress.line.vertical.figure" : "figure.line.vertical.figure.dress")
                                    .font(.title)
                                    .foregroundStyle(.yellow)
                                Text("Banheiro \(banheiro.sexo)")
                                    .font(.caption2)
                            }
                        }
                    }
                }
            }
            .mapStyle(.imagery(elevation: .realistic))
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    // TO-DO Confirmar que variavel do picker está alterando conforme o bloco selecionado
                    Picker("Bloco", selection: Binding(
                        get: { selectedBloco ?? blocos.first },
                        set: { bloco in
                            if let bloco = bloco {
                                selectBloco(bloco)
                            }
                        }
                    )) {
                        ForEach(blocos, id: \.self) { bloco in
                            Text("Bloco \(bloco.nome)").tag(Optional(bloco))
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(maxWidth: 200)
                    .padding(.horizontal)
                }
                .padding(8)
                .background(.thinMaterial)
                .cornerRadius(12)
                .padding(.top, 40)
                
                Spacer()
            }
        }
        .onAppear {
            if let primeiro = blocos.first {
                selectBloco(primeiro)
            }
        }
    }
    
    // MARK: - Funções auxiliares
    
    private func selectBloco(_ bloco: Bloco) {
        selectedBloco = bloco
        if let loc = bloco.location {
            withAnimation(.easeInOut(duration: 0.5)) {
                position = .region(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: loc.latitude, longitude: loc.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.00002, longitudeDelta: 0.00002)
                ))
            }
        }
    }
    
}

#Preview {
    DefaultView()
}
