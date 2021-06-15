//
//  ImageEntity.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 14/06/21.
//


import Foundation

struct ImageEntity: Codable {
    let status: String?
    let source: String?
    let sortBy: String?
    let articles: [LiveNewsModel]?
}
