//
//  MovieTableViewCell.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Liubov Kaper  on 1/26/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit



class MovieTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nameLAbel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    
    
    private func fontChange() {
        
    }
    
    public func configureCell(movie: Movie) {
       
        nameLAbel.text = movie.name
        yearLabel.text = movie.year.description
       // nameLAbel?.font = UIFont(name: "Didot", size: CGFloat(fontSize!))
}
}
