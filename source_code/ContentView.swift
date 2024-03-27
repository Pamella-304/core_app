//
//  ContentView.swift
//  teste
//
//  Created by Caio Melloni dos Santos on 25/03/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Destination]()
    // cria um novo local para inserção de novos dados
    // como filtrar por diferentes criterios de ordenação: video 5/8 sorting query results - Paul Hudson

    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView()
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
        }
        .navigationTitle("Insert information to dataBase")
        .toolbar {
            Button("Add Destination", systemImage: "plus", action: addDestination)
        }
        .padding(.horizontal, 300)
        .padding(.vertical, 200)
    }

    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
}

#Preview {
    ContentView()
}
