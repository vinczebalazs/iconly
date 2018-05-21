//
//  IconGenerator.swift
//  Iconly
//
//  Created by Balazs Vincze on 2018. 05. 20..
//  Copyright © 2018. Balazs Vincze. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import AppKit

struct IconGenerator {
    
    // - MARK: Stored properties
    
    private let iconMode: IconMode
    private let imagePath: URL
    private let imageName: String
    private let exportPath: URL
    
    // - MARK: Dynamic properties
    
    /// The icon sizes to use based on the set `iconMode`.
    private var iconSizes: [String: NSSize] {
        switch iconMode {
        case .tabBarSquareIcon:
            return IconSizes.tabBarSquareIconSizes
        case .tabBarCircularIcon:
            return IconSizes.tabBarCircularIconSizes
        case .appIcon:
            return IconSizes.appIconSizes
        case .navBarIcon:
            return IconSizes.navBarIconSizes
        }
    }
    
    // - MARK: Initialization
    
    init?(mode: IconMode, imageName: String, imagePath: URL) {
        // Create export path on the Desktop.
        do {
            try exportPath = FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("\(imageName) icons", isDirectory: true)
        } catch {
            return nil
        }
        
        // Create directory at the export path generated above.
        do {
            try FileManager.default.createDirectory(atPath: exportPath.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            return nil
        }
    
        // Initialize stored properties.
        self.iconMode = mode
        self.imagePath = imagePath
        self.imageName = imageName
    }
    
    // - MARK: Icon generation
    
    /// Generate the icons
    func generateIcons() {
        // Read the image from the passed in path.
        guard let image = NSImage(contentsOf: imagePath) else {
            print("Could not read input icon.")
            return
        }
        
        print("🤞 Hold tight...")
    
        for (name, size) in iconSizes {
            // Resize the icon and return it as data.
            guard let pngData = image.resize(to: size) else {
                print("Could not resize icon.")
                return
            }
            
            // Save the icon to file.
            do {
                try pngData.write(to: exportPath.appendingPathComponent("\(name).png"))
            } catch {
                print("Error generating icons.")
                return
            }
        }
        
        print("Finished generating icons! 🎉 🍾")
    }
}
