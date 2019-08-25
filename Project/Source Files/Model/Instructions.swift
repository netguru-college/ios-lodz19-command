//
//  Instructions.swift
//  NetguruCollegeApp
//

struct Instructions: Decodable {
    let steps: [Step]
}

struct Step: Decodable {
    let number: Int
    let step: String
}
