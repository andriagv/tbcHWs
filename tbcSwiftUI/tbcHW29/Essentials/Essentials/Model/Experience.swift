//
//  Experience.swift
//  Essentials
//
//  Created by Apple on 08.12.24.
//


import Foundation

struct Experience: Identifiable {
    let id = UUID()
    let company: String
    let role: String
    let duration: String
}