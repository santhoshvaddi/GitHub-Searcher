//
//  UsersTableViewCell.swift
//  GitHubMarketPlace
//
//  Created by Santhosh kumar on 9/17/19.
//  Copyright © 2019 santhosh. All rights reserved.
//

import Foundation

struct UsersResponseModel : Codable {
	let total_count : Int?
	let incomplete_results : Bool?
	let items : [Users]?

	enum CodingKeys: String, CodingKey {

		case total_count = "total_count"
		case incomplete_results = "incomplete_results"
		case items = "items"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		total_count = try values.decodeIfPresent(Int.self, forKey: .total_count)
		incomplete_results = try values.decodeIfPresent(Bool.self, forKey: .incomplete_results)
		items = try values.decodeIfPresent([Users].self, forKey: .items)
	}

}
