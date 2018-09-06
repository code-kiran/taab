//
//  ArticlesObject.swift
//  taab
//
//  Created by kiran on 9/4/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class ArticlesObject: NSObject {
    
    var titleHeading: String?
    var desc: String?
    var author: Author?
    var url: String?
    var imageToUrl: String?
    var pubishedAt: Date?
}

class Author: NSObject {
    var id: String?
    var name: String?

}
