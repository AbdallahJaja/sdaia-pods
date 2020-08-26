//
//  APIResponses.swift
//  CoronaApp
//
//  Created by Aziz Dev on 29/03/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import UIKit
import Constants

//MARK:- Login
struct LoginResponse: Decodable {
    
    var access_token: String { return _access_token ?? "" }
    var expires_in: Int { return _expires_in ?? 0 }
    var not_before_policy: Int { return _not_before_policy ?? 0 }
    var refresh_expires_in: Int { return _refresh_expires_in ?? 0 }
    var refresh_token: String { return _refresh_token ?? "" }
    var scope: String { return _scope ?? "" }
    var session_state: String { return _session_state ?? "" }
    var token_type: String { return _token_type ?? "" }
    
    
    
    private var _access_token: String?
    private var _expires_in: Int?
    private var _not_before_policy: Int?
    private var _refresh_expires_in: Int?
    private var _refresh_token: String?
    private var _scope: String?
    private var _session_state: String?
    private var _token_type: String?
    
    
    private enum CodingKeys : String, CodingKey {
        
        case _access_token = "access_token"
        case _expires_in = "expires_in"
        case _not_before_policy = "not-before-policy"
        case _refresh_expires_in = "refresh_expires_in"
        case _refresh_token = "refresh_token"
        case _scope = "scope"
        case _session_state = "session_state"
        case _token_type = "token_type"
        
    }
}

//MARK:- User Information
struct UserInfoResponse: Decodable {
    
    var nationalId: Int { return _nationalId ?? 0 }
    var name: String { return _name ?? "" }
    var nameEn: String { return _nameEn ?? "" }
    var phone: String { return _phone ?? "" }
    var gender: Int { return _gender ?? 0 }
    var bloodType: Int { return _bloodType ?? 0 }
    var status: String { return _status ?? "" }
    var birthDate: String { return _birthDate ?? "" }
    var newAnnouncementsCount : Int {return _announcementCount ?? 0}



    var dependents: [DependentsResponse]?
    var healthAnswered: Bool? = false
    var dependentSelected: Bool? = false
    var homeLatitude: Double?
    var homeLongitude: Double?
	var braceletId: String?
    var isRegisterdToAbsher: Bool? = false

    var isAdult : Bool { return _isAdult ?? false }
    var numberOfchildern : Int { return _numberOfchildern ?? 0 }
    
    var refId : Int { return _refId ?? 0 }

    private var _nationalId: Int?
    private var _name: String?
    private var _nameEn: String?
    private var _phone: String?
    private var _gender: Int?
    private var _bloodType: Int?
    private var _image: String?
    private var _status: String?
    private var _birthDate: String?

    private var _isAdult: Bool?
    private var _numberOfchildern: Int?
    
    private var _refId: Int?

    private var _announcementCount : Int?


    private enum CodingKeys : String, CodingKey {
        case _nationalId = "nationalId"
        case _name = "name"
        case _nameEn = "nameEn"
        case _phone = "phone"
        case _gender = "gender"
        case _bloodType = "bloodType"
        case _image = "image"
        case dependents = "dependents"
        case _status = "status"
        case _birthDate = "birthDate"
        case _isAdult = "isAdult"
        case _numberOfchildern = "numberOfchildern"
        case _refId = "refId"
        
        case healthAnswered = "healthAnswered"
        case homeLatitude = "homeLatitude"
        case homeLongitude = "homeLongitude"
        case dependentSelected = "dependentSelected"
		case braceletId = "braceletSer"
        case _announcementCount = "NewAnnouncementsCount"
        case isRegisterdToAbsher = "absherReg"

    }
}

struct UserImageResponse: Decodable {
    
    var image: String { return _image ?? "" }
    
    private var _image: String?
    
    private enum CodingKeys : String, CodingKey {
        case _image = "img"
    }
    
    init(imageBase64: String) {
        self._image = imageBase64
    }
    
}
//MARK:- Dependents
struct DependentsResponse: Decodable {
    
    var name: String { return _name ?? "" }
    var gender: Int { return _gender ?? 0 }
    var bloodType: Int { return _bloodType ?? -1 }
    var id: Int { return _id ?? 0 }
    var image: String { return _image ?? "" }
    var sponsored: Bool { return _sponsored ?? false }
    
    private var _name: String?
    private var _gender: Int?
    private var _bloodType: Int?
    private var _id: Int?
    private var _image: String?
    private var _sponsored: Bool?
    
    private enum CodingKeys : String, CodingKey {
        case _name = "name"
        case _gender = "gender"
        case _bloodType = "bloodType"
        case _id = "id"
        case _image = "image"
        case _sponsored = "sponsored"
    }
    
}

