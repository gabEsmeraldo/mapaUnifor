//
//  ContentView.swift
//  MapaUnifor
//
//  Created by Turma01-8 on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
                    DefaultView()
                        .tabItem {
                            Label("Mapa", systemImage: "map.fill")
                        }
                    ListView()
                        .tabItem {
                            Label("Lista", systemImage: "list.bullet")
                        }
                    ContatosView()
                        .tabItem {
                            Label("Contatos", systemImage: "phone.fill")
                        }
                }
                .onAppear(){
                    UITabBar.appearance().backgroundColor = (.branco)
                }
                .tint(Color.azul)
    }
}

#Preview {
    ContentView()
}
