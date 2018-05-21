//
//  InputHelper.swift
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

struct InputHelper {
    // Typealias for the arguments tuple
    typealias Arguments = (IconMode,String,URL)
    
    static func readArguments() -> Arguments? {
        // Return nil if there are not enough arguments passed in.
        if CommandLine.argc != 4 {
            return nil
        }
        
        // Get the mode from the passed in arguments.
        guard let mode = IconMode(rawValue: CommandLine.arguments[1]) else {
            return nil
        }

        return (mode, CommandLine.arguments[2], URL(fileURLWithPath: CommandLine.arguments[3]))
    }
    
    /// Print usage to standard output
    static func printUsage() {
        print("""
🚸 Usage:

tabc name path  - Create tab bar icons out of a rather rounded looking icon.
tabs name path - Create tab bar icons out of a rather squary looking icon.
app name path - Create app icons out of an icon.
nav name path - Create navigation bar icons out of an icon.

❕ argument name - The name of your icon.
❕ argument path - The path to the original image.

""")
    }
    
}
