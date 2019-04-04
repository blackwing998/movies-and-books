//
//  ViewController.swift
//  recomended movies & books
//
//  Created by James.Cotter on 4/2/19.
//  Copyright © 2019 James Cotter. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
   
    var booksLoaded = false
    var booksOrMovies = 1
    var myMovieList:[String] = ["transformers the movie 86", "spirited away", "DragonballZ Broly the legendary super sayain", "batman and the court of owls"]
    var myBookList:[String] = ["Dr.suess one fish two fish red fish blue fish", "go the fuck to sleep", "the divine comedy","the complete cuthulu mythos"]

    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var titleLable: UIView!
    @IBOutlet weak var appendMovieTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
    if booksLoaded == false {
    return myMovieList.count
    }
        if booksLoaded == true {
            return myBookList.count
        }else{
            return 0
        }
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cellintableView")
    if booksLoaded == false {
        let holderText = myMovieList[indexPath.row]
        myCell?.textLabel?.text = holderText
    }
    if booksLoaded == true {
        let holderTextTwo = myBookList[indexPath.row]
        myCell?.textLabel?.text = holderTextTwo
    }
    
    return myCell!
    
}
    
    @IBAction func removeButtonPressed(_ sender: Any){ //{myMovieList.removeLast()
        //customTableView.reloadData()
    switch booksLoaded{
    case true:
        if myBookList.isEmpty == false{
        myBookList.removeLast()
            customTableView.reloadData()
            
        }
        if myBookList.isEmpty == true
        {let alert = UIAlertController(title: "EMPTY LIST", message: "The list has been Emptyed", preferredStyle:UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "dismiss",  style:UIAlertAction.Style.destructive, handler:nil))
            present(alert,animated: true, completion: nil)
            
        }
    case false:
        myMovieList.removeLast()
        customTableView.reloadData()
    default:
        break}
        
}
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if appendMovieTitle.text != ""{
            if booksLoaded == false{
            myMovieList.insert(appendMovieTitle.text ?? "yeah", at: 0)
            customTableView.reloadData()}
            else{myBookList.insert(appendMovieTitle.text ?? "yeah", at: 0)
            customTableView.reloadData()
    
    }
        }
    }
    @IBAction func switchButtonPressed(_ sender: Any) {
        switch booksOrMovies{
        case 1:
            booksLoaded = true
            booksOrMovies += 1
            customTableView.reloadData()
        case 2:
            booksLoaded = false
            booksOrMovies -= 1
            customTableView.reloadData()
        default:
            break
        }
    }
}





