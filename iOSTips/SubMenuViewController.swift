//
//  SubMenuViewController.swift
//  iOSTips
//
//  Created by 臧其龙 on 15/10/19.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

import UIKit

class SubMenuViewController: UIViewController {

    @IBOutlet weak var subMenuTableView: UITableView!
    var subDataSourceArray = [String]()
    {
        didSet{
            subMenuTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subMenuTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "subCell")
        subMenuTableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SubMenuViewController:UITableViewDelegate, UITableViewDataSource
{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("subCell")!
        
        cell.textLabel?.text = subDataSourceArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subDataSourceArray.count
    }
}