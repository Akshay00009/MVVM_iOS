//
//  Restaurant.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 09/06/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation
/*
class LoginBO: NSObject, Codable {
    
    var helperForUserAuthenticationResult: DataBO?

    enum CodingKeys: String, CodingKey {
        case helperForUserAuthenticationResult = "HelperForUserAuthenticationResult"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        helperForUserAuthenticationResult = try values.decodeIfPresent(DataBO.self, forKey: .helperForUserAuthenticationResult)
    }
    
    public func encode(to encoder: Encoder) {
    }
    
}

class DataBO: NSObject, Codable {
    var result : [ResultBO]?
    var returnValue : [ReturnValueBO]?
    var callResult : [CallResultBO]?
    enum CodingKeys: String, CodingKey {
        case result = "Result"
        case returnValue = "ReturnValue"
        case callResult = "CallResult"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([ResultBO].self, forKey: .result)
        returnValue = try values.decodeIfPresent([ReturnValueBO].self, forKey: .returnValue)
        callResult = try values.decodeIfPresent([CallResultBO].self, forKey: .callResult)
    }
}

class ResultBO: NSObject, Codable {
    var appInfo: [AppInfoBO]?
    enum CodingKeys: String, CodingKey {
        case appInfo = "appInfo"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        appInfo = try values.decodeIfPresent([AppInfoBO].self, forKey: .appInfo)!
    }
}

class AppInfoBO: NSObject, Codable {
    var appDescription : String = ""
    var appStatus  : String = ""
    
    enum CodingKeys: String, CodingKey {
        case appDescription = "AppDescription"
        case appStatus = "AppStatus"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        appDescription = try values.decodeIfPresent(String.self, forKey: .appDescription)!
        appStatus = try values.decodeIfPresent(String.self, forKey: .appStatus)!
    }
}

class ReturnValueBO: NSObject, Codable {
    var name: String = ""
    var boardId: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "HelperForUserAuthenticationResult"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)!
        
    }
}

class CallResultBO: NSObject, Codable {
    var errorDescription: String = ""
    var statusCode: String = ""
    
    enum CodingKeys: String, CodingKey {
        case errorDescription = "ErrorDescription"
        case statusCode = "StatusCode"

    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errorDescription = try values.decodeIfPresent(String.self, forKey: .errorDescription)!
        statusCode = try values.decodeIfPresent(String.self, forKey: .statusCode)!
    }
}



struct LoginBO {
    let helperForUserAuthenticationResult: HelperForUserAuthenticationResult?
}

struct HelperForUserAuthenticationResult {
    let appDescription: NSNull?
    let appStatus: Int?
    let callResult: CallResult?
    let result: Result?
    let returnValue: [ReturnValue]?
}

struct CallResult {
    let errorDescription, statusCode: String?
}

struct Result {
    let appDescription, code: NSNull?
    let stackTrace: String?
    let status: Int?
    let type: NSNull?
    let appInfo: AppInfo?
}

struct AppInfo {
    let appDescription: NSNull?
    let appStatus: Int?
}

struct ReturnValue {
    let sortBy, sortByInSearchDDL, sortColumn, sortby: NSNull?
    let returnValueSortBy: NSNull?
    let rowNumber: Int?
    let abmsid, adaSetting, adaSettingUid, activeTokenUid: NSNull?
    let allPracticeUserFlag: Int?
    let alternateName, alternateNames: NSNull?
    let approvalStatus: String?
    let areaOfFocusUid, assessmentEnd, assessmentInstanceItemNamelist, assessmentInstanceItemUid: NSNull?
    let assessmentInstanceItemUidlist, assessmentItemUid, assessmentItemUidList, assessmentStart: NSNull?
    let boardEmail: String?
    let boardID: NSNull?
    let boardList: [BoardList]?
    let boardName: String?
    let boardUid, csvFileUID, certificateList, certificateUidList: NSNull?
    let challengeQuestion, challengeQuestionAns, challengeQuestionUID, checkLoginProvider: NSNull?
    let comment, confirmUserUID, createdBy, createdDate: NSNull?
    let currentUTCDate, customGroupInfoList, dateOfBirth, defaultPage: NSNull?
    let deviceID, deviceName, deviceToken: NSNull?
    let diplomateRoleUserCount: Int?
    let domain, elementGroupList: NSNull?
    let email: String?
    let emailAddress1, emailOTP: NSNull?
    let emailOptOut: String?
    let emailSubject, emailText, encrypt: NSNull?
    let errorDescription, externalID: String?
    let figUserUID, returnValueFigUserUID, figUserUid, fileName: NSNull?
    let firstLoginDate: NSNull?
    let firstName: String?
    let forcePasswordReset: Int?
    let forcePasswordResetUID, gender, genderUid, generalCertificate: NSNull?
    let generalCertificateUid: NSNull?
    let generalInformation, googleAnalyticsTrackingID, googleAnalyticsUserUid: String?
    let groupAuthorization, groupMember, groupName, groupNames: NSNull?
    let groupUID, groupUIDs: NSNull?
    let healthPlanProgram: String?
    let ipAddress: NSNull?
    let inActive: Int?
    let inActiveText, individualBoardUid: NSNull?
    let isAccountLocked: Int?
    let isActiveText, isAlreadyRegistered: String?
    let isApproved: Int?
    let isAuthenticated: String?
    let isDiplomateUser, isEmailChanged, isFirstTimeLoggedIn: Bool?
    let isIOSDevice: NSNull?
    let isLoginSuccess: Int?
    let isMobileAppAllowed: String?
    let isNonAdminUsers: NSNull?
    let isOverrideUser, isRead, isResourceAvailable, isSavedFromAdminSettings: Bool?
    let isSuccess: Bool?
    let isSyllabusActive: NSNull?
    let isTesterUser: Bool?
    let isValidFile, isVerified, lastEditDate, lastLoginDate: NSNull?
    let lastName: String?
    let legacyPracID, listName: NSNull?
    let locationAuthorization: [String: Int?]?
    let loggedInUserUID: NSNull?
    let loginAttemptCount: Int?
    let loginErrorMessage: NSNull?
    let loginName: String?
    let mailServerResponse, mailType, memberBoardID, memberOfFlag: NSNull?
    let messageType: Int?
    let middleName: String?
    let npi, name, note, notificationText: NSNull?
    let otp: NSNull?
    let otpPreferenceFlag: Int?
    let otpSendOption, oldEmail, optInOut: NSNull?
    let pageNumber, pageSize: Int?
    let password, patientPopulationUid, phoneNumber, phoneNumberEncrypted: NSNull?
    let phoneOTP: NSNull?
    let portNo: Int?
    let postalCode, practiceName, practiceSettingUid, practiceTypeUid: NSNull?
    let practiceUID, preferedContact, preferredContact, profileImage: NSNull?
    let profileImageEXT: NSNull?
    let providerAuthorization: [String: Int?]?
    let providerLoginUserManagementFlag: Int?
    let providerName, providerUID, receiverEmail, recordCount: NSNull?
    let registeredDeviceNames, registeredDeviceUID, registeredDevicesList, replyTo: NSNull?
    let reports: String?
    let requestedDate, researchID, resetLink, resetUID: NSNull?
    let returnResultString: NSNull?
    let roleName, roundMaterialsUpdates: String?
    let runPeriodUID, smsText: NSNull?
    let smtpOption: Int?
    let sendMethod, senderEmail, server, serviceProviderUID: NSNull?
    let sessionID, sessionLastUpdate: NSNull?
    let specialStudiesGeneral, specialStudiesPerformance, startinPage: String?
    let status: NSNull?
    let statusCode: String?
    let statusSabbatical, statusSabbaticalGroup, subspecialty1, subspecialty10: NSNull?
    let subspecialty2, subspecialty3, subspecialty4, subspecialty5: NSNull?
    let subspecialty6, subspecialty7, subspecialty8, subspecialty9: NSNull?
    let suffix, syllabusUid: NSNull?
    let systemID: Int?
    let testFormQueueRebuildsUid: NSNull?
    let testerRoleUserCount: Int?
    let timeZoneUid: NSNull?
    let totalRecordCount: Int?
    let type, typeUid, user, userCertificate: NSNull?
    let userCertificateWithType, userGroup, userLog: NSNull?
    let userName: String?
    let userOldObject, userPermissions, userRegistrationUid: NSNull?
    let userRoleList: [UserRoleList]?
    let userRoleValues, userRoles, userUID, userUIDs: NSNull?
    let username, validationColumn, validationText, waitTimer: NSNull?
    let appUser: String?
    let lstGroupNames, lstGroupUids, lstNameGrps, lstRegisterUser: NSNull?
    let lstUserName, setRemoveAndRebuildClass, stream: NSNull?
}

struct BoardList {
    let sortBy, sortByInSearchDDL, sortColumn, sortby: NSNull?
    let boardListSortBy, adaMultiplier, adaSettingUid: NSNull?
    let acronym, address: String?
    let administratorList, administrators, attestedContent, attestedContentMethod: NSNull?
    let attestedFileURL: NSNull?
    let boardCode, boardUid: String?
    let categoryName, cityName, cityUid, colorSchemePreferences: NSNull?
    let createdDate, critiqueSubComponent, customGroupInfoList, customSelectedGroupList: NSNull?
    let customSelectedGroupListQHistory, defaultLabellingStyle, defaultLayout, defaultMobileLayout: NSNull?
    let defaultPinDeliveryMethod, deliveryFrequency, description, elementGroupList: NSNull?
    let emailAddress, encryption, host, hours: NSNull?
    let inactive: Bool?
    let inactiveAttestationCodeOfConduct, inactiveText, isAllowADASetting, isAllowDiplomatToOptOutOfReAttempt: NSNull?
    let isAllowMediaSharing, isAllowReAssessment, isAllowReAttemptsWithinItem, isAllowReviewOfItemContent: NSNull?
    let isAllowSnippetOfStem, isAllowSubscribing, isAllowSystemChat, isAllowViewOfItemMedia: NSNull?
    let isAllowViewOfQuestionContent, isAssessmentMode, isAttestCodeOfConduct, isDataUsedForResearch: NSNull?
    let isDisplayStaticTextAtSyllabusLevel, isEnableRelevanceToSpecialty, isGameMode, isGameReviewMode: NSNull?
    let isLearningMode, isMobileAppAllowed, isRemoteProctoring, isShareItems: NSNull?
    let isShowCorrectAnswerOnIncorrectAttempt, isTicketingEnabled, isTwoFactorAuthentication, itemSharing: NSNull?
    let logoFileUid, logoImage, logoImageEXT, masterBoardAttestationCodeOfConductUid: NSNull?
    let masterBoardSettingUid, masterSupplementoryQuestionUid, maximumNumberOfOptionsInOptionSet, mediaSharing: NSNull?
    let minimumNumberOfOptionsInOptionSet, modifiedDate: NSNull?
    let name: String?
    let noOfQuestions, numberOfAttemptToShowCorrectResponse, numberOfAttemptsIncorrectResoponse, numberOfOptionsInOptionSet: NSNull?
    let optOutConditions: NSNull?
    let pageNumber, pageSize: Int?
    let parameterType, parentSupplementoryQuestionUid, password, phoneNumber: NSNull?
    let pinValidityNumberOfItems, pinValidityPeriodType, pinValidityType, port: NSNull?
    let practiceUID, rating1, rating2, rating3: NSNull?
    let rating4, rating5, replyTo, resourceCategoryUID: NSNull?
    let smtpOption, saveFlag, scoreReportDetailToken, scoreReportToken: NSNull?
    let setDefultLogo: NSNull?
    let singleSignOn: Int?
    let stateName, stateUid: NSNull?
    let subdomain: String?
    let subscoreReportToken, supplementoryQuestionText, supplementoryQuestionType, supplementoryQuestionValue: NSNull?
    let termsAndConditionContent, termsAndConditionFileURL, termsAndConditionMethod, totalRecordCount: NSNull?
    let user, userUid, versionNumber, versionText: NSNull?
    let versionTextHTML, websiteURL, zipName, zipUid: NSNull?
    let returnVal: NSNull?
}

struct UserRoleList {
    let boardUid, createdDate, createdUserUid, description: NSNull?
    let externalID, inactive, listOrder, modifiedDate: NSNull?
    let name: String?
    let result: Result?
    let securityUidIsAllowedIsReadOnlyStream, selectedUserRoles, systemDefined: NSNull?
    let userRoleUid: String?
    let userUID: NSNull?
 }*/

