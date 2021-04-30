//
//  ViewController.swift
//  flutes
//
//  Created by ahmed aelsebaay on 29/04/2021.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var songslisttable: UITableView!
    
 
    var songs = [song]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.songslisttable.delegate = self
        self.songslisttable.dataSource = self
        self . appenddata()
        self.songslisttable.reloadData()

    }
    
    
    
    func appenddata(){
       

        self.songs.append(song(title: "Ya Ana YA La يا انا يا لا ـ", filename: "01. Amr Diab - Ya Ana Ya La", fileExtintion: "mp3", image: #imageLiteral(resourceName: "1.jpg"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "Mahsoud محسود ـ", filename: "02. Amr Diab - Mahsoud", fileExtintion: "mp3", image: #imageLiteral(resourceName: "2.jpg"), songerName: "Amr Diab"))

        self.songs.append(song(title: "Shokran شكرا ـ", filename: "03. Amr Diab - Shokran", fileExtintion: "mp3", image: #imageLiteral(resourceName: "3.png"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "Ayez Aamel Zayak عايز اعمل زيك ـ", filename: "04. Amr Diab - Ayez Aamel Zayak", fileExtintion: "mp3", image: #imageLiteral(resourceName: "1.jpg"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "Bethazr بتهزر ـ", filename: "06. Amr Diab - Bethazr", fileExtintion: "mp3", image: #imageLiteral(resourceName: "2.jpg"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "Ya Dalaao يا دلعو ـ", filename: "09. Amr Diab - Ya Dalaao", fileExtintion: "mp3", image: #imageLiteral(resourceName: "3.png"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "Min El Aasham من العشم ـ", filename: "10. Amr Diab - Min El Aasham", fileExtintion: "mp3", image: #imageLiteral(resourceName: "1.jpg"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "Mahsoud محسود ـ", filename: "11. Amr Diab - Mahsoud (Oriental Remix)", fileExtintion: "mp3", image: #imageLiteral(resourceName: "2.jpg"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "El Gaw Gameel _ الجو جميل", filename: "12. Amr Diab - El Gaw Gameel", fileExtintion: "mp3", image: #imageLiteral(resourceName: "3.png"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "Bahebo بحبه  ـ ", filename: "Amr Diab - Bahebo عمرو دياب - بحبه (192 kbps)", fileExtintion: "mp3", image: #imageLiteral(resourceName: "1.jpg"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "Odam Merayetha قدام مرايتها ـ ", filename: "Amr Diab - Odam Merayetha عمرو دياب - قدام مرايتها (192 kbps)", fileExtintion: "mp3", image: #imageLiteral(resourceName: "1.jpg"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "Youm Talat يوم تلات ـ", filename: "Amr Diab - Youm Talat عمرو دياب - يوم تلات (192 kbps)", fileExtintion: "mp3", image: #imageLiteral(resourceName: "1.jpg"), songerName: "Amr Diab"))
        
        self.songs.append(song(title: "Ya Mahrousa _ يامحروسه ",filename: "نسمه محجوب - يامحروسه _ Nesma Mahgoub - Ya Mahrosa (192 kbps)", fileExtintion: "mp3", image: #imageLiteral(resourceName: "nessma mahgoub.jpeg"), songerName: "Nessma Mahgoub"))
        
        self.songs.append(song(title: "Lessa Bahnelha  لسه بحنلها ـ", filename: "Lessa Bahnelha", fileExtintion: "mp3", image: #imageLiteral(resourceName: "rami.jpeg"), songerName: "Ramy Essam"))
        
        self.songs.append(song(title: "Ya Fatenna يافاتنه ـ",filename: "ya fatenna", fileExtintion: "mp3", image: #imageLiteral(resourceName: "rami.jpeg"), songerName: "Ramy Essam"))
        
        self.songs.append(song(title: "Ya Ghali يا غالي ـ ",filename: "ya ghali", fileExtintion: "mp3", image: #imageLiteral(resourceName: "rola.jpeg"), songerName: "rola"))
        
        self.songs.append(song(title: "Ya Ashekat El Ward",filename: "ya ashekat el ward", fileExtintion: "mp3", image: #imageLiteral(resourceName: "carla.jpg"), songerName: "carla shamon"))
        
        self.songs.append(song(title: "hadal ahbek", filename: "hadal ahbek", fileExtintion: "mp3", image: #imageLiteral(resourceName: "s.JPG"), songerName: "Islam Els]najar"))

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = self.songs[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"titlecell") as! titlecell
        cell.songtitle.text = song.title
        cell.sonngerImage.image = song.image
        cell.songerrName.text = song.songerName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = self.songs[indexPath.row]
        let playerview = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController")as! PlayerViewController
        playerview.song=song
        playerview.songslist = self.songs
        playerview.selectidindex = indexPath.row
        
        self.navigationController?.pushViewController(playerview, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songs.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectioncell")as! sectioncell
        if (section == 0 ){
            cell.headerlabel.text = "Section : 1"}
        else if (section == 1)
        {
            
            cell.headerlabel.text = "Section : 2"
            
        }
        else if (section == 2){
            cell.headerlabel.text = "Section : 3"

       }
       
        
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

}

