//
//  DayPresenter.swift
//  project
//
//  Created by Paul Nikulshin on 15.03.2024.
//

import UIKit

protocol DayView: AnyObject {
    
}

protocol DayViewPresenter {
    init(view: DayView, id: Int)
    func getData() -> [Cell]
    func editNote(time: String, newDescription: String)
    func getMemos(textView: UITextView, index: Int)
    func addMemo(text: String, index: Int)
    
}

class DayPresenter: DayViewPresenter {
    var view: DayView!
    var repository: NotesRepository
    
    required init(view: DayView, id: Int) {
        self.view = view
        repository = NotesRepository(id: id)
    }
    
    func getData() -> [Cell] {
        let cells = repository.getNotes()
        var ans: [Cell] = []
        for cell in cells {
            print(Cell(time: cell.time!, description: cell.descriptionAtr!))
            ans.append(Cell(time: cell.time!, description: cell.descriptionAtr!))
        }
        
        return ans.sorted{ (lhs: Cell, rhs: Cell) -> Bool in
            let strl: String = lhs.time[lhs.time.count-2]
            let strr: String = rhs.time[rhs.time.count-2]
            let numl: Int = Int(lhs.time[0..<lhs.time.count-2])!
            let numr: Int = Int(rhs.time[0..<rhs.time.count-2])!
            
            if strl == "P" && strr == "A" {
                return false
            }
            if strl == "A" && strr == "P" {
                return true
            }
            return numl < numr
        }
    }
    func editNote(time: String, newDescription: String) {
        repository.editNote(time: time, newDescription: newDescription)
    }
    
    func getMemos(textView: UITextView, index: Int) {
        
    }
    
    func addMemo(text: String, index: Int) {
        
    }
}

extension String {
    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    subscript (r: Range<Int>) -> String {
            let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                                upper: min(length, max(0, r.upperBound))))
            let start = index(startIndex, offsetBy: range.lowerBound)
            let end = index(start, offsetBy: range.upperBound - range.lowerBound)
            return String(self[start ..< end])
    }
}
