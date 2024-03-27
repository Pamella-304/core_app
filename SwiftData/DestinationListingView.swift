//
//  DestinationListingView.swift
//  core_app
//
//  Created by Pamella Alvarenga on 26/03/24.
//

import SwiftData
import SwiftUI

// Essa struct é uma subview da ContentView

struct DestinationListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Destination> { destination in
        destination.name.localizedStandardContains("P")
    }, sort: \Destination.name, order: .reverse) var destinations: [Destination]

    // query vai ler todos os objetos do tipo destination sendo armazenados no database e apresenta-los ness array
    // em comparação ao coreData, ele é equivalente à propriedade fetch request
    // tambem pode ser usado para filtrar dados com condições estabelecidas
    // se nenhum filtro e utilizado, estou dizendo "load all destinatios

    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(destination.name)
                                .font(.headline)

                            Spacer()

                            Text(String(destination.jobs.count))
                                .fontWeight(.black)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }

                        Text(destination.birthDate.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
            .onAppear(perform: addSample)
        }
    }

    // Uma outra forma de filtrar: por meio do inicializador. Não é alterado o query principal. Ex:
//
//
//    @Query var destinations: [Destination]
//
//    init(nameConditionCharacter: String){
//        _destinations = Query(filter: #Predicate<Destination> { destination in
//            destination.name.localizedStandardContains("P")
//        }, sort: \Destination.name)
//    }

    func addSample() {
        let user1 = Destination(name: "Piper Chapman", email: "piperchapman@apple.com")
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)

        modelContext.insert(user1)
        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
    
    //tentar fazer esse tipo de rrelação por meio da entidade de relacionamento que o Caio fez
    //se deletarmos o usuário do banco de dados, os jobs continuam intactos
    // a propriedade owner de cada job simplesmente muda para nil

    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

// #Preview {
//    DestinationListingView()
// }
