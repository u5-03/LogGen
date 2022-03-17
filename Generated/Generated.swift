// swiftlint:disable all
// Generated using LogGen, Do not edit manually!

import Foundation

public class LogManager {

    /**
    No. 1
    Category: Authentication
    Transmission timing: When successfully signed in
    */
    public static func sendSignInSuccessLog() {
        // Add common log-sending code!
        // sendLog(eventName: "sign_in_success", parameter: parameter.asDictionary())
    }

    /**
    No. 2
    Category: Authentication
    Transmission timing: When signing in fails
    */
    public static func sendSignInFailureLog(parameter: LogSignInFailureParameter) {
        // Add common log-sending code!
        // sendLog(eventName: "sign_in_failure", parameter: parameter.asDictionary())
    }

    /**
    No. 3
    Category: Authentication
    Transmission timing: When successfully signed up
    */
    public static func sendSignUpSuccessLog() {
        // Add common log-sending code!
        // sendLog(eventName: "sign_up_success", parameter: parameter.asDictionary())
    }

    /**
    No. 4
    Category: Authentication
    Transmission timing: When signing up fails
    */
    public static func sendSignUpFailureLog(parameter: LogSignUpFailureParameter) {
        // Add common log-sending code!
        // sendLog(eventName: "sign_up_failure", parameter: parameter.asDictionary())
    }

    /**
    No. 5
    Category: Authentication
    Transmission timing: When tapping the reset email address button
    Remarks: Do not send when the character string of the email address is empty
    */
    public static func sendMailResetLog() {
        // Add common log-sending code!
        // sendLog(eventName: "mail_reset", parameter: parameter.asDictionary())
    }

    /**
    No. 6
    Category: Top
    Transmission timing: When succeeding in getting the top API
    */
    public static func sendTopApiSuccessLog(parameter: LogTopApiSuccessParameter) {
        // Add common log-sending code!
        // sendLog(eventName: "top_api_success", parameter: parameter.asDictionary())
    }

    /**
    No. 7
    Category: Top
    Transmission timing: When the top API request fails
    Remarks: Send even if paging or search fails
    */
    public static func sendTopApiFailureLog(parameter: LogTopApiFailureParameter) {
        // Add common log-sending code!
        // sendLog(eventName: "top_api_failure", parameter: parameter.asDictionary())
    }

    /**
    No. 8
    Category: Top
    Transmission timing: When paging with the top API request
    */
    public static func sendTopApiPagingLog(parameter: LogTopApiPagingParameter) {
        // Add common log-sending code!
        // sendLog(eventName: "top_api_paging", parameter: parameter.asDictionary())
    }

    /**
    No. 9
    Category: Top
    Transmission timing: When tapping the search button at the top
    */
    public static func sendTopSearchLog(parameter: LogTopSearchParameter) {
        // Add common log-sending code!
        // sendLog(eventName: "top_search", parameter: parameter.asDictionary())
    }

    /**
    No. 10
    Category: Detail
    Transmission timing: When the detail API request fails
    */
    public static func sendDetailApiSucessLog(parameter: LogDetailApiSucessParameter) {
        // Add common log-sending code!
        // sendLog(eventName: "detail_api_sucess", parameter: parameter.asDictionary())
    }

    /**
    No. 11
    Category: Detail
    Transmission timing: When the detail API request fails
    */
    public static func sendDetailApiFailureLog(parameter: LogDetailApiFailureParameter) {
        // Add common log-sending code!
        // sendLog(eventName: "detail_api_failure", parameter: parameter.asDictionary())
    }

}

public struct LogSignInFailureParameter: Codable {
    public let errorMsg: String

    public init(
        errorMsg: String
    ) {
        self.errorMsg = errorMsg
    }
}

public struct LogSignUpFailureParameter: Codable {
    public let errorMsg: String

    public init(
        errorMsg: String
    ) {
        self.errorMsg = errorMsg
    }
}

public struct LogTopApiSuccessParameter: Codable {
    public let userId: String

    public init(
        userId: String
    ) {
        self.userId = userId
    }
}

public struct LogTopApiFailureParameter: Codable {
    public let userId: String

    public init(
        userId: String
    ) {
        self.userId = userId
    }
}

public struct LogTopApiPagingParameter: Codable {
    public let userId: String
    public let index: String
    public let offset: String

    public init(
        userId: String,
        index: String,
        offset: String
    ) {
        self.userId = userId
        self.index = index
        self.offset = offset
    }
}

public struct LogTopSearchParameter: Codable {
    public let userId: String
    public let keyword: String
    public let index: String
    public let offset: String

    public init(
        userId: String,
        keyword: String,
        index: String,
        offset: String
    ) {
        self.userId = userId
        self.keyword = keyword
        self.index = index
        self.offset = offset
    }
}

public struct LogDetailApiSucessParameter: Codable {
    public let userId: String

    public init(
        userId: String
    ) {
        self.userId = userId
    }
}

public struct LogDetailApiFailureParameter: Codable {
    public let userId: String
    public let errorMsg: String

    public init(
        userId: String,
        errorMsg: String
    ) {
        self.userId = userId
        self.errorMsg = errorMsg
    }
}

