//
//  MainScreenMainScreenInteractor.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

class MainScreenInteractor {

    weak var output: MainScreenInteractorOutput!
    var networkLayer: NetworkLayerInputInput!
    
    var dataSource: DataSource!

}


extension MainScreenInteractor: MainScreenInteractorInput {
    
    func getCount(ar name: RecordTypes) -> Int {
        switch name {
        case .textType:
            return dataSource.arHeaderText?.count ?? 0
        case .imageType:
            return dataSource.arImageHeader?.count ?? 0
        case .dateType:
            return dataSource.arDate?.count ?? 0
        }
    }
    
    func getTask(inAr ar: RecordTypes, inPos pos: Int) -> Any? {
        switch ar {
        case .textType:
            return dataSource.arHeaderText?[pos]
        case .imageType:
            return dataSource.arImageHeader?[pos]
        case .dateType:
            return dataSource.arDate?[pos]
        }
    }
    
    func deleteTask(data: Any) {
        dataSource.delete(setOb: data)
    }
    
    func sync() {
        networkLayer.get(synch: { (data: [Any]) in
            for item in data {
                if let data = item as? HeaderText {
                    self.dataSource.pushData(push: data.headerLabel!, push: data.textLabel!, id: Int(data.id!) ?? 0)
                } else if let data = item as? ImageHeader {
                    
                } else if let data = item as? Date {
                    self.dataSource.pushData(push: data.dateLabel!, id: Int(data.id!) ?? 0)
                }
            }
            self.output.reloadTable()
        })
    }
    
    func deleteFromServer(id: Int) {
        networkLayer.delete(id: id)
    }
    
}