//MARK:- Change Password
struct ChangePasswordResponseModel: Decodable {
    
    var status: String { return _status ?? "" }
    var message: String { return _message ?? "" }
    
    private var _status: String?
    private var _message: String?
    
    private enum CodingKeys : String, CodingKey {
        case _status = "status"
        case _message = "message"
    }
}

//MARK:- Feeds
struct FeedItemResponse: Decodable {
    var title: String { return _title ?? "" }
    var link: String { return _link ?? "" }
    var icon: String { return _icon ?? "" }
    
    private var _title: String?
    private var _link: String?
    private var _icon: String?
    
    private enum CodingKeys : String, CodingKey {
        case _title = "title"
        case _link = "link"
        case _icon = "icon"
    }
}

//MARK:- Announcement
struct AnnouncementResponse: Decodable {
    
    var id: Int { return _id ?? 0 }
    var titleAr: String { return _titleAr ?? "" }
    var titleEn: String { return _titleEn ?? "" }
    var descriptionAr: String { return _descriptionAr ?? "" }
    var descriptionEn: String { return _descriptionEn ?? "" }
    var buttonTitleAr: String { return _buttonTitleAr ?? "" }
    var buttonTitleEn: String { return _buttonTitleEn ?? "" }
    var link: String { return _link ?? "" }
    var isRead : Bool {return _isRead ?? false}
    
    private var _id: Int?
    private var _titleAr: String?
    private var _titleEn: String?
    private var _descriptionAr: String?
    private var _descriptionEn: String?
    private var _buttonTitleAr: String?
    private var _buttonTitleEn: String?
    private var _link: String?
    private var _isRead: Bool?


    private enum CodingKeys : String, CodingKey {
        case _id = "id"
        case _titleAr = "titleAr"
        case _titleEn = "titleEn"
        case _descriptionAr = "descriptionAr"
        case _descriptionEn = "descriptionEn"
        case _buttonTitleAr = "buttonTitleAr"
        case _buttonTitleEn = "buttonTitleEn"
        case _link = "link"
        case _isRead = "isRead"
    }
    
    var localizedTitle: String {
        let isArabic = AppUtils.isAppArabic()
        return isArabic ? titleAr : titleEn
    }
    
    var localizedDescription: String {
        let isArabic = AppUtils.isAppArabic()
        return isArabic ? descriptionAr : descriptionEn
    }
    
    var localizedButtonTitle: String {
        let isArabic = AppUtils.isAppArabic()
        var title =  isArabic ? buttonTitleAr : buttonTitleEn
        if title.trimmingChars.isEmpty {
            title = NSLocalizedString("OK", comment: "")
        }
        return title
    }
}

//MARK:- Quota
struct QuotaResponse: Decodable {
    
    var status: String { return _status ?? "" }
    var message: String { return _message ?? "" }
    
    private var _status: String?
    private var _message: String?
    
    private enum CodingKeys : String, CodingKey {
        case _status = "status"
        case _message = "message"
    }
}

struct DriverQuotaResponse: Decodable {
    
    var message: String { return _message ?? "" }
    
    private var _message: String?
    
    private enum CodingKeys : String, CodingKey {
        case _message = "msg"
    }
}

//MARK:- Registrations
struct CheckRegistrationResponse: Decodable {
    
    var id: String { return _id ?? "" }
    var mobile: String { return _mobile ?? "" }
    var token: String { return _token ?? "" }
    var absherReg: Bool
    
    private var _id: String?
    private var _mobile: String?
    private var _token: String?
    
    private enum CodingKeys : String, CodingKey {
        case _id = "id"
        case _mobile = "mobile"
        case absherReg = "absherReg"
        case _token = "token"
    }
    
}

struct CheckVRegistrationResponse: Decodable {
    
    var id: String { return _id ?? "" }
    var mobile: String { return _mobile ?? "" }
    var token: String { return _token ?? "" }
    var success: Bool
    
    private var _id: String?
    private var _mobile: String?
    private var _token: String?
    
    private enum CodingKeys : String, CodingKey {
        case _id = "id"
        case _mobile = "mobile"
        case success = "absherReg"
        case _token = "token"
    }
    
}

//MARK:- Verify OTP
struct VerifyOTPResponse: Decodable {
    
    var token: String { return _token ?? "" }
    var mobile: String { return _mobile ?? "" }
    
    private var _token: String?
    private var _mobile: String?
    
    private enum CodingKeys : String, CodingKey {
        case _token = "token"
        case _mobile = "mobile"
    }
    
}

//MARK:- Nationalites
struct NationalitesResponse : Decodable {
    
