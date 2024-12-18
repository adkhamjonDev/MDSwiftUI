//
//  HttpRoutes.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 18/12/24.
//

class HttpRoutes {
    
    private init () {}
    
    static let shared = HttpRoutes()
    
    private static let API = "api/"
    
    static let LOGIN = "\(API)auth/login"
    static let CHECK_FOR_UPDATE = "\(API)android/check-version"
    static let MAP_CAR_LIST = "\(API)car/get-current-locations-with-radius"
    static let GET_PROFILE = "\(API)auth/me"
    static let CAR_DETAILS = "\(API)car"
    static let CAR_WAY_BILL = "\(API)waybill/get-by-car-id"
    static let CAR_PETROL = "\(API)benzin-tarqatish/get-by-car-id"
    static let CAR_HISTORY = "\(API)naryad/get-naryad-car-history"
    static let CAR_VIOLATION = "\(API)shtraf/get-by-carId"
    static let CREATE_VIOLATION = "\(API)shtraf/create"
    static let DRIVER_BY_ID = "\(API)employee"
    static let GET_REGIONS_POLYGON = "\(API)organization/get-geojson"

}
