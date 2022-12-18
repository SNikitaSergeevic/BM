//
//  Token+CoreDataProperties.swift
//  BM
//
//  Created by NikitaSergeevich on 09/11/2022.
//
//

import Foundation
import CoreData

enum DecoderConfiguratorError: Error {
    case missingManagedObjectContext
}

extension CodingUserInfoKey {
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}


@objc(Token)
public class Token: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case value = "value"
        case user = "user"
    }
    
    public static var managedObjectContext: NSManagedObjectContext?
    
    required public convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfiguratorError.missingManagedObjectContext
        }
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(String.self, forKey: .value)
        self.user = try container.decode(String.self, forKey: .user)
        
    }
}



extension Token {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Token> {
        return NSFetchRequest<Token>(entityName: "Token")
    }
    
    @NSManaged public var value: String
    @NSManaged public var user: String
    
}

extension Token : Identifiable {
    
}
