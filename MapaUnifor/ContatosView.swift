//
//  ContatosView.swift
//  MapaUnifor
//
//  Created by Turma01-7 on 11/11/25.
//

import SwiftUI

struct ContatosView: View {
    var body: some View {
        ScrollView {
            ForEach(contatos, id: \.self) { contato in
                contatoRow(contato: contato)
            }
        }
    }
    
    func contatoRow (contato: Contato) -> some View {
        HStack{
            VStack(alignment: .leading){
                Text(contato.nome)
                    .bold()
                VStack(alignment: .leading){
                    if (contato.email != nil) {
                        HStack{
                            Image(systemName: "envelope")
                            Text(contato.email!)
                            
                        }
                    }
                    if (contato.whats != nil) {
                        HStack{
                            Image(systemName: "message")
                            Text(contato.whats!)
                            
                        }
                    }
                }
                .font(.subheadline)
            }
            .foregroundStyle(.white)
            Spacer()
            Link(destination: URL(string: "tel:\(contato.tel.filter { $0.isWholeNumber })")!) {
                Image(systemName: "phone")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            
        }
        .padding(.horizontal)
        .frame(width: 350, height: 80)
        .background(.blue)
        .cornerRadius(8)
    }
}

#Preview {
    ContatosView()
}

