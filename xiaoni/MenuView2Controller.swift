//
//  MenuView2Controller.swift
//  xiaoni
//
//  Created by zhengxiaotai on 2018/9/21.
//  Copyright © 2018年 Jzhous. All rights reserved.
//

import UIKit

class MenuView2Controller: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var menuView2: UITableView!
    
    var menuItems2: Array<MenuInfo> = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItem2", for: indexPath) as UITableViewCell
        cell.textLabel?.text = menuItems2[indexPath.row].MENU_NAME
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView2.tableFooterView = UIView()
        // Do any additional setup after loading the view.
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
