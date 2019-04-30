//
//  RequestsViewController.swift
//  Backpack
//
//  Created by Anik on 29/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController, RequestPickerViewCallBack {
    
    @IBOutlet weak var requestPickerView: UIPickerView!
    
    var requestData: [Request]!
    
    var requestHorizontalPicker: HorizontalRequestPickerView!
    
    var rotationAngle: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rotationAngle = -90 * (.pi / 180)
        requestHorizontalPicker = HorizontalRequestPickerView()
        
        requestHorizontalPicker.callBackDelegate = self
        requestHorizontalPicker.requestData = requestData
        
        let y = requestPickerView.frame.origin.y
        print("before pickerView x: \(requestPickerView.frame.origin.x) y: \(requestPickerView.frame.origin.y) width: \(requestPickerView.frame.width) height: \(requestPickerView.frame.height)")
        requestPickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        print("after pickerView x: \(requestPickerView.frame.origin.x) y: \(requestPickerView.frame.origin.y) width: \(requestPickerView.frame.width) height: \(requestPickerView.frame.height)")
        requestPickerView.frame = CGRect(x: -100, y: y, width: 300, height: 350)
        requestPickerView.delegate = requestHorizontalPicker
        requestPickerView.dataSource = requestHorizontalPicker
        
        requestPickerView.selectRow(1, inComponent: 0, animated: false)
        didSelectRequest(request: requestData[2], index: 2)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func didSelectRequest(request: Request, index: Int) {
        
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
