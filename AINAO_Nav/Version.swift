//  Version.swift
//  AINAO Nav
//
//  Created by FrancoisW on 25/06/2024.

import Foundation
struct VersionInfo {
    let version: String
    let description: String
}

struct VersionHistory {
    static let current =
    VersionInfo(version: "0.0.5", description: "2024 19th : Few modifications, just git testing petit test. Bon la vraiment j'essaie")

    static let history: [VersionInfo] = [
        VersionInfo(version: "0.0.1", description: "2024 June 7th, Creation "),
        VersionInfo(version: "0.0.2", description: "2024 June 16th, Integration of Map and markers, creation of UserProfile and Placemark"),
        VersionInfo(version: "0.0.3", description: "2024 Re created branch after fatal error"),
        VersionInfo(version: "0.0.4", description: "2024 First version put in Git")


   ]
    
    static func getVersionDescription(for version: String) -> String? {
        return history.first(where: { $0.version == version })?.description
    }
}