    var nationalityNameEn: String?
    var nationalityCode : Int?
    var nationalityNameAr : String?
    
}

struct GCCNationalitesResponse : Decodable {
    
    var nationalityNameEn: String?
    var nationalityCode : Int?
    var nationalityNameAr : String?
    
}

//MARK:- Permits
struct PermitHistoryInfoResponse: Decodable {
    
    var permitsHistory: [PermitHistoryResponse] { return _quotaRequestStatus ?? [] }
    var availableQuotas: Double { return _availableQuotas ?? 0.0 }
    
    private var _quotaRequestStatus: [PermitHistoryResponse]?
    private var _availableQuotas: Double?
    
    
    private enum CodingKeys : String, CodingKey {
        case _quotaRequestStatus = "permitsHistory"
        case _availableQuotas = "availableQuotas"
    }
    
}

struct PermitHistoryResponse: Decodable {
    
    var quotaRequestStatus: String { return _quotaRequestStatus ?? "" }
    var quotaRequestType: String { return _quotaRequestType ?? "" }
    var permitType : String {return _permitType ?? ""}
    var permitIcon : String {return _permitIcon ?? ""}
    var permitFrom: String { return _permitFrom ?? "" }
    var permitTo: String { return _permitTo ?? "" }
    var id: Int { return _id ?? 0 }
    var firmName: String { return _firmName ?? "" }
    var locationStart: LocationResponseObject?
    var locationDest: LocationResponseObject?
    private var _quotaRequestStatus: String?
    private var _quotaRequestType: String?
    private var _permitFrom: String?
    private var _permitTo: String?
    private var _id: Int?
    private var _firmName: String?
    private var _permitType: String?
    private var _permitIcon : String?
    
    var permitAllowedOperations: PermitAllowedOperations?
    
    var permitCompanions: [PermitCompanion]?
    
    private enum CodingKeys : String, CodingKey {
        case _quotaRequestStatus = "quotaRequestStatus"
        case _quotaRequestType = "quotaRequestType"
        case _permitFrom = "permitFrom"
        case _permitTo = "permitTo"
        case _id = "id"
        case _firmName = "firmName"
        case locationStart = "locationStart"
        case locationDest = "locationDest"
        case permitAllowedOperations = "permitAllowedOperations"
        case permitCompanions = "permitCompanions"
        case _permitType = "permitRequestTypeDesc"
        case _permitIcon = "permitRequestTypeIcon"
    }
}

struct PermitCompanion: Decodable {
    var nationalId: Int?
    var name: String?
}

struct PermitAllowedOperations: Decodable {
    var allowCancel: Bool?
    var allowCheckout: Bool?
    var allowUploadFiles: Bool?
}

struct HospitalPermitResponse: Decodable {
    
    var permitID: Int { return _permitID ?? 0 }
    var patientNationalID: Int { return _patientNationalID ?? 0 }
    var patientName: String { return _patientName ?? "" }
    
    private var _permitID: Int?
    private var _patientNationalID: Int?
    private var _patientName: String?
    
    private enum CodingKeys : String, CodingKey {
        case _permitID = "permitID"
        case _patientNationalID = "patientNationalID"
        case _patientName = "patientName"
    }
}

//MARK:- Application Version
struct CheckAppVersionResponse: Decodable {
    
    var appLink: String { return _appLink ?? "" }
    var mandatory: Bool { return _mandatory ?? false }
    var messageArabic: String { return _messageArabic ?? "" }
    var messageEnglish: String { return _messageEnglish ?? "" }
    var update: Bool { return _update ?? false }
    
    
    private var _appLink: String?
    private var _mandatory: Bool?
    private var _messageArabic: String?
    private var _messageEnglish: String?
    private var _update: Bool?
    
    func localizedMessage() -> String {
        let isAppArabic = AppUtils.isAppArabic()
        let msg = isAppArabic ? self.messageArabic : self.messageEnglish
        return msg
    }
    
    private enum CodingKeys : String, CodingKey {
        
        case _appLink = "appLink"
        case _mandatory = "mandatory"
        case _messageArabic = "messageArabic"
        case _messageEnglish = "messageEnglish"
        case _update = "update"
        
    }
    
}

//MARK:- Dependents
struct AllDependentsResponse: Decodable {
    let dependents: [PersonResponse]?
    let sponsored: [PersonResponse]?
}

struct PersonResponse: Decodable {
    
    var nationalId: String { return _nationalId ?? "" }
    var birthDate: String { return _birthDate ?? "" }
    var fullName: String { return _fullName ?? "" }
    var bloodType: Int { return _bloodType ?? -1 }
    var gender: Int { return _gender ?? -1 }
    var fullNameEn: String { return _fullNameEn ?? "" }
    
