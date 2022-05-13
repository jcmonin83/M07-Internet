//
//  ViewController.swift
//  Internet
//
//  Created by DISMOV on 13/05/22.
//

import UIKit
import Network

class ViewController: UIViewController {
    var internetStatus = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let monitor = NWPathMonitor()
        // que es un closure ??
        monitor.pathUpdateHandler = { path in
            //if path.status != .satisfied{
            //    inte
            //}
            self.internetStatus = path.status == .satisfied
        }
        monitor.start(queue: DispatchQueue.global())        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !(internetStatus){
            let alrt = UIAlertController(title: "Error",message: "No hay conexion a internet", preferredStyle: .alert)
            alrt.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
            self.present(alrt,animated: true)
        }
    }
}

