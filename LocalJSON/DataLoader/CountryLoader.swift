//
//  CountryLoader.swift
//  LocalJSON
//
//  Created by Belal medhat on 8/7/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
class CountryLoader {
    static var shared:CountryLoader = CountryLoader()
    private var Countries = [CountryData]()
    private init(){
        ReadJsonFile()
    }
    private func ReadJsonFile(){
       do {
        if let bundlePath = Bundle.main.url(forResource: "Country", withExtension: "json") {
            let data = try Data(contentsOf: bundlePath)
            let pars = try JSONDecoder().decode([CountryData].self, from: data)
            self.Countries = pars
            }
       } catch {
           print(error)
       }
    }
    
    func returnCountries() -> [CountryData]{
        self.Countries
    }
}
