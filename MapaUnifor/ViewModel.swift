//
//  ViewModel.swift
//  MapaUnifor
//
//  Created by Turma01-14 on 17/11/25.
//

import Foundation

let dbVarDict: [String: String] = ["localizacoes": "location", "bloco": "bloco", "interesses": "localizacaoDeInteresse", "blocos": "bloco"]

class ViewModel: ObservableObject {
    @Published var posicoes: [Location] = []
    @Published var blocos: [Bloco] = []
    @Published var localizacoes: [LocalizacaoDeInteresse] = []
    
    func fetch(ip: String = "192.168.128.13", db: String) {
        guard let url = URL(string: "http://" + ip + ":1880/" + db) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            let decoder = JSONDecoder()
            // decoder.keyDecodingStrategy = .convertFromSnakeCase // enable if needed
            
            do {
                switch dbVarDict[db] {
                case "location":
                    let parsed = try decoder.decode([Location].self, from: data)
                    DispatchQueue.main.async { self?.posicoes = parsed }
                case "bloco":
                    let parsed = try decoder.decode([Bloco].self, from: data)
                    DispatchQueue.main.async {
                        self?.blocos = parsed
                        print(self?.blocos)

                    }

                case "localizacaoDeInteresse":
                    let parsed = try decoder.decode([LocalizacaoDeInteresse].self, from: data)
                    DispatchQueue.main.async {
                        self?.localizacoes = parsed
                    }

                default:
                    print("Unknown db key: \(db)")
                }
            } catch {
                print("Decoding error for db=\(db):", error)
            }
        }
        
        task.resume()
    }
}

