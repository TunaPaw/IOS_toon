//
//  BookTableViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/24.
//

import UIKit

class BookTableViewController: UITableViewController, BookTableModelProtocol {

    
    @IBOutlet var BookTableView: UITableView!
    
    var feedItem: NSArray = NSArray()
    
    var imageurl: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let bookTableModel = BookTableModel()
        bookTableModel.delegate = self
        bookTableModel.downloadItems()
        
        BookTableView.rowHeight = 200
    }
    func itemDownloaded(items: NSArray) {
        feedItem = items
        self.BookTableView.reloadData()
    }

    override func viewWillAppear(_ animated:Bool){
        let queryModel = BookTableModel()
        queryModel.delegate = self
        queryModel.downloadItems()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell

        // Configure the cell...
        let item: ContentDBModel = feedItem[indexPath.row] as! ContentDBModel
        
        imageurl = "\(item.scode!)"
        
        
        cell.BwbImage?.load(URLRequest(url: URL(string: "\(imageurl)")!))
        cell.BlbCode?.text = "코드 : \(item.scode!)"
        cell.BlbView?.text = "조회 : \(item.sphone!)"
        cell.BlbGenre?.text = "장르 : \(item.sdept!)"
        cell.BlbTitle?.text = "제목 : \(item.sname!)"
        
        //webview2.load(URLRequest(url: URL(fileURLWithPath: "https://www.youtube.com/watch?v=\(videoId)")))
        
        return cell
    }

    
    @IBAction func btnGenre1(_ sender: UIButton) {
       reloadInputViews()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.BookTableView.indexPath(for: cell)
            let detailView = segue.destination as! ContentDetailViewController
            
            let item: ContentDBModel = feedItem[(indexPath!.row)] as! ContentDBModel
            
            let sid = item.scode!
            let sname = item.sname!
            let sdept = item.sdept!
            let sphone = item.sphone!

            detailView.receiveItems(sid, sname, sdept, sphone)
        }
    }
}
