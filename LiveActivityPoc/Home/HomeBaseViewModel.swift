//
//  HomeBaseViewModel.swift
//  LiveActivityPoc
//
//  Created by Ritik Sharma on 24/06/23.
//

import Foundation

class HomeBaseViewModel {
    
    public var dataSource: HomeData?
    public var delegate: HomeViewModelProtocol?
    
    private let apiUrl: String = "https://demo4627632.mockable.io/LiveActivityPoc"
    
    public init() { }
    
    public func fetchHomeBaseData() {
        
        var urlReq = URLRequest(url: URL(string: self.apiUrl)!)
        urlReq.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: urlReq, completionHandler: {
            (data, response, error) in

            if let data,
               let model = try? JSONDecoder().decode(HomeData.self, from: data) {
                self.dataSource = model
                DispatchQueue.main.async {
                    self.delegate?.updateHomeData()
                }
            }
            
        }).resume()
    }
}
