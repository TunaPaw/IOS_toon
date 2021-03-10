//
//  CreateListTableViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/03/10.
//

import UIKit

class CreateListTableViewController: UITableViewController, CreateListModelProtocol {
    @IBOutlet var CreateList: UITableView!
    func itemDownloaded(items: NSArray) {
        feedItems = items
        self.CreateList.reloadData()
        
        
    }
    
    var feedItems: NSArray = NSArray()
    var imgUrl: String = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

       let createTableModel = CreateListModel()
        createTableModel.delegate = self
        createTableModel.downloadItems()
        
        CreateList.rowHeight = 200
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "createCell", for: indexPath)as! CreateListTableViewCell

        // Configure the cell...
        let item: ContentDBModel = feedItems[indexPath.row] as! ContentDBModel
    
        
        cell.wb?.load(URLRequest(url: URL(string: "\(item.ccover!)")!))
        cell.lbView?.text = "조회 : \(item.cview!)"
        cell.lbGenre?.text = "장르 : \(item.cgenre!)"
        cell.lbTitle?.text = "제목 : \(item.ctitle!)"

        return cell
    }
    
    //스와이프-----------
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let favoriteAction = UIContextualAction(style: .normal, title:  "즐겨찾기", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            // Call edit action
            // Reset state
            success(true)
        })
        favoriteAction.backgroundColor = UIColor.systemYellow
        let shareAction = UIContextualAction(style: .normal, title:  "공유", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            // Call edit action
            // Reset state
            success(true)
        })
        shareAction.backgroundColor = UIColor.systemBlue
        let cartAction = UIContextualAction(style: .normal, title:  "백업", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            // Call edit action
            // Reset state
            success(true)
        })
        cartAction.backgroundColor = UIColor.systemPink
            return UISwipeActionsConfiguration(actions:[favoriteAction,shareAction,cartAction])
        }


    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let oneAction = UIContextualAction(style: .normal, title:  "수정", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            // Call edit action
            // Reset state
            success(true)
        })
        oneAction.backgroundColor = UIColor.systemTeal
        let twoAction = UIContextualAction(style: .normal, title:  "삭제", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
           //??????어디다가 넣어야됨?? _ = UIAlertController(title: "경고", message: "백업하셨나요? 작성하신 창작물이 삭제됩니다!", preferredStyle: UIAlertController.Style.alert)
            success(true)
            
        })
        twoAction.backgroundColor = UIColor.systemPurple

            return UISwipeActionsConfiguration(actions:[twoAction,oneAction])

        }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
//            CreateList.remove(at: indexPath.row)
//            tableView.deleteRows(at: [IndexPath], with: .bottom)
            }
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
            let indexPath = self.CreateList.indexPath(for: cell)
            let detailView = segue.destination as! ContentDetailViewController
            
            let item: ContentDBModel = feedItems[(indexPath!.row)] as! ContentDBModel
            
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


