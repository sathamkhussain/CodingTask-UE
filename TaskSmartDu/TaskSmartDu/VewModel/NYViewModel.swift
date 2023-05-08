//
//  NYViewModel.swift
//  TaskSmartDu
//
//  Created by Satham Hussain on 08/05/2023.
//

import Foundation

class NYViewModel {
    @Published var newsData : NYTimesData?
    func fetchNews() async {
        do{
            let  newsList = try await APIService.fetchMostViewedNews()
            DispatchQueue.main.async {
                self.newsData = newsList
            }
        }catch{
            print("Something bad happened \(error)")
        }
    }
}
