//
//  SearchResultTableViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/03/05.
//

import UIKit

class SearchResultTableViewController: UITableViewController, SearchResultModelProtocol {
    
    
    var receiveId = ""
    var receiveName =  ""
    var receiveDept = ""
    var receivePhone = ""
    
    
//    func itemDownloaded(items: NSArray) {
//        feedItem = items
//        self.SearchTable.reloadData()
//    }
    
    
    @IBOutlet var SearchTable: UITableView!
    var feedItem: NSArray = NSArray()
    var imageurl: String = ""
    var receiveSearch: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchModel  = SearchResultModel()
        searchModel.delegate = self
        searchModel.downloadItems()
        
        SearchTable.rowHeight = 200
        
        //searchModel.checkItems(UserId: receiveSearch)

        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func itemDownloaded(items: NSArray) {
        feedItem = items
        self.SearchTable.reloadData()
    }
    // MARK: - Table view data source

    
    func receiveItems(_ id: String, _ name: String, _ dept: String, _ phone: String){
        receiveId = id
        receiveName = name
        receiveDept = dept
        receivePhone = phone
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! searchResultTableViewCell

        // Configure the cell...
        let item: ContentDBModel = feedItem[indexPath.row] as! ContentDBModel
        
        imageurl = "\(item.ccover!)"
        
        
//        cell.wv?.load(URLRequest(url: URL(string: "\(imageurl)")!))
//        cell.lbGenre?.text = "장르 : \(item.cgenre!)"
//        cell.lbTitle?.text = "제목 : \(item.ctitle!)"
//        cell.lbView?.text = "조회 : \(item.cview!)"
        
        cell.wv?.load(URLRequest(url: URL(string: "\(imageurl)")!))
        cell.lbGenre?.text = "장르 : \(item.cgenre!)"
        cell.lbTitle?.text = "제목 : \(item.ctitle!)"
        cell.lbView?.text = "조회 : \(item.cview!)"

        return cell
    }
    
//    func receiveItems(_ search: String){
//        receiveSearch = search
//        print("리시브_ 검색어:\(search)")
//    }
    

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
            let indexPath = self.SearchTable.indexPath(for: cell)
            let detailView = segue.destination as! ContentDetailViewController
            
            let item: ContentDBModel = feedItem[(indexPath!.row)] as! ContentDBModel
            
            let code = item.ccode!
            let cover = item.ccover!
            let title = item.ctitle!
            let genre = item.cgenre!
            let view = item.cview!
            let insert = item.cinsert!
            let delete = item.cdelete!
            let author = item.cauthor!
            let subtitle = item.csubtitle!
            let episode = item.cepisode!

            detailView.receiveItems(code, cover, title, genre, view, insert,  delete, author, subtitle, episode)
        }
    }
}
