//
//  ProductListViewController.swift
//  Products with MVVM
//
//  Created by Abhishek on 01/08/25.
//

import UIKit

class ProductListViewController: UIViewController {

    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}

extension ProductListViewController {
    
    func configuration() {
        observeEvent()
        initViewModel()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    // Data Binding event obeserver - communication
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                // show indicator
                print("Product loading....")
            case .stopLoading:
                // hide indicator
                print("Stop loading....")
            case .dataLoaded:
                print("Data loaded....")
                print(self.viewModel.products)
            case .error(let error):
                print(error)
            }
        }
    }
}
