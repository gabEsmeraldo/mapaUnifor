//
//  MapCoordinator.swift
//  MapaUnifor
//
//  Created by Turma01-8 on 14/11/25.
//

import Foundation

class MapCoordinator: ObservableObject {
    @Published var selectedLocalizacao: LocalizacaoDeInteresse? = nil
    @Published var selectedTab: Int = 0 // 0 = ListView, 1 = MapView
}
