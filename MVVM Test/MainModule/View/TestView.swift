//
//  CreateItemVC.swift
//  MVVM Test
//
//  Created by Асельдер on 13.08.2020.
//  Copyright © 2020 Асельдер. All rights reserved.
//

import UIKit

class TestView: UIView {
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var imageView = makeImageView()
    lazy var titleLabel = makeTitleLabel()
    lazy var activityIndicator = makeActivityViewIndicator()
    lazy var discriptionLabel = makeDiscriptionLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        switch viewData {
            
        case .initial:
            update(viewData: nil, isHidden: true)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            
        case .success(let success):
            update(viewData: success, isHidden: false)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
    
    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        imageView.image = UIImage(named: viewData?.icon ?? " ")
        titleLabel.text = viewData?.title
        discriptionLabel.text = viewData?.discription
        titleLabel.isHidden = isHidden
        discriptionLabel.isHidden = isHidden
        imageView.isHidden = isHidden
    }
}
