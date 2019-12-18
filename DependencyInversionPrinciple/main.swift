//
//  main.swift
//  DependencyInversionPrinciple
//
//  Created by Cahyanto Setya Budi on 18/12/19.
//  Copyright © 2019 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

protocol RelationshipBrowser {
    func findAllChildrenOf(_ name: String) -> [Person]
}

enum Relationship {
    case parent
    case child
    case sibling
}

class Person {
    var name = ""
    
    init(_ name: String) {
        self.name = name
    }
}

class Relationships: RelationshipBrowser {
    var relations = [(Person, Relationship, Person)]()
    
    func addParentAndChild(_ p: Person, _ c: Person) {
        relations.append((p, .parent, c))
        relations.append((c, .child, p))
    }
    
    func findAllChildrenOf(_ name: String) -> [Person] {
        return relations.filter{ $0.name == name && $1 == .parent && $2 === $2}
            .map{ $2 }
    }
}

class Research {
    init(_ browser: RelationshipBrowser) {
        browser.findAllChildrenOf("Cahyanto")
            .forEach { (person) in
                print("Cahyanto has a child called \(person.name)")
            }
    }
}

let parent = Person("Cahyanto")
let child1 = Person("Setya")
let child2 = Person("Budi")

let relationships = Relationships()
relationships.addParentAndChild(parent, child1)
relationships.addParentAndChild(parent, child2)

let _ = Research(relationships)
