//
//  ItemViewController.swift
//  xiaoni
//
//  Created by zhengxiaotai on 2018/9/22.
//  Copyright © 2018年 Jzhous. All rights reserved.
//

import UIKit
import RealmSwift

class ItemViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var itemCollection: UICollectionView!
    
    var itemList: Array<ItemInfo> = []
    let realm = try! Realm()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemViewCell
        cell.image.image = UIImage(named: "test")
        cell.name.text = itemList[indexPath.row].ITEM_NAME
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(itemList[indexPath.row].ITEM_NAME)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        let result = realm.objects(ItemInfo.self).filter("MENU_ID = 141").sorted(byKeyPath: "SORT")
//        for r in result {
//            itemList.append(r)
//        }
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(setItemList(notification:)), name: Notification.Name(rawValue: "itemList"), object: nil)
        
    }
    
    @objc func setItemList(notification: Notification) {
        let list: Array<ItemInfo> = notification.object as! Array<ItemInfo>
        itemList = list
        itemCollection.reloadData()
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
