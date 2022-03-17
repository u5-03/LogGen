//
//  YmlEntity.swift
//  LogGen
//
//  Created by yugo.sugiyama on 2022/03/17.
//

import Foundation

public struct YmlEntity: Decodable {
    public let jsons: YmlJsonEntity
    public let templateFilePathInfo: YmlTemplateEntity
    public let outputDirectory: String
}

public struct YmlJsonEntity: Decodable {
    public let jsonPath: String
}

public struct YmlTemplateEntity: Decodable {
    public let templateFileDirectory: String
    public let iOSFileName: String?
    public let androidFileName: String?
}
