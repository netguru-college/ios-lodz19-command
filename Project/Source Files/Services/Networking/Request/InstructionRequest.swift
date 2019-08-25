//
//  InstructionRequest.swift
//  NetguruCollegeApp
//

struct InstructionsRequest: APIRequest {

    var path: String {
        return "/recipes/\(id)/analyzedInstructions"
    }

    var parameters: [String: String]? {
        return ["apiKey": "fbeab34bf4ab4fa6bce392488fabb262"]
    }

    var method: APIMethod = .get

    let id: Int

    init(id: Int) {
        self.id = id
    }
}
