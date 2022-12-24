//
//  Task.swift
//  Memorize
//
//  Created by Mac2021 on 10/12/2022.
//

import Foundation

// array of tasks
struct Task:Identifiable{
    var id = UUID().uuidString
    var title : String
    var time: Date = Date()
}
//total tasks meta view
struct TaskMetaData:Identifiable{
    var id = UUID().uuidString
    var task : [Task]
    var taskDate : Date
    var idUser : String
    var idAvocat : String
}
//sample date For tasting
func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

