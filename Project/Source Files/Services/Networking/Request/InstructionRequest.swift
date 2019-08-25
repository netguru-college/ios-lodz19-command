//
//  InstructionRequest.swift
//  NetguruCollegeApp
//

struct InstructionsRequest: APIRequest {

    var path: String {
        return "/recipies/\(id)/analyzedInstructions"
    }

    var method: APIMethod = .get

    let id: Int

    init(id: Int) {
        self.id = id
    }
}
