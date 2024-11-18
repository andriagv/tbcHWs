//
//  User.swift
//  UsersTesting
//
//  Created by Nino Godziashvili on 15.11.24.
//

import UIKit
import Foundation

struct UserList: Codable {
    let results: [User]
}

struct User: Codable {
    let gender: String
    let name: Name
    let email: String
    let picture: Picture
    let nat: String
    let cell: String
    let phone: String
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

extension User {
    public static var jsonMock: String {
       """
       {
         "results": [
           {
             "gender": "male",
             "name": {
               "title": "Mr",
               "first": "Christian",
               "last": "Nielsen"
             },
             "location": {
               "street": {
                 "number": 6501,
                 "name": "Højmarksvej"
               },
               "city": "Odense Sv",
               "state": "Syddanmark",
               "country": "Denmark",
               "postcode": 98814,
               "coordinates": {
                 "latitude": "-40.9697",
                 "longitude": "-29.6490"
               },
               "timezone": {
                 "offset": "+5:00",
                 "description": "Ekaterinburg, Islamabad, Karachi, Tashkent"
               }
             },
             "email": "christian.nielsen@example.com",
             "login": {
               "uuid": "39ba59ff-c73e-45a3-9acc-4ec48c451660",
               "username": "smallpeacock360",
               "password": "pentium",
               "salt": "VDn3xOmw",
               "md5": "d5fdf4781bc2988fee4bc273dee6c6c3",
               "sha1": "c61e4e96896528d398d2be010fed0fe861fd564a",
               "sha256": "8f79b629857933b32bf692434d360e4e13efc696b9c1558571b0563226fd45e7"
             },
             "dob": {
               "date": "1996-08-18T16:54:46.213Z",
               "age": 28
             },
             "registered": {
               "date": "2017-09-07T01:04:37.102Z",
               "age": 7
             },
             "phone": "57231440",
             "cell": "85537737",
             "id": {
               "name": "CPR",
               "value": "180896-8782"
             },
             "picture": {
               "large": "https://randomuser.me/api/portraits/men/25.jpg",
               "medium": "https://randomuser.me/api/portraits/med/men/25.jpg",
               "thumbnail": "https://randomuser.me/api/portraits/thumb/men/25.jpg"
             },
             "nat": "DK"
           }
         ],
         "info": {
           "seed": "679517541f0f3194",
           "results": 1,
           "page": 1,
           "version": "1.4"
         }
       }
       """
    }
}
