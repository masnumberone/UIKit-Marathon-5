//
//  ViewController.swift
//  UIKit-Marathon-5
//
//  Created by work on 15.05.2023.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(configuration: .filled())
        view.addSubview(button)
        
        button.setTitle("Present", for: .normal)
        button.sizeToFit()
        button.center.x = view.frame.width / 2
        button.frame.origin.y = 80
        
        button.addTarget(self, action: #selector(presentPopover(_:)), for: .touchUpInside)
    }
    
    @objc
    func presentPopover(_ sender: UIButton) {
        let popoverVC = PopoverViewController()
        popoverVC.modalPresentationStyle = .popover
        popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        popoverVC.popoverPresentationController?.sourceView = sender
        popoverVC.popoverPresentationController?.delegate = self
        popoverVC.view.backgroundColor = .systemBackground
        
        present(popoverVC, animated: true)
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }

}

class PopoverViewController: UIViewController {
    
    lazy var setHeight280 = UIAction(title: "280px", handler: { _ in
        self.preferredContentSize = .init(width: 300, height: 280)
    })
    
    lazy var setHeight150 = UIAction(title: "150px", handler: { _ in
        self.preferredContentSize = .init(width: 300, height: 150)
    })
    
    override func viewDidLoad() {
        
        let segmetedControl = UISegmentedControl(items: [setHeight280, setHeight150])
        view.addSubview(segmetedControl)
        
        segmetedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmetedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmetedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        segmetedControl.selectedSegmentIndex = 0
        setHeight280.performWithSender(nil, target: nil)
        
        
        let dismissButton = UIButton(type: .close)
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])

        dismissButton.addTarget(self, action: #selector(dismissButtonDidTapped), for: .touchDown)
    }
    
    @objc
    func dismissButtonDidTapped() {
        dismiss(animated: true)
    }
    
}

