//
//  QuestionStruct.swift
//  Quiz App
//
//  Created by itss on 29/11/19.
//  Copyright © 2019 itss. All rights reserved.
//

import Foundation

enum OptionChoice {
    case one
    case two
    case three
    case four
}

struct Question {
    var questionStatement : String
    var optionA : String
    var optionB : String
    var optionC : String
    var optionD : String
    var correctOption : OptionChoice
    var answeredCorrectly : Bool
}
