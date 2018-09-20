//
//  MenuViewController.swift
//  xiaoni
//
//  Created by zhengxiaotai on 2018/9/19.
//  Copyright © 2018年 Jzhous. All rights reserved.
//

import UIKit
import RealmSwift

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var menuView: UITableView!
    
    var menuItems: Array<MenuInfo> = []
    let realm = try! Realm()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItem", for: indexPath) as UITableViewCell
        cell.textLabel?.text = menuItems[indexPath.row].MENU_NAME
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(realm.configuration.fileURL!)
        
//        let item = MenuInfo()
//        item.MENU_ID = 7
//        item.MENU_NAME = "设计师"
//        item.PARENT_ID = 0
//        item.SORT = 7
//        item.ITEM_FLAG = 0
//        try! realm.write {
//            realm.add(item)
//        }
        
        let result = realm.objects(MenuInfo.self).filter("PARENT_ID = 0").sorted(byKeyPath: "SORT")
        for r in result {
            menuItems.append(r)
        }
        menuView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1_2" {
            if let indexPath = menuView.indexPathForSelectedRow {
                let destination = segue.destination as! MenuView2Controller
                let result = realm.objects(MenuInfo.self).filter("PARENT_ID = " + menuItems[indexPath.row].MENU_ID.description).sorted(byKeyPath: "SORT")
                destination.menuItems2.removeAll()
                for r in result {
                    destination.menuItems2.append(r)
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
