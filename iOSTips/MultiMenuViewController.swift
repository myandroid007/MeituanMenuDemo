//
//  MultiMenuViewController.swift
//  iOSTips
//
//  Created by 臧其龙 on 15/10/19.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

import UIKit

class MultiMenuViewController: UIViewController {

    @IBOutlet weak var mainMenuTableView: UITableView!
    var subVC:SubMenuViewController?
    
    var mainDatasourceArray = [String]()
        {
        didSet{
            mainMenuTableView.reloadData()
        }
    }
    
    var subVCDataSourceArray = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainDatasourceArray = ["haha","zql","ooo"]
        subVCDataSourceArray = [["1", "2", "3", "4"], ["5", "6", "7", "8"], ["9", "10", "11", "12"]]
        mainMenuTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "mainCell")
        mainMenuTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "embedSubMenu"
        {
            subVC = segue.destinationViewController as? SubMenuViewController
        }
    }

}

extension MultiMenuViewController:UITableViewDelegate, UITableViewDataSource
{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mainCell")!
        cell.textLabel?.text = mainDatasourceArray[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDatasourceArray.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let viewControler = subVC
        {
            viewControler.subDataSourceArray = subVCDataSourceArray[indexPath.row]
        }
    }
}
