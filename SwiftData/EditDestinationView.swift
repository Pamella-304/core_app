//
//  EditDestinationView.swift
//  core_app
//
//  Created by Pamella Alvarenga on 25/03/24.
//

import SwiftData
import SwiftUI

struct EditDestinationView: View {
    @Bindable var destination: Destination

    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Email", text: $destination.email, axis: .vertical)
            TextField("Password", text: $destination.password)
            DatePicker("birthDate", selection: $destination.birthDate)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Example")

        return EditDestinationView(destination: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
