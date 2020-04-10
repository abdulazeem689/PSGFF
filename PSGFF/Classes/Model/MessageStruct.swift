//
//  MessageStruct.swift
//  PSGFF
//
//  Created by Abdul Azeem on 05/02/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import Foundation

struct MessageStruct: Codable{
    let data: [MessageData]?
}

struct MessageData: Codable{
    let title: String?
    let description: String?
}
