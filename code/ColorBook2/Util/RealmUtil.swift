//
//  SaveImage.swift
//  ColorBook2
//
//  Created by Shuqin Lee on 10/01/2018.
//  Copyright © 2018 Shuqin Lee. All rights reserved.
//

import UIKit
import RealmSwift
import Realm.Private

import Foundation
import Realm
import Realm.Private

class RealmUtil {
    
    // saving
    class func saveSingleBook(book: Book) {
        // Get the default Realm
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        // Persist your data easily
        realm.beginWrite()
        realm.add(book)
        try! realm.commitWrite()
    }
    
    class func saveBookList(bookList: [Book]) {
        // Get the default Realm
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        // Persist your data easily
        realm.beginWrite()
        realm.add(bookList, update: true)
        try! realm.commitWrite()
    }
    
    class func saveBookList(bookList: Results<Book>) {
        // Get the default Realm
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        // Persist your data easily
        realm.beginWrite()
        realm.add(bookList)
        try! realm.commitWrite()
    }
    
    class func saveSinglePainting(painting: Painting) {
        // Get the default Realm
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        // Persist your data easily
        realm.beginWrite()
        realm.add(painting)
        try! realm.commitWrite()
    }
    
    class func savePaintingList(paintingList: [Painting]) {
        // Get the default Realm
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        // Persist your data easily
        realm.beginWrite()
        realm.add(paintingList)
        try! realm.commitWrite()
    }
    
    class func savePaintingList(paintingList: Results<Painting>) {
        // Get the default Realm
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        // Persist your data easily
        realm.beginWrite()
        realm.add(paintingList)
        try! realm.commitWrite()
    }
    
    // MARK: - fetching
    class func fetchBookList() -> Results<Book> {
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        return realm.objects(Book.self)
    }
    
    func fetchPaintingList() -> Results<Painting> {
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        return realm.objects(Painting.self)
    }
    
    // MARK: - deleting
    class func deletePaintingList(paintingList: List<Painting>) {
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        realm.delete(paintingList)
    }
    
    // to test
    class func deleteBookList(bookList: List<Book>) {
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        for book in bookList {
            deletePaintingList(paintingList: book.paintingList)
        }
        realm.delete(bookList)
    }
    
    // MARK: - increment
    class func incrementID<Element: Object>(_ type: Element.Type) -> Int {
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        return (realm.objects(type).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    // MARK: - general
    class func realmStmt(callback: () -> ()) {
        let realm = try! Realm(configuration: Config.REALM_CONFIG)
        realm.beginWrite()
        callback()
        try! realm.commitWrite()
    }
}
