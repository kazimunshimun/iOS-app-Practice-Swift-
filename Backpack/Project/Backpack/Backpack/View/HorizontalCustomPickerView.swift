//
//  HorizontalCustomPickerView.swift
//  Backpack
//
//  Created by Anik on 26/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

protocol HorizontalPickerViewCallBack {
    func didSelectTicket(ticket: TicketInfo, index: Int)
}

class HorizontalCustomPickerView: UIPickerView {
    var pickerData: [TicketInfo]!
    var callBackDelegate: HorizontalPickerViewCallBack? = nil

}

extension HorizontalCustomPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
}

extension HorizontalCustomPickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        let dateLabel = UILabel(frame: CGRect(x: 0, y: 8, width: 100, height: 20))
        dateLabel.text = pickerData[row].travelDate
        dateLabel.textAlignment = .center
        dateLabel.textColor = .white
        dateLabel.font = UIFont(name: "Poppins-Regular", size: 12)
        view.addSubview(dateLabel)
        
        let costLabel = UILabel(frame: CGRect(x: 0, y: 30, width: 100, height: 20))
        costLabel.text = pickerData[row].ticketCost
        costLabel.textAlignment = .center
        costLabel.textColor = .white
        costLabel.font = UIFont(name: "Poppins-Bold", size: 14)
        view.addSubview(costLabel)
        
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi / 180))
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callBackDelegate?.didSelectTicket(ticket: pickerData[row], index: row)
    }
}
