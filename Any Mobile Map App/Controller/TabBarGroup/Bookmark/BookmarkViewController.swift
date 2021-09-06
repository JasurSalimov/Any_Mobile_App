//
//  BookmarkViewController.swift
//  Any Mobile Map App
//
//  Created by Jasur Salimov on 8/24/21.
//

import UIKit

class BookmarkViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "SmallTableViewCell", bundle: nil), forCellReuseIdentifier: "SmallTableViewCell")
            tableView.register(UINib(nibName: "BigTableViewCell", bundle: nil), forCellReuseIdentifier: "BigTableViewCell")
           
        }
    }
    override func viewDidLoad() {
        
    //Changing navigation controller atributes
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Gilroy-Bold", size: 19)!]
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        self.navigationItem.title = "Мои адреса"
  
    }


}

//MARK: - TableView Data source and delegate methods

extension BookmarkViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(Constants.id[indexPath.row].ratingIm == ""){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SmallTableViewCell") as? SmallTableViewCell else{return  UITableViewCell()}
            cell.addressLabel.text = Constants.id[indexPath.row].adress1!
            cell.secondaryAddress.text = Constants.id[indexPath.row].adress2!
            return cell
        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BigTableViewCell") as? BigTableViewCell else{return  UITableViewCell()}
            cell.mainLabel.text = Constants.id[indexPath.row].adress1
            cell.secondaryLabel.text = Constants.id[indexPath.row].adress2
            cell.timeLabel.text = Constants.id[indexPath.row].time
            cell.ratingImage.image = UIImage(named: Constants.id[indexPath.row].ratingIm!)
            return cell
        }
    }
}
