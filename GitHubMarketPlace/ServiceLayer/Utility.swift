//
//  Utility.swift
//  GitHubMarketPlace
//
//  Created by Santhosh kumar on 9/19/19.
//  Copyright © 2019 santhosh. All rights reserved.
//

import Foundation


class Utility {
    static let shared: Utility = Utility()
    
    private init() { }
    
    var cache: [String: Int] = [String: Int]()
    
}
