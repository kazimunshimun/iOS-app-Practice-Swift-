//
//  SelectionViewController.swift
//  Backpack
//
//  Created by Anik on 26/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

protocol SelectionCallBack {
    func didSelectIndex(index: IndexPath)
}

class SelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectionChoices: [String] = []
    var selectedIndex: IndexPath? = nil
    @IBOutlet weak var selectionTableView: UITableView!
    
    @IBOutlet weak var wrapper: UIView!
    
    var verticalConstraint: NSLayoutConstraint? = nil
    var heightConstraint: NSLayoutConstraint? = nil
    
    var delegate: SelectionCallBack? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black.withAlphaComponent(0)
        self.view.layoutIfNeeded()
        
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: wrapper, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: wrapper, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.size.width)
        
        verticalConstraint = NSLayoutConstraint(item: wrapper, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: self.view.frame.size.height)
        
        view.addConstraints([horizontalConstraint, widthConstraint, verticalConstraint!])
        
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            UIView.animate(withDuration: 0.25, animations: {
                self.verticalConstraint!.constant = 200
                self.heightConstraint = NSLayoutConstraint(item: self.wrapper, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant:  0)
                self.view.addConstraints([self.heightConstraint!])
                self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
                self.view.layoutIfNeeded()
            })
        }
        
        selectionTableView.delegate = self
        selectionTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectionChoices.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 44.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "selectionCell")!
        cell.textLabel?.text = selectionChoices[indexPath.row]
        if selectedIndex == indexPath {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        //cell.userNameLabel.text = "User name \(indexPath.row)"
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    @IBAction func close(_ sender: UIButton){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.removeConstraint(self.heightConstraint!)
            self.verticalConstraint!.constant = self.view.frame.size.height
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.view.layoutIfNeeded()
        }) { (done) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func selectIndex(_ sender: UIButton){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.removeConstraint(self.heightConstraint!)
            self.verticalConstraint!.constant = self.view.frame.size.height
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.view.layoutIfNeeded()
        }) { (done) in
            self.dismiss(animated: false, completion: nil)
            self.delegate?.didSelectIndex(index: self.selectedIndex!)
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
