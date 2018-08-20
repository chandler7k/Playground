//
//  AllListsViewController.swift
//  checklist
//
//  Created by ChandlerZou on 2018/3/26.
//  Copyright © 2018年 邹奂霖. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate, UINavigationControllerDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.delegate = self
        let index = dataModel.indexOfSelectedChecklist
        
        if index >= 0 && index < dataModel.lists.count {
            let checklist = dataModel.lists[index]
            
            performSegue(withIdentifier: "ShowChecklist", sender: checklist)
        }
        print("viewdidappear run ")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    var dataModel: DataModel!

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataModel.lists.count
    }

    // TODO: - hello
    
    // display the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeCell(for: tableView)
        let checklist = dataModel.lists[indexPath.row]
        cell.textLabel?.text = checklist.name
        cell.accessoryType = .detailButton
//        cell.detailTextLabel!.text = "\(checklist.countUncheckedItems()) Remaining"
        let count = checklist.countUncheckedItems()
        if checklist.items.count == 0{
            cell.detailTextLabel!.text = "No item"
        }else if count == 0{
            cell.detailTextLabel!.text = "All Done"
        }else{
            cell.detailTextLabel!.text = "\(count) Remaining"
        }
        cell.imageView!.image = UIImage(named: checklist.iconName)
        return cell
    }
    
    // delete list
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        dataModel.lists.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    // perform list
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        UserDefaults.standard.set(indexPath.row, forKey: "ChecklistIndex")
        dataModel.indexOfSelectedChecklist = indexPath.row
        let checklist = dataModel.lists[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
    
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist"{
            let controller  = segue.destination as! ChecklistViewController
            controller.checklist = sender as! Checklist
        }else if segue.identifier == "AddChecklist"{
            let controller = segue.destination as! ListDetailViewController
            controller.delegate = self
        }
    }
    
    
    // detail accessorytype taped
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ListDetailViewController") as! ListDetailViewController
        controller.delegate = self
        let checklist = dataModel.lists[indexPath.row]
        controller.checklistToEdit = checklist
        
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    // MARK: - delegate methods
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishingAdding checklist: Checklist) {
        let newRowIndex = dataModel.lists.count
        dataModel.lists.append(checklist)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
        
        
    }
    func listDetailViewController(_ controller: ListDetailViewController, didFinishingEditing checklist: Checklist) {
        if let index = dataModel.lists.index(of: checklist){
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath){
                cell.textLabel?.text = checklist.name
            }
            
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
   
    
    
    func makeCell(for tableView: UITableView) -> UITableViewCell{
        let cellIndentifier = "Cell"
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier){
            return cell
        }else{
            return UITableViewCell(style: .subtitle, reuseIdentifier: cellIndentifier)
        }
    }
    
    
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController === self{
//            UserDefaults.standard.set(-1, forKey: "ChecklistIndex")
            dataModel.indexOfSelectedChecklist = -1
//            print("navigationcontroller run")
        }
        
    }
   
    
    

   

}
