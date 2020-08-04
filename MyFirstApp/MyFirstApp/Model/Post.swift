//
//  Post.swift
//  MyFirstApp
//
//  Created by jorgemht on 04/08/2020.
//  Copyright © 2020 jorgemht. All rights reserved.
//

import Foundation

struct Post : Codable, Identifiable{
    public var userId: Int
    public var id: Int
    public var title: String
    public var body: String
}
