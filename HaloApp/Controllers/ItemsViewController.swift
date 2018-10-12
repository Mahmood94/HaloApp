//
//  ItensViewController.swift
//  HaloApp
//
//  Created by Mahmood Al-haddad on 10/6/18.
//  Copyright © 2018 Mahmood Al-haddad. All rights reserved.
//

import UIKit
import RealmSwift

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var items: Results<Item> = RealmHelper.realmDB.objects(Item.self)    // <- Insert this
    
    let tableView = UITableView()
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let syncConfig = SyncConfiguration(user: SyncUser.current!, realmURL: Constants.REALM_URL)
        self.items = RealmHelper.realmDB.objects(Item.self).sorted(byKeyPath: "timestamp", ascending: false)
        self.setupNavigation()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = self.view.frame
        self.setupRealmNotification()
        
        UIHelpers.addFloatingButton(view: self.view, backgroundColor: UIColor.red, labelColor: UIColor.white, tag: 377, selector: #selector(addButtonDidClick))
    }
    
    func setupNavigation() {
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonDidClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(rightBarButtonDidClick))
        
        title = "To Do Item"
    }
    
    func setupRealmNotification() {
        notificationToken = items.observe { [weak self] (changes) in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
                tableView.beginUpdates()
                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.endUpdates()
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        }
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.selectionStyle = .none
        let item = items[indexPath.row]
        cell.textLabel?.text = item.body
        cell.accessoryType = item.isDone ? UITableViewCellAccessoryType.checkmark : UITableViewCellAccessoryType.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        try! RealmHelper.realmDB.write {
            item.isDone = !item.isDone
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        let item = items[indexPath.row]
        try! RealmHelper.realmDB.write {
            RealmHelper.realmDB.delete(item)
        }
    }
    
    @objc func addButtonDidClick() {
        let alertController = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ -> Void in
            let textField = alertController.textFields![0] as UITextField
            let item = Item()
            item.body = textField.text ?? ""
            try! RealmHelper.realmDB.write {
                RealmHelper.realmDB.add(item)
            }
            // do something with textField
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "New Item Text"
        })
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func rightBarButtonDidClick() {
        let alertController = UIAlertController(title: "Logout", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes, Logout", style: .destructive, handler: { _ -> Void in
            SyncUser.current?.logOut()
            self.navigationController?.popViewController(animated: true)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
