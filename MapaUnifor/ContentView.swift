//
//  ContentView.swift
//  MapaUnifor
//
//  Created by Turma01-8 on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coordinator = MapCoordinator()

    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
                    DefaultView()
                        .environmentObject(coordinator)
                        .tabItem {
                            Label("Mapa", systemImage: "map.fill")
                        }
                        .tag(0)
                    ListView()
                        .environmentObject(coordinator)
                        .tabItem {
                            Label("Lista", systemImage: "list.bullet")
                        }
                        .tag(1)
                    ContatosView()
                        .environmentObject(coordinator)
                        .tabItem {
                            Label("Contatos", systemImage: "phone.fill")
                        }
                        .tag(2)
                }
                .onAppear(){
                    UITabBar.appearance().backgroundColor = (.branco)
                }
                .tint(Color.azul)
    }
}

#Preview {
    ContentView()
        .environmentObject(MapCoordinator())

}
