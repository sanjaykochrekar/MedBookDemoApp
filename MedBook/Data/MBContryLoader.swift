//
//  MBContryLoader.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//
import Foundation



struct MBContryLoader {
    
    static func loadContryList() -> [MBContry] {
        if let url = Bundle.main.url(forResource: "countries", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let resp = try decoder.decode(MBContryListDataModel.self, from: data)
                return resp.data.sorted { $0.country < $1.country }
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
    
}

