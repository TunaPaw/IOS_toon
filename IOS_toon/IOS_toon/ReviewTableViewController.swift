//
//  ReviewTableViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/27.
//

import UIKit
import  WebKit

class ReviewTableViewController: UITableViewController, ReviewTableModelProtocol{
    func itemDownloaded(items: NSArray) {
        feedItem = items
        self.ReviewTableView.reloadData()
    }
    
    var receivecover = ""

    @IBOutlet var ReviewTableView: UITableView!
    @IBOutlet weak var wbCover: WKWebView!
    
    var feedItem: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reviewModel = ReviewTableModel()
        reviewModel.delegate = self
        reviewModel.downloadItems()
        
        wbCover.load(URLRequest(url: URL(string: "\(receivecover)")!))
    
        ReviewTableView.rowHeight = 130
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath)as! ReviewTableViewCell

        // Configure the cell...
    let item: ReviewDBModel = feedItem[indexPath.row] as! ReviewDBModel
        
        cell.tfReview.text = "\(item.Rcontent!)"
        cell.txtUserNick.text = "\(item.Uemail!)"
        cell.txtDate.text = "\(item.RInsertDate!) 에 작성"
        return cell
    }
    
    
    
    func receiveItem(_ cover: String){
        receivecover = cover
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
