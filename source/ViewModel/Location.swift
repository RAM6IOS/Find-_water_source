//
//  Location.swift
//  source
//
//  Created by Bouchedoub Rmazi on 12/4/2022.
//

import Foundation



struct Location: Identifiable, Codable, Equatable {
   var id =  UUID()
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
 
