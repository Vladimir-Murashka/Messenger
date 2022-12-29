//
//  CheckCodeViewOutput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol CheckCodeViewOutput: AnyObject {
    func didUserFinishEnter(code: String)
}
