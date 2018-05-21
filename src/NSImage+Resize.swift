//
//  NSImage+Resize.swift
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

extension NSImage {
    /// Return a resized PNG image while preserving the current aspect ratio.
    func resize(to targetSize: NSSize) -> Data? {
        // Warn user if image is smaller than the target size.
        if size.height < targetSize.height || size.width < targetSize.width {
            print("⚠️ Original image is smaller than the target size, quality may be distorted!")
        }
        var newSize = NSSize()
        if size.height > size.width {
            newSize.height = targetSize.height
            newSize.width = size.width * (targetSize.height/size.height)
        } else {
            newSize.width = targetSize.width
            newSize.height = size.height * (targetSize.width/size.width)
        }
        
        let frame = NSRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        guard let representation = bestRepresentation(for: frame, context: nil, hints: nil) else {
            return nil
        }
        let newImage = NSImage(size: newSize, flipped: false, drawingHandler: { (_) -> Bool in
            return representation.draw(in: frame)
        })
        
        guard let newTiffRepresentation = newImage.tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: newTiffRepresentation) else {
            return nil
        }
        
        return bitmapImage.representation(using: .png, properties: [:])
    }
}
