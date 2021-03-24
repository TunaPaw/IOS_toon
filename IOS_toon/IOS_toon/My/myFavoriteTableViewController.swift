//
//  myFavoriteTableViewController.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/03/24.
//

import UIKit

class myFavoriteTableViewController: UITableViewController, myFavoriteTableModelProtocol {
    
    @IBOutlet var myFavoriteList: UITableView!
    

    var feedItems : NSArray = NSArray()
    var imgUrl:String = ""

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myFavoriteModel = myFavoriteTableModel()
        myFavoriteModel.delegate = self
        myFavoriteModel.downloadItems()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        myFavoriteList.rowHeight = 200
    }
    
    func itemDownloaded(items: NSArray) {
        feedItems = items
        self.myFavoriteList.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFavoriteCell", for: indexPath)as! myFavoriteTableViewCell

        // Configure the cell...
        let item: ContentDBModel = feedItems[indexPath.row] as! ContentDBModel
        
        imgUrl = "\(item.ccover!)"
        
        
        cell.wv?.load(URLRequest(url: URL(string: "\(imgUrl)")!))
        cell.lblView?.text = "조회 : \(item.cview!)"
        cell.lblGenre?.text = "장르 : \(item.cgenre!)"
        cell.lblTitle?.text = "제목 : \(item.ctitle!)"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