struct LoginBO : Codable {
    let helperForUserAuthenticationResult : HelperForUserAuthenticationResult?
    
    enum CodingKeys: String, CodingKey {
        
        case helperForUserAuthenticationResult = "HelperForUserAuthenticationResult"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        helperForUserAuthenticationResult = try values.decodeIfPresent(HelperForUserAuthenticationResult.self, forKey: .helperForUserAuthenticationResult)
    }
    
}

struct HelperForUserAuthenticationResult : Codable {
    let appDescription : String?
    let appStatus : Int?
    let returnValue : [ReturnValue]?
    
    enum CodingKeys: String, CodingKey {
        
        case appDescription = "AppDescription"
        case appStatus = "AppStatus"
        case callResult = "CallResult"
        case result = "Result"
        case returnValue = "ReturnValue"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        appDescription = try values.decodeIfPresent(String.self, forKey: .appDescription)
        appStatus = try values.decodeIfPresent(Int.self, forKey: .appStatus)
        returnValue = try values.decodeIfPresent([ReturnValue].self, forKey: .returnValue)
    }
    
    public func encode(to encoder: Encoder) {
    }
}

struct ReturnValue : Codable {
    let sortBy : String?
    let sortByInSearchDDL : String?
    let sortColumn : String?
    let rowNumber : Int?
    let aBMSID : String?
    let aDASetting : String?
    let aDASettingUid : String?
    let activeTokenUid : String?
    let allPracticeUserFlag : Int?
    let alternateName : String?
    let alternateNames : String?
    let approvalStatus : String?

