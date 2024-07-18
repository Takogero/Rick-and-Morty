//
//  IdentifiableError.swift
//  Rick
//
//  Created by MacBookAir on 18.07.2024.
//

import Foundation

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
