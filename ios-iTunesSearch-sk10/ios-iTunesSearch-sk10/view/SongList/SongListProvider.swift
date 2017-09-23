//
//  SongListProvider.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class SongListProvider: NSObject {
    
    let songInfoDao = SongInfoDao()
    
    var songLists = [Song]()
    var songImages = [SongInfo]()
    
    func set(songLists: [Song]) {
        self.songLists.removeAll()
        for song in songLists {
            self.songLists.append(song)
        }
    }
}

// MARK: - UITableViewDataSource
extension SongListProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SongDetailCell.className,for: indexPath) as! SongDetailCell
        
        let song = songLists[indexPath.row]
        
        cell.setSong(name: song.trackName)
        cell.setArtist(name: song.artistName)
        cell.setIcon(song: song)
        
        return cell
    }
}
