//
//  Movie.swift
//  _MovieApp
//
//  Created by Youssef Hilaly on 20/01/1401 AP.
//

import Foundation

struct Movie: Codable{
    let title: String
    let image: String
    let rating: Double
    let releaseYear: Int
    let genre: [String]
}
typealias Movies = [Movie]
