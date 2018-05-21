//
//  IconSizes.swift
//  Iconly
//
//  Created by Balazs Vincze on 2018. 05. 21..
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

struct IconSizes {
    static let tabBarCircularIconSizes = ["25@3x": NSSize(width: 75, height: 75), "18@3x": NSSize(width: 54, height: 54),
                                          "25@2x": NSSize(width: 50, height: 50), "18@2x": NSSize(width: 36, height: 36)]
    
    static let tabBarSquareIconSizes = ["23@3x": NSSize(width: 69, height: 69), "17@3x": NSSize(width: 51, height: 51),
                                        "23@2x": NSSize(width: 46, height: 46), "17@2x": NSSize(width: 34, height: 34)]
    
    static let appIconSizes = ["1024@1x": NSSize(width: 1024, height: 1024),
                               "83.5@2x": NSSize(width: 167, height: 167),
                               "76@2x": NSSize(width: 152, height: 152),"76@1x": NSSize(width: 76, height: 76),
                               "60@3x": NSSize(width: 180, height: 180), "60@2x": NSSize(width: 120, height: 120),
                               "40@3x": NSSize(width: 120, height: 120),"40@2x": NSSize(width: 80, height: 80),"40@1x": NSSize(width: 40, height: 40),
                               "29@3x": NSSize(width: 87, height: 87),"29@2x": NSSize(width: 58, height: 58),"29@1x": NSSize(width: 29, height: 29),
                               "20@3x": NSSize(width: 60, height: 60),"20@2x": NSSize(width: 40, height: 40),"20@1x": NSSize(width: 20, height: 20)]
    
    static let navBarIconSizes = ["24@3x": NSSize(width: 72, height: 72), "24@2x": NSSize(width: 48, height: 48)]
}
