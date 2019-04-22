//
//  AboutViewController.swift
//  Backpack
//
//  Created by Anik on 21/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let faqArray: [FAQ] = [FAQ(question: "How does this app protect my privacy?", anster: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.", isAnswering: false),
                           FAQ(question: "Am I able to delete my account?", anster: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.", isAnswering: false),
                           FAQ(question: "What happens to my data if I delete my account", anster: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.", isAnswering: false),
        FAQ(question: "Does this app track my location?", anster: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.", isAnswering: false),
        FAQ(question: "Is my account safe?", anster: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.", isAnswering: false),
        FAQ(question: "Am I able to delete my account?", anster: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.", isAnswering: false),
        FAQ(question: "Am I able to delete my account?", anster: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.", isAnswering: false)
    ]

    @IBOutlet weak var faqTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        faqTableView.delegate = self
        faqTableView.dataSource = self
        faqTableView.register(UINib(nibName: "FAQTableViewCell", bundle: nil), forCellReuseIdentifier: "faqCell")
      //  faqTableView.rowHeight = UITableView.automaticDimension
      //  faqTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell : UITableViewCell;
        let faq = faqArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "faqCell") as! FAQTableViewCell
       // cell.titleLabel.text = faq.question
       // cell.detailLabel.text = faq.anster
       // cell.detailLabel.numberOfLines = 0
        cell.questionLabel.text = faq.question
        cell.answerLabel.text = faq.anster
        return cell
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
