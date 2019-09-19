//
//  ReposTableViewCell.swift
//  GitHubMarketPlace
//
//  Created by Santhosh kumar on 9/19/19.
//  Copyright © 2019 santhosh. All rights reserved.
//

import UIKit

class ReposTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var forkLbl: UILabel!
    @IBOutlet weak var startsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(repo: RepositoryResponseModel) {
        repoNameLbl.text = repo.name
        forkLbl.text = "Forks: \(repo.forks_count ?? 0)"
    }
}
