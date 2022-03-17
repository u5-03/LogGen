import LogGenCore
import Foundation
import Yams
import Commander

final class LogGen {
    func run(ymlPath: String) {
        if !ymlPath.contains("log-gen.yml") {
            LogGenCore.printError(message: "Cannot find config file 'log-gen.yml'")
        } else if !ymlPath.isEmpty {
            let url = URL(fileURLWithPath: ymlPath)
            guard let optionsParameters: YmlEntity = parseYaml(for: url) else {
                LogGenCore.printError(message: "Fail to parse yaml options. Check 'log-gen.yml' file in your project.")
                return
            }
            if optionsParameters.templateFilePathInfo.iOSFileName == nil || optionsParameters.templateFilePathInfo.iOSFileName?.isEmpty == true {
                print("iOS template file is not designed!")
            }
            if optionsParameters.templateFilePathInfo.androidFileName == nil || optionsParameters.templateFilePathInfo.androidFileName?.isEmpty == true {
                print("Android template file is not designed!")
            }
            LogGenCore.generate(ymlEntity: optionsParameters)
        } else {
            LogGenCore.printError(message: "YML file path is invalid! Check file path!")
        }
    }

    private func parseYaml<T>(for url: URL) -> T? where T: Decodable {
        let decoder = YAMLDecoder()
        guard let ymlString = try? String(contentsOf: url) else { return nil }
        return try? decoder.decode(from: ymlString)
    }
}

let main = command(Option("yml", default: "./log-gen.yml", description: "File path to write options")) { yml in
    let logGen = LogGen()
    logGen.run(ymlPath: yml)
}
main.run()
