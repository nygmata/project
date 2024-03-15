//
//  NotesRepository.swift
//  project
//
//  Created by Paul Nikulshin on 15.03.2024.
//

import UIKit
import CoreData

let weeks = 4
let days = 7
let times = ["6AM", "7AM", "8AM", "9AM", "10AM", "11AM", "12AM", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM", "7PM", "8PM", "9PM", "10PM", "11PM"]

let timeToIndex: [String: Int] = Dictionary(uniqueKeysWithValues: zip(times, 0...17))

protocol NotesRepositoryProtocol {
    init(id: Int)
    func getNotes() -> [CellEntity]
    func editNote(time: String, newDescription: String)
}

class NotesRepository: NotesRepositoryProtocol {
    var container: NSPersistentContainer!
    var context: NSManagedObjectContext!
    var id: Int = 0
    
    required init(id: Int) {
        print(id)
        self.id = id
        initContainerAndContext()
        initCells()
    }
    
    func initContainerAndContext() {
        container = NSPersistentContainer(name: "11")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        context = container.viewContext
    }
    
    func initCells() {
        do {
            let fetchRequest: NSFetchRequest<CellEntity> = CellEntity.fetchRequest()
            let objects = try context.fetch(fetchRequest)
            
            if objects.count > 0 {
                return
            }
            for week in 1...weeks {
                for day in 1...days {
                    for time in times {
                        guard let entityDescription = NSEntityDescription.entity(forEntityName: String(describing: CellEntity.self), in: context) else {
                            fatalError("Entity description not found for \(CellEntity.self)")
                        }
                        
                        let cellEntity = CellEntity(entity: entityDescription, insertInto: context)
                        cellEntity.setValue(time, forKey: "time")
                        cellEntity.setValue("", forKey: "descriptionAtr")
                        cellEntity.setValue(week*10 + day, forKey: "id")
                        context.insert(cellEntity)
                    }
                }
            }
            
            saveContext()
        } catch let error {
            print("Error fetching cell data: \(error.localizedDescription)")
        }
    }
    
    func getNotes() -> [CellEntity] {
        do {
            let fetchRequest: NSFetchRequest<CellEntity> = CellEntity.fetchRequest()
            let objects = try context.fetch(fetchRequest)
            
            var ans: [CellEntity] = []
            for object in objects {
                if object.id == self.id {
                    ans.append(object)
                }
            }
            
            return ans
        } catch let error {
            print("Error fetching cell data: \(error.localizedDescription)")
        }
        
        return []
    }
    
    func editNote(time: String, newDescription: String) {
        do {
            let fetchRequest: NSFetchRequest<CellEntity> = CellEntity.fetchRequest()
            let objects = try context.fetch(fetchRequest)
            let cell = findCell(objects: objects, time: time, id: self.id)
            context.delete(cell)
            
            guard let entityDescription = NSEntityDescription.entity(forEntityName: String(describing: CellEntity.self), in: context) else {
                fatalError("Entity description not found for \(CellEntity.self)")
            }
            
            let cellEntity = CellEntity(entity: entityDescription, insertInto: context)
            cellEntity.setValue(time, forKey: "time")
            cellEntity.setValue(newDescription, forKey: "descriptionAtr")
            cellEntity.setValue(self.id, forKey: "id")
            
            context.insert(cellEntity)
            saveContext()
            
        } catch let error {
            print("Error fetching cell data: \(error.localizedDescription)")
        }
    }
    
    func saveContext () {
          if context.hasChanges {
              do {
                  try context.save()
              } catch {
                context.rollback()
                  let nserror = error as NSError
                  fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
              }
          }
    }
    
    func findCell(objects: [CellEntity], time: String, id: Int) -> CellEntity {
        for object in objects {
            if object.id != id { continue }
            if object.time != time { continue }
            return object
        }
        
        return CellEntity()
    }
}
