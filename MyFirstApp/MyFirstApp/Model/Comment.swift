//
//  Comment.swift
//  MyFirstApp
//
//  Created by jorgemht on 04/08/2020.
//  Copyright © 2020 jorgemht. All rights reserved.
//

import Foundation

struct Comment : Codable, Identifiable{
    public var postId: Int
    public var id: Int
    public var name: String
    public var email: String
    public var body: String
}
