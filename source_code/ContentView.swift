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
    @Query var destinations: [Destination]
    // query vai ler todos os objetos do tipo destination sendo armazenados no database e apresenta-los ness array
    // em comparação ao coreData, ele é equivalente à propriedade fetch request

    var body: some View {
        NavigationStack {
            List {
                ForEach(destinations) { destination in
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)

                        Text(destination.birthDate.formatted(date: .long, time: .shortened))
                    }
                }
                .onDelete(perform: deleteDestinations)
            }
        }
        .navigationTitle("Insert information to dataBase")
        .toolbar {
            Button("Add new User", action: addNewUser)
        }
        .padding(.horizontal, 300)
        .padding(.vertical, 200)
    }

    func addNewUser() {
        let rome = Destination(name: "Rome", birthDate: .now)
        let florence = Destination(name: "Florence", birthDate: .now)
        let naples = Destination(name: "Naples", birthDate: .now)

        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }

    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    ContentView()
}
