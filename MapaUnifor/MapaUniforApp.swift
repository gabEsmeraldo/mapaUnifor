//
//  MapaUniforApp.swift
//  MapaUnifor
//
//  Created by Turma01-8 on 10/11/25.
//

import SwiftUI

@main
struct MapaUniforApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MapCoordinator())
        }
    }
}
