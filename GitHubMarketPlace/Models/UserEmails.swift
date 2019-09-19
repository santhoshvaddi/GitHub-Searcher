//
//  UserEmails.swift
//  GitHubMarketPlace
//
//  Created by Santhosh kumar on 9/19/19.
//  Copyright © 2019 santhosh. All rights reserved.
//

import Foundation


struct UserEmails: Codable {
    var email: String
    var verified: Bool
    var primary: Bool
    var visibility: String
}
