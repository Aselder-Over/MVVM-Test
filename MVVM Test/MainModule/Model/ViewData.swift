//
//  ViewData.swift
//  MVVM Test
//
//  Created by Асельдер on 13.08.2020.
//  Copyright © 2020 Асельдер. All rights reserved.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let discription: String?
        let numberPhone: String?
    }
}
