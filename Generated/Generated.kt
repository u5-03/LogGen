// Generated using LogGen, Do not edit manually!

public class LogManager {
    /**
    No. 1
    Category: Authentication
    Transmission timing: When successfully signed in
    */
    public fun sendSignInSuccessLog() {
        // Add common log-sending code!
        // sendLog("sign_in_success", parameter.asDictionary())
    }

    /**
    No. 2
    Category: Authentication
    Transmission timing: When signing in fails
    */
    public fun sendSignInFailureLog(parameter: LogSignInFailureParameter) {
        // Add common log-sending code!
        // sendLog("sign_in_failure", parameter.asDictionary())
    }

    /**
    No. 3
    Category: Authentication
    Transmission timing: When successfully signed up
    */
    public fun sendSignUpSuccessLog() {
        // Add common log-sending code!
        // sendLog("sign_up_success", parameter.asDictionary())
    }

    /**
    No. 4
    Category: Authentication
    Transmission timing: When signing up fails
    */
    public fun sendSignUpFailureLog(parameter: LogSignUpFailureParameter) {
        // Add common log-sending code!
        // sendLog("sign_up_failure", parameter.asDictionary())
    }

    /**
    No. 5
    Category: Authentication
    Transmission timing: When tapping the reset email address button
    Remarks: Do not send when the character string of the email address is empty
    */
    public fun sendMailResetLog() {
        // Add common log-sending code!
        // sendLog("mail_reset", parameter.asDictionary())
    }

    /**
    No. 6
    Category: Top
    Transmission timing: When succeeding in getting the top API
    */
    public fun sendTopApiSuccessLog(parameter: LogTopApiSuccessParameter) {
        // Add common log-sending code!
        // sendLog("top_api_success", parameter.asDictionary())
    }

    /**
    No. 7
    Category: Top
    Transmission timing: When the top API request fails
    Remarks: Send even if paging or search fails
    */
    public fun sendTopApiFailureLog(parameter: LogTopApiFailureParameter) {
        // Add common log-sending code!
        // sendLog("top_api_failure", parameter.asDictionary())
    }

    /**
    No. 8
    Category: Top
    Transmission timing: When paging with the top API request
    */
    public fun sendTopApiPagingLog(parameter: LogTopApiPagingParameter) {
        // Add common log-sending code!
        // sendLog("top_api_paging", parameter.asDictionary())
    }

    /**
    No. 9
    Category: Top
    Transmission timing: When tapping the search button at the top
    */
    public fun sendTopSearchLog(parameter: LogTopSearchParameter) {
        // Add common log-sending code!
        // sendLog("top_search", parameter.asDictionary())
    }

    /**
    No. 10
    Category: Detail
    Transmission timing: When the detail API request fails
    */
    public fun sendDetailApiSucessLog(parameter: LogDetailApiSucessParameter) {
        // Add common log-sending code!
        // sendLog("detail_api_sucess", parameter.asDictionary())
    }

    /**
    No. 11
    Category: Detail
    Transmission timing: When the detail API request fails
    */
    public fun sendDetailApiFailureLog(parameter: LogDetailApiFailureParameter) {
        // Add common log-sending code!
        // sendLog("detail_api_failure", parameter.asDictionary())
    }

}

public data class LogSignInFailureParameter(
    val errorMsg: String
)
public data class LogSignUpFailureParameter(
    val errorMsg: String
)
public data class LogTopApiSuccessParameter(
    val userId: String
)
public data class LogTopApiFailureParameter(
    val userId: String
)
public data class LogTopApiPagingParameter(
    val userId: String,
    val index: String,
    val offset: String
)
public data class LogTopSearchParameter(
    val userId: String,
    val keyword: String,
    val index: String,
    val offset: String
)
public data class LogDetailApiSucessParameter(
    val userId: String
)
public data class LogDetailApiFailureParameter(
    val userId: String,
    val errorMsg: String
)
