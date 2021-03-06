//
//  PhotoViewCell.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 12.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit

class PhotoViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var headerOfTask: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /*func setTask(_ header: String, _ image: UIImage) {
        headerOfTask.text = header
        img.image = image
    }*/

//    func setTask(set element: Int, setDataSource dataSource: DataSource) {
//        if dataSource.arImageHeader != nil && (dataSource.arImageHeader?.count)! > element {
//            headerOfTask.text = dataSource.arImageHeader?[element].headerLabel
//            img.image = UIImage(data: (dataSource.arImageHeader?[element].image)!, scale:1.0)!
//        }
//    }
    
    func setTask(headerText: String, image: Data) {
        headerOfTask.text = headerText
        img.image = UIImage(data: (image), scale:1.0)!
    }
}
