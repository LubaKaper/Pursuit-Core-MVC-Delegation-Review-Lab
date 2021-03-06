//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    // STEP 2
   // weak var delegate: FontDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var fontSize: CGFloat! {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        loadData()
        
    }
    
    func loadData() {
        movies = Movie.allMovies
        fontSize = 17.0
    }
    
    // Step 4 and 5 of Custom Delegation is here because we have an instance of (second) FontChangerViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fontChangerVC = segue.destination as? FontChangerViewController else {
            fatalError()
        }
        // Step 4: CUSTOM DELEGATION
        fontChangerVC.delegate = self
        
        fontChangerVC.sliderFont = fontSize
    }
    
    
//    @IBAction func changeFont(segue: UIStoryboardSegue) {
//        guard let fontChangerViewController = segue.source as? FontChangerViewController else {
//            fatalError("failed to access FontChangerViewController")
//        }
//        fontSize = fontChangerViewController.sliderFont
//        
//    }
    

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = movies[indexPath.row]
//        fontVC.delegate = self
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        cell.textLabel?.font = UIFont(name: "Didot", size: CGFloat(fontSize!))
        cell.detailTextLabel?.font = UIFont(name: "Didot", size: CGFloat(fontSize!))
        
        return cell 
    }
}
// step 5-6
extension ViewController: FontDelegate {
    func didChangeFont(_ fontChanger: FontChangerViewController, fontSize: CGFloat) {
        
  
//         let fontVC = storyboard?.instantiateViewController(identifier: "FontChangerViewController") as! FontChangerViewController
//        fontVC.delegate = self
        //fontSize = fontVC.sliderFont
        self.fontSize = fontSize
        // do not need all that is commented out because we don't need an instance of VC as we already have it in the function
    }
}

