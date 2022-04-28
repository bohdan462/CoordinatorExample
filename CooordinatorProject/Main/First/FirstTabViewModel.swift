//
//  FirstTabViewModel.swift
//  CooordinatorProject
//
//  Created by Bohdan Tkachenko on 4/27/22.
//

import Foundation

class FirstTabViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
}
