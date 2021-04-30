    //
    //  PlayerViewController.swift
    //  Flutes
    //
    //  Created by ahmed aelsebaay on 29/04/2021.
    //

    import UIKit
    import AVFoundation
    class PlayerViewController: UIViewController {
        
        var song :song?
        var myplayer : AVAudioPlayer?
        var timer:Timer?
        var songslist:[song]?
        var selectidindex:Int?
        
        @IBOutlet weak var plaaay: UIButton!
        @IBOutlet weak var navigationtoplabel: UILabel!
        @IBOutlet weak var songimage: UIImageView!
        
        @IBOutlet weak var starttime: UILabel!
        
        @IBOutlet weak var endtime: UILabel!
        @IBOutlet weak var songslider: UISlider!
        override func viewDidLoad() {
            super.viewDidLoad()
            if (song! != nil){
                self.playsong(song:self.song!)}
            
            self.songimage.layer.cornerRadius = 120
    
        }
        
        func callTimer(){
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatestarttime), userInfo: nil, repeats:  true)
            
        }
        
        @objc func updatestarttime(){
            self.songslider.value = Float((self.myplayer?.currentTime)! )
            self.starttime.text = self.converttimeinterval(time: (self.myplayer?.currentTime)!)
            
            
        }
        
        
        func converttimeinterval(time: TimeInterval) -> String {
            let minute = Int(time) / 60 % 60
            let second = Int(time) % 60

            // return formated string
            return String(format: "%02i:%02i", minute, second)
        
        }
        
        
        func playsong(song : song){
            if ( song != nil){
                
                self.navigationtoplabel.text = song.title
                self.songimage.image = song.image!
                self.myplayer?.volume = 1
                
                
                
                
                
            }
            if(song.filename != nil && song.fileExtintion != nil){
                if let file  = Bundle .main.url(forResource: song.filename, withExtension: song.fileExtintion)  {
                    do{
                        self.myplayer = try AVAudioPlayer(contentsOf: file)
                        self.callTimer()
                        self.songslider.maximumValue=Float((self.myplayer?.duration)!)
                        self.endtime.text = self.converttimeinterval(time: (self.myplayer?.duration)!)
                        
                    }catch {
                        print("err")
                         
                    }
                    
                }
            }
            }
        
        
        @IBAction func didpressplay(_ sender: UIButton) {

           
            if (sender.isSelected){
                self.myplayer?.pause()
                sender.isSelected = false
                
            }else {
                self.myplayer?.play()
                sender.isSelected=true
            }
            
        }
        
        @IBAction func didpressbackbutton(_ sender: Any) {
            
            self.navigationController?.popViewController(animated: true)
            myplayer?.pause()
            
        }
        @IBAction func valuesSlider(_ sender: UISlider) {
            self.myplayer?.currentTime = TimeInterval(sender.value)
        }
        
        @IBAction func slidervaluechanged(_ sender: UISlider) {
            self.myplayer?.volume = sender.value
        }
        
        @IBAction func didpressonnextbutton(_ sender: UIButton) {
           
            if (selectidindex! == self.songslist!.count-1)
            {
                
                self.selectidindex = -1
                
            }
            self.selectidindex! = self.selectidindex!+1
              let song = self.songslist![selectidindex!]
            self.playsong(song: song)
            self.plaaay.isSelected=false

        
    }
        
        
        @IBAction func didpressonperviusebutton(_ sender: UIButton) {
            
            if (self.selectidindex == -1)
            {
                self.selectidindex = (self.songslist?.count)!-1
                
            }
              let song = self.songslist![selectidindex!]
            self.playsong(song: song)
            self.selectidindex! = self.selectidindex!-1
 
            self.plaaay.isSelected=false

            
        }
        
        
    }
