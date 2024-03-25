//
//  CoreApp.swift
//  teste
//
//  Created by Caio Melloni dos Santos on 25/03/24.
//

import SwiftData
import SwiftUI

@main
struct CoreApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
        // diz ao SwiftData que queremos criar o armazenaento para esse objeto destino,
        // ou carregá-lo se foi criado separadamente,
        // e então usar esse armazenamento para todos os dados dentro do WindowGroup
        // Isso quer dizer que o ModelContainer é equivalente ao NSpersistenContainer (no caso do core Data),
        // mas tambem cumpre papel de SpersisyenCloudKit container, se o iCloud estiver enabled no seu app
    }
}
