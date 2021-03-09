//
//  FavoriteTableViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/24.
//

import UIKit

class FavoriteTableViewController: UITableViewController, FavoriteTableModelProtocol {
                                                             
    
    @IBOutlet var FavoriteTableView: UITableView!
    
    var feedItem: NSArray = NSArray()
        var imageurl: String = ""
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let favoriteTableModel = FavoriteTableModel()
            favoriteTableModel.delegate = self
            favoriteTableModel.downloadItems()
            
            FavoriteTableView.rowHeight =  220
            
        }
        func itemDownloaded(items: NSArray) {
            feedItem = items
            self.FavoriteTableView.reloadData()
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteTableViewCell

            // Configure the cell...
            let item: ContentDBModel = feedItem[indexPath.row] as! ContentDBModel
            
            imageurl = "\(item.ccover!)"
            
            
            cell.fwbImage?.load(URLRequest(url: URL(string: "\(imageurl)")!))
        
            cell.lbView?.text = "조회 : \(item.cview!)"
            cell.lbGenre?.text = "장르 : \(item.cgenre!)"
            cell.lbTitle?.text = "제목 : \(item.ctitle!)"
            

            
            
            return cell
        }
        
        //스와이프
        override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

            let favoriteAction = UIContextualAction(style: .normal, title:  "즐겨찾기", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                // Call edit action
                let userAlert = UIAlertController(title: "즐겨찾기", message: "즐겨찾기 항목에 추가합니다.", preferredStyle: UIAlertController.Style.actionSheet)
                let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
                userAlert.addAction(onAction)
                self.present(userAlert, animated: true, completion: nil)
                success(true)
            })
            favoriteAction.image = UIImage(named: "icons8-star-32")
            favoriteAction.backgroundColor = UIColor.systemYellow
            
            let shareAction = UIContextualAction(style: .destructive, title:  "공유", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                // Call edit action
                // Reset state
                success(true)
            })
            shareAction.backgroundColor = UIColor.systemBlue
            shareAction.image = UIImage(named: "icon1.png")

            let cartAction = UIContextualAction(style: .destructive, title:  "장바구니", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                // Call edit action
                // Reset state
                success(true)
            })
            cartAction.backgroundColor = UIColor.systemPink
            return UISwipeActionsConfiguration(actions:[ favoriteAction,shareAction,cartAction])
            }
        

        override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let oneAction = UIContextualAction(style: .normal, title:  "one", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                // Call edit action
                // Reset state
                success(true)
            })
            oneAction.backgroundColor = UIColor.systemOrange
            let twoAction = UIContextualAction(style: .normal, title:  "two", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                // Call edit action
                // Reset state
                success(true)
            })
            twoAction.backgroundColor = UIColor.systemPurple

                return UISwipeActionsConfiguration(actions:[twoAction,oneAction])



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
                let indexPath = self.FavoriteTableView.indexPath(for: cell)
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
