//
//  Destination.swift
//  core_app
//
//  Created by Pamella Alvarenga on 25/03/24.
//

import Foundation
import SwiftData

@Model // macro que diz ao SwiftData o que queremos que sejam objetos possíveis de carregar e salvar dentro do armazenamento permanente (possui muitas funcionalidades agregadas)
class Destination {
    var name: String
    var email: String
    var birthDate: Date
    var periodPhase: Bool
    var password: String
    @Relationship(deleteRule: .cascade) var jobs = [Job]()

    init(name: String = "", email: String = "", birthDate: Date = .now, periodPhase: Bool = false, password: String = "") {
        self.name = name
        self.email = email
        self.birthDate = birthDate
        self.periodPhase = periodPhase
        self.password = password
    }
}
