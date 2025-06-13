//
//  Horoscope.swift
//  HoroscopeApp
//
//  Created by Mañanas on 13/6/25.
//

import Foundation
import UIKit

struct Horoscope {
    let id: String
    let name: String
    let dates: String
    let imageFileName: String
    
    func getImage() -> UIImage {
        return UIImage(named: imageFileName)!
    }
    
    static let horoscopeList: [Horoscope] = [
        Horoscope(id: "aries", name: "Aries", dates: "March 21 to April 19", imageFileName: "horoscope-icons/aries"),
        Horoscope(id: "taurus", name: "Taurus", dates: "April 20 to May 20", imageFileName: "horoscope-icons/taurus"),
        Horoscope(id: "gemini", name: "Gemini", dates: "May 21 to June 20", imageFileName: "horoscope-icons/gemini"),
        Horoscope(id: "cancer", name: "Cancer", dates: "June 21 to July 22", imageFileName: "horoscope-icons/cancer"),
        Horoscope(id: "leo", name: "Leo", dates: "June 21 to July 22", imageFileName: "horoscope-icons/leo"),
        Horoscope(id: "virgo", name: "Virgo", dates: "August 23 to September 22", imageFileName: "horoscope-icons/virgo"),
        Horoscope(id: "libra", name: "Libra", dates: "September 23 to October 22", imageFileName: "horoscope-icons/libra"),
        Horoscope(id: "scorpio", name: "Scorpio", dates: "October 23 to November 21", imageFileName: "horoscope-icons/scorpio"),
        Horoscope(id: "sagittarius", name: "Sagittarius", dates: "November 22 to December 21", imageFileName: "horoscope-icons/sagittarius"),
        Horoscope(id: "capricorn", name: "Capricorn", dates: "December 22 to January 19", imageFileName: "horoscope-icons/capricorn"),
        Horoscope(id: "aquarius", name: "Aquarius", dates: "January 20 to February 18", imageFileName: "horoscope-icons/aquarius"),
        Horoscope(id: "pisces", name: "Pisces", dates: "February 19 to March 20", imageFileName: "horoscope-icons/pisces")
    ]
}
