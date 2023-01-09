//
//  ZodiacSingProtocol.swift
//  Messenger
//
//  Created by Swift Learning on 09.01.2023.
//

import Foundation

protocol ZodiacSingProtocol {
    func getZodiacSign(_ date: Date) -> String
}

extension ZodiacSingProtocol {
    func getZodiacSign(_ date: Date) -> String {

        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)

        switch (day,month) {
        case (21...31,1),(1...19,2):
            return "aquarius"
        case (20...29,2),(1...20,3):
            return "pisces"
        case (21...31,3),(1...20,4):
            return "aries"
        case (21...30,4),(1...21,5):
            return "taurus"
        case (22...31,5),(1...21,6):
            return "gemini"
        case (22...30,6),(1...22,7):
            return "cancer"
        case (23...31,7),(1...22,8):
            return "leo"
        case (23...31,8),(1...23,9):
            return "virgo"
        case (24...30,9),(1...23,10):
            return "libra"
        case (24...31,10),(1...22,11):
            return "scorpio"
        case (23...30,11),(1...21,12):
            return "sagittarius"
        default:
            return "capricorn"
        }
    }
}
