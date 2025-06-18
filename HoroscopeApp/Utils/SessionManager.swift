//
//  SessionManager.swift
//  HoroscopeApp
//
//  Created by Mañanas on 18/6/25.
//

import Foundation

class SessionManager {
    
    static func setFavoriteHoroscope(id: String) {
        UserDefaults.standard.set(id, forKey: "FAVORITE_HOROSCOPE")
    }
    
    static func getFavoriteHoroscope() -> String {
        return UserDefaults.standard.string(forKey: "FAVORITE_HOROSCOPE") ?? ""
    }
    
    static func isFavoriteHoroscope(id: String) -> Bool {
        return getFavoriteHoroscope() == id
    }
}
