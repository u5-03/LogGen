//
//  LogGenCore.swift
//  LogGen
//
//  Created by yugo.sugiyama on 2022/03/17.
//

import Foundation
import Stencil
import StencilSwiftKit
import PathKit

public final class LogGenCore {
    public static func generate(ymlEntity: YmlEntity) {
        generateLog(ymlEntity: ymlEntity)
    }

    private static func generateLog(ymlEntity: YmlEntity) {
        let filemanager = FileManager.default
        let currentPath = filemanager.currentDirectoryPath
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        let templateFileFullPath = Path(stringLiteral: currentPath + "/" + ymlEntity.templateFilePathInfo.templateFileDirectory)
        var environment = stencilSwiftEnvironment()
        environment.loader = FileSystemLoader(paths: [(templateFileFullPath)])
        do {
            let viewLogJsonFilePath = currentPath + "/" + ymlEntity.jsons.jsonPath
            let viewLogJsonFileURL = URL(fileURLWithPath: viewLogJsonFilePath)

            guard let viewLogData = try? Data(contentsOf: viewLogJsonFileURL) else {
                printError(message: "Log json file not found")
                return
            }

            let logModel = try jsonDecoder.decode(LogModel.self, from: viewLogData)
            let logDictionaries = logModel.eventData.map({ try! $0.asDictionary() })

            let dictionary: [String: Any] = [
                "logDictionaries": logDictionaries,
            ]
            let outputDirectory = currentPath + "/" + ymlEntity.outputDirectory
            if !filemanager.fileExists(atPath: outputDirectory) {
                do {
                    try filemanager.createDirectory(at:  URL(fileURLWithPath: outputDirectory), withIntermediateDirectories: true, attributes: nil)
                } catch let error {
                    printError(message: error.localizedDescription)
                }
            } else {
                print("outputDirectory is exist!")
            }

            [
                FileType(fileName: ymlEntity.templateFilePathInfo.iOSFileName ?? "", isiOS: true),
                FileType(fileName: ymlEntity.templateFilePathInfo.androidFileName ?? "", isiOS: false)
            ]
                .filter({ !$0.fileName.isEmpty })
                .forEach { fileType in
                    generateOSLog(environment: environment, fileType: fileType, parameterDictionary: dictionary, outputDirectory: outputDirectory)
                }
        } catch let error {
            printError(message: error.localizedDescription)
        }
    }

    private static func generateOSLog(environment: Environment, fileType: FileType, parameterDictionary: [String: Any], outputDirectory: String) {
        do {
            let template = try environment.loadTemplate(name: fileType.fileName)
            let rendered = try template.render(parameterDictionary)
            let generatedFilePath = outputDirectory + "/Generated.\(fileType.isiOS ? "swift" : "kt")"
            print(generatedFilePath)
            try rendered.write(toFile: generatedFilePath, atomically: true, encoding: .utf8)
        } catch let error {
            printError(message: error.localizedDescription)
        }
    }

    public static func printError(message: String) {
        print("LogGen: ⚠️ \(message)")
    }
}
