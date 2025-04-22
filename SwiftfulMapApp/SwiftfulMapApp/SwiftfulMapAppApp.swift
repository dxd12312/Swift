//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by NEP on 2025/4/22.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
