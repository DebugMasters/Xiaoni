//
//  MenuView2Controller.swift
//  xiaoni
//
//  Created by zhengxiaotai on 2018/9/21.
//  Copyright © 2018年 Jzhous. All rights reserved.
//

import UIKit
import RealmSwift

class MenuView2Controller: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var menuView2: UITableView!
    
    var menuItems2: Array<MenuInfo> = []
    let realm = try! Realm()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItem2", for: indexPath) as UITableViewCell
        cell.textLabel?.text = menuItems2[indexPath.row].MENU_NAME
        if menuItems2[indexPath.row].ITEM_FLAG == 1 {
            cell.accessoryType = UITableViewCell.AccessoryType.none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if menuItems2[indexPath.row].ITEM_FLAG == 1 {
            var list: Array<ItemInfo> = []
            let result = realm.objects(ItemInfo.self).filter("MENU_ID = " + menuItems2[indexPath.row].MENU_ID.description).sorted(byKeyPath: "SORT")
            for r in result {
                list.append(r)
            }
            let center = NotificationCenter.default
            center.post(name: NSNotification.Name(rawValue: "itemList"), object: list)
        }
        else {
            self.performSegue(withIdentifier: "segue2_3", sender: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        menuView2.tableFooterView = UIView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2_3" {
            if let indexPath = menuView2.indexPathForSelectedRow {
                let destination = segue.destination as! MenuView3Controller
                let result = realm.objects(MenuInfo.self).filter("PARENT_ID = " + menuItems2[indexPath.row].MENU_ID.description).sorted(byKeyPath: "SORT")
                destination.menuItems3.removeAll()
                for r in result {
                    destination.menuItems3.append(r)
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
