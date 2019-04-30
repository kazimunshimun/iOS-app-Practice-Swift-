//
//  HorizontalRequestPickerView.swift
//  Backpack
//
//  Created by Anik on 28/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

protocol RequestPickerViewCallBack {
    func didSelectRequest(request: Request, index: Int)
}

class HorizontalRequestPickerView: UIPickerView {
    var requestData: [Request]!
    var callBackDelegate: RequestPickerViewCallBack? = nil
}

extension HorizontalRequestPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return requestData.count
    }
    
}

extension HorizontalRequestPickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 300
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let request = requestData[row]
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 331, height: 300))
        let tripImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 331, height: 300))
        tripImageView.image = UIImage(named: request.tripImageName!)
        tripImageView.contentMode = .scaleAspectFill
        view.addSubview(tripImageView)
        
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi / 180))
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callBackDelegate?.didSelectRequest(request: requestData[row], index: row)
    }
}
