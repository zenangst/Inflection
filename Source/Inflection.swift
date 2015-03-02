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
        return self.inflectDictionaryKeys({ (string) -> NSString in string.swiftCase()})
    }
    
    func rubyCase() -> NSDictionary {
        return self.inflectDictionaryKeys({ (string) -> NSString in string.rubyCase()})
    }
    
    private func inflectDictionaryKeys(closure: (string: NSString) -> NSString) -> NSDictionary {
        let mutableDictionary = NSMutableDictionary.new()
        
        self.enumerateKeysAndObjectsUsingBlock { (keyString, value, stop) -> () in
            mutableDictionary[closure(string: keyString as! NSString)] = value
        }
        
        return mutableDictionary as NSDictionary
    }
    
}

public extension NSString {
    
    func camelCase() -> NSString {
        return self.replaceIdentifierWithString("").lowerCaseFirstLetter()
    }
    
    func classify() -> NSString {
        return self.upperCamelCase()
    }
    
    func dashedCase() -> NSString {
        return self.lowerCaseFirstLetter().replaceIdentifierWithString("-")
    }
    
    func dotNetCase() -> NSString {
        return self.upperCamelCase()
    }
    
    func javascriptCase() -> NSString {
        return self.replaceIdentifierWithString("").lowerCaseFirstLetter()
    }
    
    func lispCase() -> NSString {
        return self.dashedCase()
    }
    
    func objcCase() -> NSString {
        return self.camelCase()
    }
    
    func pythonCase() -> NSString {
        return self.snakeCase()
    }
    
    func snakeCase() -> NSString {
        return self.underscoreCase()
    }
    
    func swiftCase() -> NSString {
        return self.objcCase()
    }
    
    func underscoreCase() -> NSString {
        return self.lowerCaseFirstLetter().replaceIdentifierWithString("_")
    }
    
    func upperCamelCase() -> NSString {
        return self.camelCase().upperCamelCase()
    }
    
    func rubyCase () -> NSString {
        return self.snakeCase()
    }
    
    func humanize() -> NSString {
        return self.replaceIdentifierWithString(" ").capitalizedString
    }
    
    private func lowerCaseFirstLetter() -> NSString {
        var mutableString = self.mutableCopy() as! NSMutableString
        mutableString.replaceCharactersInRange(NSMakeRange(0, 1), withString: self.firstLetter().lowercaseString as String)
        
        return mutableString.copy() as! NSString
    }
    
    private func upperCaseFirstLetter() -> NSString {
        var mutableString = self.mutableCopy() as! NSMutableString
        mutableString.replaceCharactersInRange(NSMakeRange(0, 1), withString: self.firstLetter().uppercaseString as String)
        
        return mutableString.copy() as! NSString
    }
    
    private func firstLetter() -> NSString {
        return self.substringToIndex(1)
    }
    
    private func replaceIdentifierWithString(identifier: String) -> NSString {
        
        let scanner = NSScanner.init(string: self as! String)
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
        
        return output
    }
    
}