    private var _nationalId: String?
    private var _birthDate: String?
    private var _fullName: String?
    private var _bloodType: Int?
    private var _gender: Int?
    private var _fullNameEn: String?
    
    private enum CodingKeys : String, CodingKey {
        case _nationalId = "nationalId"
        case _birthDate = "birthDate"
        case _fullName = "fullName"
        case _bloodType = "bloodType"
        case _gender = "gender"
        case _fullNameEn = "fullNameEn"
    }
    
    
    func getTranslatedFullName() -> String {
        var name = ""
        if AppUtils.isAppArabic() {
            name = fullName.trimmingChars.isEmpty ? self.fullNameEn : self.fullName
        }
        name = fullNameEn.trimmingChars.isEmpty ? self.fullName : self.fullNameEn
        
        return name.trimmingChars.isEmpty ? NSLocalizedString("Name not found", comment: "") : name
    }
    
}

//MARK:- Curfew
struct CurfewStatusResponse: Decodable {
    var curfewStatus: String?
    var allowed: Bool? = false
    var listOfCurfew: [CurfewEndTimeResponse]? = []
    var radius: CurfewRadiusResponse?
    var curfewStatusDesc : String?
    var curfewStatusColorFrom :String?
    var curfewStatusColorTo :String?
    var curfewStatusForecolor : String?
    var validfrom: String?
    var validto: String?

    var status: CurfewStatus {
        return CurfewStatus.init(rawValue: curfewStatus ?? "") ?? .unkown
    }
    
    var type: PermitType {
        return listOfCurfew?.first?.type ?? .food
    }
    
    var currentCurfew: CurfewEndTimeResponse? {
        return listOfCurfew?.first
    }
}

struct CurfewEndTimeResponse: Decodable {
    var starTime: Date?
    var endTime: Date?
    var permitRequestType: String?
    var firmName: String?
    var locationStart: LocationResponseObject?
    var locationDest: LocationResponseObject?
    var destinations:  [LocationResponseObject?]?
    var permitRequestTypeDesc :String?
    var permitRequestTypeIcon: String?
    var permitId: Int?
    
    var type: PermitType {
        return PermitType.init(rawValue: permitRequestType ?? "") ?? .food
    }
    
}

struct LocationResponseObject: Decodable {
    var lat: Double?
    var long: Double?
    var name: String?
}

struct CurfewRadiusResponse: Decodable {
    var home: Double?
    var district: Double?
    var walking: Double?
}

//MARK:- Humanitarian Case Response
struct AttachmentUploadResponce: Decodable {
    var referenceId: String?
}

//MARK:- Gathering Permission Response
struct CreateGatherPermitResponse: Decodable {
    
    var id: String?
    var nationalID: Int?
    var name: String?
    var allowedCount: Int?
    var numberOfActiveCheckIns: Int?
    var createdAt: String?
    var gatheringTypeID: String?
    var longitude: Double?
    var latitude: Double?
    var radius: Int?
    var expiryDate: String?
    var administrators : [Admins]?
    
    var msg: String?
    
}

struct EditGatherPermitResponse: Decodable {
    
    var id: String?
    var createdAt: String?
    var gatheringTypeID: String?
    var radius: Int?
    var status : String?
    var longitude: Double?
    var numberOfAvailableSpots: Int?
    var latitude: Double?
    var allowedCount: Int?
    var nationalID: Int?
    var numberOfBlacklistedUsersScannedQR: Int?
    var msg: String?
    var name: String?
    var numberOfActiveCheckIns: Int?
}

struct TwakalnaUserResponse: Decodable {
    var name: String?
    var msg: String?
    
}

struct CancelGatherPermitResponse: Decodable {
    
    var msg: String?
    
}

struct AddAdminResponse: Decodable {
    
    var gatheringPermissionID: String?
    var nationalId: Int?
    var adminName: String?
    var msg: String?
    
}

struct RemoveAdminResponse: Decodable {
    
    var gatheringPermissionID: String?
    var removedNationalId: Int?
    var msg: String?
    
}

struct CheckInInfoResponse: Decodable {
    
    var gatheringPermissionID: String?
    var gatheringName: String?
    var gatheringAllowedCount: Int?
    var numberOfActiveCheckIns: Int?
    var numberOfAvailableSpots: Int?
    var gatheringTypeID: String?
    var gatheringTypeDesc: String?
    var gatheringLatitude: Double?
    var gatheringLongitude: Double?
    var gatheringRadius: Int?
    var checkedInAt: String?
    var checkedOutAt: String?
    
}

//MARK:- Change Mobile Number
struct ChangeMobileNumberResponse: Decodable {
    var token: String?
}
