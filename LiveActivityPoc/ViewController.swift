//
//  ViewController.swift
//  LiveActivityPoc
//
//  Created by Ritik Sharma on 24/06/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak private var headView: UIView!
    
    @IBOutlet weak private var collectionView: UICollectionView!
    
    private var viewModel: HomeBaseViewModel = HomeBaseViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headView.roundCorners(radius: 20.0)
        self.collectionView.backgroundColor = UIColor.init(red: 135, green: 206, blue: 235, alpha: 1)
        self.registerCells()
        self.viewModel.delegate = self
        self.viewModel.fetchHomeBaseData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.backgroundColor = UIColor.lightGray
    }
 
    private func registerCells() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let nib = UINib(nibName: AlarmCVC.reuseIdentifier, bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: AlarmCVC.reuseIdentifier)
    }
}


extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.viewModel.dataSource?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let list = self.viewModel.dataSource?.list, indexPath.item < list.count else {
            return CGSize.zero
        }
        
        let item = list[indexPath.item]
        
        // Calculate the desired size based on your layout requirements
        let itemWidth: CGFloat = collectionView.bounds.width // Use the full width of the collection view
        let itemHeight: CGFloat = 100 // Set a fixed height or calculate it dynamically
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = self.viewModel.dataSource?.list?[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlarmCVC.reuseIdentifier, for: indexPath) as? AlarmCVC{
            cell.configure(with: model)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}



extension ViewController: HomeViewModelProtocol {
    func updateHomeData() {
        self.collectionView.reloadData()
    }
    
    
}


extension ViewController: UICollectionViewDelegate {
    
}
