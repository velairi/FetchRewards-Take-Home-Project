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
        Client.fetchData() { (applicants1) in
            self.applicants = applicants1
            self.removeApplicantsWithEmptyNames()
            self.sortByListID()
            completion()
        }
    }

    func removeApplicantsWithEmptyNames() {
        applicants = applicants.filter { $0.name?.isEmpty == false && $0.name != nil }
    }

    func sortByListID() {
        applicants.sort { $0.listId < $1.listId }
    }

    func sortListIdByName() {

    }
}
