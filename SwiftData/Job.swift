//
//  Job.swift
//  core_app
//
//  Created by Pamella Alvarenga on 27/03/24.
//

import Foundation
import SwiftData

@Model // macro que diz ao SwiftData o que queremos que sejam objetos possíveis de carregar e salvar dentro do armazenamento permanente (possui muitas funcionalidades agregadas)
class Job {
    var name: String
    var priority: Int
    var owner: Destination?

    init(name: String, priority: Int, owner: Destination? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
