//
//  RemoveViewController.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 11/03/22.
//

import UIKit

class RemoveViewController: UIViewController {

    
    var removescreen: RemoveScreen?
    override func loadView() {
        self.removescreen = RemoveScreen()
        self.view = self.removescreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.removescreen?.delegate(delegate: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backItem?.title = "Voltar"

    }
}

extension RemoveViewController:RemoveScreenProtocol{
    func actionRemoveButton() {
        print("Removendo moeda do Favorito")
        let vc: AddViewController = AddViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }

}
