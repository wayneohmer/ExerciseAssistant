//
//  P9SSpeakTimesController.swift
//  pre90sec
//
//  Created by Wayne Ohmer on 12/19/16.
//  Copyright © 2016 Wayne Ohmer. All rights reserved.
//

import UIKit

private let reuseIdentifier = "EASpeakTimesCell"

class EASSpeakTimesController: UICollectionViewController {

    var exercise = EAExercise()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.exercise.time.absoluteSec
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EASpeakTimesCell
    
        cell.numberLabel.text = "\(indexPath.item)"
        if  self.exercise.spokenTimes.contains(indexPath.item) {
            cell.numberLabel.backgroundColor = UIColor.white
            cell.numberLabel.textColor = UIColor.black
        } else {
            cell.numberLabel.backgroundColor = UIColor.black
            cell.numberLabel.textColor = UIColor.white
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.exercise.spokenTimes.contains(indexPath.item) {
            self.exercise.spokenTimes.remove(indexPath.item)
        } else {
            exercise.spokenTimes.update(with: indexPath.item)
        }
        self.collectionView?.reloadData()
    }

}
