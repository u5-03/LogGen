//
//  LogModel.swift
//  LogGen
//
//  Created by yugo.sugiyama on 2022/03/17.
//

import Foundation

struct LogModel: Codable {
    let eventData: [LogItemModel]
}

struct LogItemModel: Codable {
    // JSON original key
    let id: Int
    let category: String
    let eventName: String
    let transmissionTiming: String
    let variables: [LogVariableModel]
    let remarks: String
    // LogGen customized key
    let isVariablesEmpty: Bool


    private enum CodingKeys: String, CodingKey {
        // JSON original key
        case id
        case category
        case eventName
        case transmissionTiming
        case variables
        case remarks
        // LogGen customized key
        case isVariablesEmpty
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        category = try container.decode(String.self, forKey: .category)
        eventName = try container.decode(String.self, forKey: .eventName)
        transmissionTiming = try container.decode(String.self, forKey: .transmissionTiming)
        variables = try container.decode([LogVariableModel].self, forKey: .variables)
        remarks = try container.decode(String.self, forKey: .remarks)

        isVariablesEmpty = variables.allSatisfy({ !$0.shouldShow })
    }
}

struct LogVariableModel: Codable {
    let key: String
    let shouldShow: Bool
}
