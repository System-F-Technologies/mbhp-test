//
//  Apartment.swift
//  mbhp-test
//
//  Created by Ryan on 4/20/17. blaze-et
//  Copyright © 2017 System F. All rights reserved.
//

import Foundation
import CoreLocation


struct Contact { // apparently structs are lit in swift
    var name: String
    var email: String
    var phoneNumber: String
}

class Apartment {
    let id: Int64?
    var name: String
    var phoneNumber: String
    var address: String
    var location: CLLocationCoordinate2D
    var price: Double
    var beds: Int
    var bath: Int
    var descroiption: String
    var dateListed: Date
    var dateAvailable: Date
    var contact: Contact

    
    
    /*  theres got a be a simple way to pull json full of listing or whatever from the server into seprate Apartment objects so that we can display them all right and whatnot...
     */
    init(id: Int64, name: String, phone: String, address: String) //..... more stuff
    {
        self.id = id
        self.name = name
        self.phoneNumber = phone
        self.address = address
    }
    
    
    
    
}



/*
 
 
 use this shit for toStriging a phone number stored as a string w/ spaces, parens and shit
 
 var rawPhoneNumberArray: [String] = []
 rawPhoneNumberArray.append("1 800 222 3333")
 rawPhoneNumberArray.append("18002223333")
 rawPhoneNumberArray.append("8002223333")
 rawPhoneNumberArray.append("2223333")
 rawPhoneNumberArray.append("18002223333444")
 for rawPhoneNumber in rawPhoneNumberArray {
 if let formattedPhoneNumber = format(phoneNumber: rawPhoneNumber) {
 print("'\(rawPhoneNumber)' => '\(formattedPhoneNumber)'")
 }
 else {
 print("'\(rawPhoneNumber)' => nil")
 }
 }
 
 
 */
