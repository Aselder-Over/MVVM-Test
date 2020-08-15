//
//  MainViewModel.swift
//  MVVM Test
//
//  Created by Асельдер on 13.08.2020.
//  Copyright © 2020 Асельдер. All rights reserved.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData)->())? { get set }
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        //start loading
        updateViewData?(.loading(ViewData.Data(icon: nil,
                                               title: nil,
                                               discription: nil,
                                               numberPhone: nil) ) )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [ weak self ] in
            self?.updateViewData?(.success(ViewData.Data(icon: "successPng",
                                                         title: "Success",
                                                         discription: "Life is good",
                                                         numberPhone: nil) ) )
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [ weak self ] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "failure",
                                                         title: "ERROR",
                                                         discription: "ERROR discription ahiha",
                                                         numberPhone: nil) ) )
        }
    }
}
