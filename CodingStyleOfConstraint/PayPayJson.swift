//
//  paypay.swift
//  CodingStyleOfConstraint
//
//  Created by TBCASoft-Bennett on 2022/5/5.
//

import Foundation

// 遵從 Protocol Codable 基本型態
// Int String Double Float Bool Data Array Dictionary URL Date
struct PayPayJson: Codable {
    var paypay: ObjectClass
}

struct ObjectClass: Codable {
    var UIView: ObjectProperty?
    var UILabel: ObjectProperty?
    var UIImageView: ObjectProperty?
    var UIButton: ObjectProperty?
}

struct ObjectProperty: Codable {
    var name: String?
    var arg1: String?
    var arg2: String?
    var arg3: String?
    var child: [ObjectClass]?
}


