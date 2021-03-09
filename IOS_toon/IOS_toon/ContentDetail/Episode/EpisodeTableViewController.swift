//
//  EpisodeTableViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/27.
//

import UIKit
import WebKit

class EpisodeTableViewController: UITableViewController, EpisodeTableModelProtocol {
    

    @IBOutlet var EpisodeTableView: UITableView!
    @IBOutlet weak var wbCover: WKWebView!
    
    var feedItem: NSArray = NSArray()
    var receiveCcode: String = ""
    var receiveEcode: String = ""
    var receiveEpicon: String = ""
    var receiveCover: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let episodeTableModel = EpisodeTableModel()
        episodeTableModel.delegate = self
        episodeTableModel.downloadItems()
        
        EpisodeTableView.rowHeight = 60
        
        wbCover.load(URLRequest(url: URL(string: "\(receiveCover)")!))
        
    }
    func itemDownloaded(items: NSArray) {
        feedItem = items
        self.EpisodeTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) { // 입력 , 수정, 삭제후 DB 재구성 -> Table 재구성
        let queryModel = EpisodeTableModel()
        queryModel.delegate = self
        queryModel.downloadItems()
    }


    @IBAction func btnCheck(_ sender: UIButton) {
        sender.isSelected.toggle()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! EpisodeTableViewCell

        // Configure the cell...
        let item: EpisodeDBModel = feedItem[indexPath.row] as! EpisodeDBModel

        cell.lbEpi?.text = "\(item.Ecode!)화"
        
        receiveEcode = item.Ecode!
        receiveEpicon = item.EContentImage1!
        receiveCcode = item.Ccode!
        print(receiveEcode)
        print(receiveEpicon)
        return cell
      
        
    }
    
    
    func receiveItem(_ code: String, _ epi: String, _ cover: String){
//        receivecode = code
//        receiveTotalepi = epi
        receiveCover = cover
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgEpicon"{
            let cell = sender as! UITableViewCell
            let indexPath = self.EpisodeTableView.indexPath(for: cell)
            let detailView = segue.destination as! EpisodeViewController
            
            let item: EpisodeDBModel = feedItem[(indexPath!.row)] as! EpisodeDBModel
            
            let epicon = item.EContentImage1
            
            detailView.receiveItem(epicon!)
         //   print("몇화입니까\((EpisodeTableView.indexPathForSelectedRow))")
           // detailView.receiveItem(epicon)
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

}
