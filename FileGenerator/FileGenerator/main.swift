//
//  main.swift
//  FileGenerator
//
//  Created by Paul Taykalo on 10/3/19.
//  Copyright © 2019 MacPaw. All rights reserved.
//

import Foundation

let swiftTemplate = """

class CLASSNAME {

  func isUsed
}
"""

let FILES_COUNT = 1000
let CONNECTED_FILES = 2

var connectivity: [Int: [Int]] = [:]
for c in 0..<FILES_COUNT {
    connectivity[c] = []
}

for i in 0..<FILES_COUNT {
    // connect two other classes in each class
    (0..<CONNECTED_FILES).forEach { _ in
        connectivity[i]?.append(Int(arc4random()) % FILES_COUNT)
    }
}


// Generate files

func getClassName(for index: Int) -> String {
    return "AwesomeClass\(index)"
}

func getClassName(for `class`: Int, dep: Int) -> String {
    return getClassName(for: connectivity[`class`]![dep])
}

try? FileManager.default.createDirectory(atPath: "swift", withIntermediateDirectories: true, attributes: nil)
try? FileManager.default.createDirectory(atPath: "objc", withIntermediateDirectories: true, attributes: nil)

for i in 0..<FILES_COUNT {

    // Swift
    let className = getClassName(for: i)
    let filename = "\(className).swift"

    let contents = """
    class \(className) {
       func complexLogic() -> Bool {
           if \(getClassName(for: i, dep: 0))().complexLogic() {
               return \(getClassName(for: i, dep: 1))().complexLogic()
           }
           else
           {
               return false
           }
       }

       func printDependentItems() -> String {
          return "\\(\(getClassName(for: i, dep: 0))()),\\(\(getClassName(for: i, dep: 1))())"
       }
    }
    """

    try contents.write(toFile: "swift/" + filename, atomically: true, encoding: .utf8)


    // Objc
    let headerFile = "\(className).h"
    let headerContents = """
    @import Foundation;
    @interface \(className): NSObject
    - (BOOL)complexLogic;
    - (NSString *)printDependentItems;
    @end
    """
    try headerContents.write(toFile: "objc/" + headerFile, atomically: true, encoding: .utf8)


    let impFile = "\(className).m"
    let impContents = """
    #import "\(className).h"
    #import "\(getClassName(for: i, dep: 0)).h"
    #import "\(getClassName(for: i, dep: 1)).h"
    @implementation \(className)
    - (BOOL)complexLogic
    {
    if ([\(getClassName(for: i, dep: 0)).new complexLogic]) {
            return [\(getClassName(for: i, dep: 1)).new complexLogic];
        }
        else
        {
            return NO;
        }
    };
    - (NSString *)printDependentItems
    {
       return [NSString stringWithFormat:@"%@, %@", \(getClassName(for: i, dep: 0)).new, \(getClassName(for: i, dep: 1)).new];
    }
    @end
    """
    try impContents.write(toFile: "objc/" + impFile, atomically: true, encoding: .utf8)



}

//let usage = [AwesomeClass0().printDependentItems(), AwesomeClass1().printDependentItems()]

//print(usage.map { $0.})
