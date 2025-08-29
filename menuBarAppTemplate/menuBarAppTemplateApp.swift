//
//  menuBarAppTemplateApp.swift
//  menuBarAppTemplate
//

/// **MAKE SURE TO CHANGE THE BUNDLE IDENTIFIER** in `[project]/[target]/Signing & Capabilities/Signing`

import SwiftUI

@main
struct menuBarAppTemplateApp: App {
    var body: some Scene {
        MenuBarExtra { //Menu bar extra (menu bar app) instead of window group
            VStack {
                ContentView() // UI goes here
                Button("Quit") {//quit button, you can move this into another view if you like. If you don't include a quit button and your app is set not to appear in Dock, the user's only option to quit the app (to my knowledge) is through Activity Monitor, which is not very good for your user experience
                    NSApplication.shared.terminate(self) //this is the best way to programatically quit a MacOS application. It will initiate the standard app termination process.
                }
            }
            .padding()
        } label: {
            Label("Menu Bar App", systemImage: "app.grid") //This is what appears in the menu bar (in this case, `app.grid` is the icon in the menu bar, and the text "Menu Bar App" is the accesibility label
        }.menuBarExtraStyle(.window) //.window preserves UI layout, .menu is just a dropdown menu (like right clicking)
    }
}

/*
 Two things make this a menu bar app:
 
 1. `MenuBarExtra` is the core of a menu bar app; it puts the UI in the menu bar instead of a normal floating window. https://developer.apple.com/documentation/SwiftUI/MenuBarExtra
 
 2. In `Info.plist`, we change the `INFOPLIST_KEY_LSUIElement` tag to `YES`; this removes the app from the Dock so that only the menu bar app is showing. You can reset this value to `NO` if you want your app to show up in the Dock as well as the menu bar.
    (You can find this in `Project > Target > Build Settings` under 'Application is Agent (UIElement)' if you don't want to mess with the `Info.plist` file itself.)
    https://developer.apple.com/documentation/bundleresources/information-property-list/lsuielement

 */
