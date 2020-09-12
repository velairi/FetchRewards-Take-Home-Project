//
//  ViewModel.swift
//  Fetch Rewards Take Home Project
//
//  Created by Valerie Don on 9/8/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import Foundation

class ViewModel {

    var applicants = [Applicant]()

    func fetchData(completion: @escaping () -> Void) {
        //populate applicants
        Client.fetchData() { (applicants) in
            self.applicants = applicants
            self.sortByListID()
            completion()
        }
    }

    func sortByListID() {
        //check if this works
        applicants.sort { $0.listId < $1.listId }
    }

    func sortByName() {
        //if name is nil, then don't use
        //after "Item", and the digit is smaller, then
        var names = [String]()
        for applicant in applicants {
            if let name = applicant.name {
                names.append(name)
            }
        }
        names.sort { $0 < $1 }
    }
}
