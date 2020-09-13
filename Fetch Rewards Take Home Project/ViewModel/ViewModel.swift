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
        Client.fetchData() { (applicants1) in
            self.applicants = applicants1
            self.removeApplicantsWithEmptyNames()
            self.sortListIdByName()
            completion()
        }
    }

    func removeApplicantsWithEmptyNames() {
        applicants = applicants.filter { $0.name?.isEmpty == false && $0.name != nil }
    }

    func concatenateListIdName(_ applicant: Applicant) -> String {
        guard let name = applicant.name else { return "" }
        return "\(String(applicant.listId) + name)"
    }

    func sortListIdByName() {
        applicants = applicants.sorted { concatenateListIdName($0).compare(concatenateListIdName($1), options: .numeric) == .orderedAscending }
    }
}