    let _AppUser : String?
    let lstGroupNames : String?
    let lstGroupUids : String?
    let lstNameGrps : String?
    let lstRegisterUser : String?
    let lstUserName : String?
    let setRemoveAndRebuildClass : String?
    let stream : String?
    
    enum CodingKeys: String, CodingKey {
        
        case sortBy = "SortBy"
        case sortByInSearchDDL = "SortByInSearchDDL"
        case sortColumn = "SortColumn"
        case rowNumber = "rowNumber"
        case aBMSID = "ABMSID"
        case aDASetting = "ADASetting"
        case aDASettingUid = "ADASettingUid"
        case activeTokenUid = "ActiveTokenUid"
        case allPracticeUserFlag = "AllPracticeUserFlag"
        case alternateName = "AlternateName"
        case alternateNames = "AlternateNames"
        case approvalStatus = "ApprovalStatus"

        case waitTimer = "WaitTimer"
        case _AppUser = "_AppUser"
        case lstGroupNames = "lstGroupNames"
        case lstGroupUids = "lstGroupUids"
        case lstNameGrps = "lstNameGrps"
        case lstRegisterUser = "lstRegisterUser"
        case lstUserName = "lstUserName"
        case setRemoveAndRebuildClass = "setRemoveAndRebuildClass"
        case stream = "stream"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sortByInSearchDDL = try values.decodeIfPresent(String.self, forKey: .sortByInSearchDDL)
        sortColumn = try values.decodeIfPresent(String.self, forKey: .sortColumn)
        sortBy = try values.decodeIfPresent(String.self, forKey: .sortBy)
        rowNumber = try values.decodeIfPresent(Int.self, forKey: .rowNumber)
        aBMSID = try values.decodeIfPresent(String.self, forKey: .aBMSID)
        aDASetting = try values.decodeIfPresent(String.self, forKey: .aDASetting)
        aDASettingUid = try values.decodeIfPresent(String.self, forKey: .aDASettingUid)
        activeTokenUid = try values.decodeIfPresent(String.self, forKey: .activeTokenUid)
        allPracticeUserFlag = try values.decodeIfPresent(Int.self, forKey: .allPracticeUserFlag)
        alternateName = try values.decodeIfPresent(String.self, forKey: .alternateName)
        alternateNames = try values.decodeIfPresent(String.self, forKey: .alternateNames)
        approvalStatus = try values.decodeIfPresent(String.self, forKey: .approvalStatus)
  
        _AppUser = try values.decodeIfPresent(String.self, forKey: ._AppUser)
        lstGroupNames = try values.decodeIfPresent(String.self, forKey: .lstGroupNames)
        lstGroupUids = try values.decodeIfPresent(String.self, forKey: .lstGroupUids)
        lstNameGrps = try values.decodeIfPresent(String.self, forKey: .lstNameGrps)
        lstRegisterUser = try values.decodeIfPresent(String.self, forKey: .lstRegisterUser)
        lstUserName = try values.decodeIfPresent(String.self, forKey: .lstUserName)
        setRemoveAndRebuildClass = try values.decodeIfPresent(String.self, forKey: .setRemoveAndRebuildClass)
        stream = try values.decodeIfPresent(String.self, forKey: .stream)
    }
    
    public func encode(to encoder: Encoder) {
    }
}
