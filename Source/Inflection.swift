//
//  Inflection.swift
//  Inflection
//
//  Created by Christoffer Winterkvist on 3/2/15.
//
//

import Foundation

public extension NSDictionary {
    
    func swiftCase() -> NSDictionary {
        return self.inflectDictionaryKeys({ (string) -> String in string.swiftCase()})
    }
    
    func rubyCase() -> NSDictionary {
        return self.inflectDictionaryKeys({ (string) -> String in string.rubyCase()}) as NSDictionary
    }
    
    private func inflectDictionaryKeys(closure: (string: String) -> String) -> NSDictionary {

        let newDictionary = NSMutableDictionary.new()
        map(self) { newDictionary[closure(string: $0 as! String)] = $1 }

        return newDictionary
    }
    
}

public extension String {
    
    func camelCase() -> String {
        return self.replaceIdentifierWithString("").lowerCaseFirstLetter()
    }
    
    func classify() -> String {
        return self.upperCamelCase()
    }
    
    func dashedCase() -> String {
        return self.lowerCaseFirstLetter().replaceIdentifierWithString("-")
    }
    
    func dotNetCase() -> String {
        return self.upperCamelCase()
    }
    
    func javascriptCase() -> String {
        return self.replaceIdentifierWithString("").lowerCaseFirstLetter()
    }
    
    func lispCase() -> String {
        return self.dashedCase()
    }
    
    func objcCase() -> String {
        return self.camelCase()
    }
    
    func pythonCase() -> String {
        return self.snakeCase()
    }
    
    func snakeCase() -> String {
        return self.underscoreCase()
    }
    
    func swiftCase() -> String {
        return self.camelCase()
    }
    
    func underscoreCase() -> String {
        return (self.lowerCaseFirstLetter() as String).replaceIdentifierWithString("_")
    }
    
    func upperCamelCase() -> String {
        return self.camelCase().upperCamelCase()
    }
    
    func rubyCase () -> String {
        return self.snakeCase()
    }
    
    func humanize() -> String {
        return self.replaceIdentifierWithString(" ").capitalizedString
    }
    
    private func lowerCaseFirstLetter() -> String {
        var mutableString = self.mutableCopy() as! NSMutableString
        mutableString.replaceCharactersInRange(NSMakeRange(0, 1), withString: self.firstLetter().lowercaseString as String)

        return mutableString.copy() as! String
    }
    
    private func upperCaseFirstLetter() -> String {
        var mutableString = self.mutableCopy() as! NSMutableString
        mutableString.replaceCharactersInRange(NSMakeRange(0, 1), withString: self.firstLetter().uppercaseString as String)
        
        return mutableString.copy() as! String
    }
    
    private func firstLetter() -> String {
        return (self as NSString).substringToIndex(1) as String
    }
    
    private func replaceIdentifierWithString(identifier: String) -> String {

        let scanner = NSScanner.init(string: self)
        let identifierSet = NSCharacterSet.init(charactersInString: identifier)
        let alphaNumericSet = NSCharacterSet.alphanumericCharacterSet()
        let uppercaseSet = NSCharacterSet.uppercaseLetterCharacterSet()
        let lowercaseSet = NSCharacterSet.lowercaseLetterCharacterSet()
        
        var buffer: NSString?
        var output: NSMutableString = NSMutableString.new()

        scanner.caseSensitive = true
        
        while !scanner.atEnd {
            if scanner.scanCharactersFromSet(identifierSet, intoString: &buffer) {
                continue
            } else if count(identifier) > 0 {
                var isUppercase: Bool = scanner.scanCharactersFromSet(uppercaseSet, intoString: &buffer)
                if isUppercase {
                    output.appendString(identifier)
                    output.appendString(buffer!.lowercaseString)
                }
                
                var isLowercase: Bool = scanner.scanCharactersFromSet(lowercaseSet, intoString: &buffer)
                if isLowercase {
                    output.appendString(buffer!.lowercaseString)
                }
            } else if scanner.scanCharactersFromSet(alphaNumericSet, intoString: &buffer) {
                output.appendString(buffer!.capitalizedString)
            } else {
                scanner.scanLocation = scanner.scanLocation + 1
            }
            
        }

        return output.copy() as! String
    }
    
}