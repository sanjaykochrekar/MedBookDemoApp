//
//  MBContryDataModel.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import Foundation


struct MBContry {
    let code: String
    let country: String
    let region: String
}


// MARK: - MBContryListDataModel
struct MBContryListDataModel: Decodable {
    let status: String
    let statusCode: Int
    let version, access: String
    let data: [MBContry]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        self.statusCode = try container.decode(Int.self, forKey: .statusCode)
        self.version = try container.decode(String.self, forKey: .version)
        self.access = try container.decode(String.self, forKey: .access)
        let list = try container.decode([String : MBCountryItem].self, forKey: .data)
        
        self.data = list.compactMap({ item in
            return MBContry(code: item.key, country: item.value.country, region: item.value.country)
        })
        
    }

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status-code"
        case version
        case access
        case data
    }
}

// MARK: - Datum
struct MBCountryItem: Decodable {
    let country: String
    let region: String
}

