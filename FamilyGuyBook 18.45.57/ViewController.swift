//
//  ViewController.swift
//  FamilyGuyBook
//
//  Created by Habil Demirci on 29.09.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myFamily = [familyGuy]()
    var chosenfamilyGuy : familyGuy?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //familyGuy Objects
        
        let peter = familyGuy(familyGuyName: "Peter Griffin", familyGuyComment: "Peter, Family Guy ailesinin babasıdır. O saf, kaba saba ve biraz da tembel bir adamdır. İşini ciddiye almaz ama ailesine bağlıdır. Bazen yaptığı sorumsuzca hareketlerle herkesi çileden çıkarır, fakat bunu genelde saf düşünceleriyle yapar. Esprili ve garip hikayelere sürekli bulaşır. \n Eğlenceli Bilgi: Peter, bir defasında ABD Başkanı George W. Bush’la kavgaya tutuşmuştur!", familyGuyImage: UIImage(named: "Peter")!)
        
        let lois = familyGuy(familyGuyName: "Lois Griffin", familyGuyComment: "Lois, ailenin zeki ve sabırlı annesidir. Bir bale öğretmeni olarak çalışsa da her zaman ev işlerine ve çocuklarına da vakit ayırır. Peter’ın yaramazlıklarına göz yumar ama sabrı da bir yere kadardır. Ailesinin toparlayıcısı rolündedir.\nEğlenceli Bilgi: Lois’in gençken bir rock grubunda solist olduğu ve vahşi bir geçmişi olduğu bilinmiyor olabilir!", familyGuyImage: UIImage(named: "Lois")!)
        
        let stewie = familyGuy(familyGuyName: "Stewie Griffin", familyGuyComment: "Stewie, ailenin en küçük üyesi, ama en zeki ve komplocu olanıdır. Dünyayı ele geçirme hayalleri kurar, ama çoğu zaman oyuncaklarıyla uğraşırken görülür. Klasik bir kötü karakter gibi konuşur ama aslında bir bebek. Brian ile aralarındaki diyaloglar dizinin en sevilen bölümlerindendir.\nEğlenceli Bilgi: Stewie, aslında bir zamanlar Lois’i öldürme planları yapıyordu!", familyGuyImage: UIImage(named: "Stewie")!)
        
        let brian = familyGuy(familyGuyName: "Brian Griffin", familyGuyComment: "Brian, Griffin ailesinin köpeği olmasına rağmen, neredeyse bir insan gibi davranır. Konuşabilir, yürüyebilir ve kitaplar yazar. Çoğunlukla Stewie ile vakit geçirir ve onun en iyi arkadaşıdır. Ayrıca edebiyat düşkünüdür ve sürekli derin anlamlar peşindedir.\nEğlenceli Bilgi: Brian, ara sıra arabayla gezmeyi sever ama içki içme konusunda biraz abartır!", familyGuyImage: UIImage(named: "Brian")!)
        
        let chris = familyGuy(familyGuyName: "Chris Griffin", familyGuyComment: "Chris, Peter ve Lois’in ikinci çocuğudur. Saf ve biraz ürkek olan Chris, sanatsal yetenekleriyle öne çıkmak ister ama genelde başarısız olur. Stewie kadar zeki değildir, ama ailesine sadıktır ve babasına çok benzer.\nEğlenceli Bilgi: Chris’in en büyük korkularından biri, evin bodrumunda yaşayan maymundur!", familyGuyImage: UIImage(named: "Chris")!)
        
        let meg = familyGuy(familyGuyName: "Meg Griffin", familyGuyComment: "Meg, Griffin ailesinin en az sevilen üyesi gibi hissettirilen kızıdır. Sürekli kendisiyle dalga geçilir, fakat Meg her zaman ailesine sadık kalır. Genelde kendiyle ilgili sorunlar yaşasa da aslında son derece normal bir gençtir.\nEğlenceli Bilgi: Meg’i ilk sezonlarda Mila Kunis seslendirmiyordu!", familyGuyImage: UIImage(named: "Meg")!)
        
        let cleveland = familyGuy(familyGuyName: "Cleveland Brown", familyGuyComment: "Cleveland, Griffin ailesinin uzun zamandır komşusu ve Peter’ın yakın arkadaşıdır. Sakin, yavaş konuşan ve genellikle olaylara mantıklı yaklaşan bir adamdır. Family Guy dizisinden sonra kendi dizisine, The Cleveland Show’a sahip olmuştur. Cleveland, arkadaşları arasında her zaman olgunluğu ve dinginliğiyle bilinir.\nEğlenceli Bilgi: Cleveland’ın banyosunun üst katından birkaç kez yere düştüğü sahneler unutulmazdır!", familyGuyImage: UIImage(named: "Cleveland")!)
        
        let quagmire = familyGuy(familyGuyName: "Glenn Quagmire", familyGuyComment: "Quagmire, Griffin ailesinin diğer komşusu ve Peter’ın bir diğer yakın arkadaşıdır. Kendine özgü “Giggity” repliği ve çapkın tavırlarıyla tanınır. Bir pilot olarak çalışan Quagmire, sürekli olarak kadınlarla ilgili şakalar yapar ve her fırsatta flört eder.\nEğlenceli Bilgi: Quagmire’ın aslında oldukça eski bir yaşı vardır! Doğum yılı 1948 olarak gösteriliyor, yani göründüğünden çok daha yaşlı!", familyGuyImage: UIImage(named: "Quagmire")!)
        
        let joe = familyGuy(familyGuyName: "Joe Swanson", familyGuyComment: "Joe, Griffin ailesinin bir diğer komşusu ve Peter’ın arkadaşıdır. Tecrübeli bir polis memurudur ve tekerlekli sandalye kullanmaktadır. Her zaman cesur, adil ve işine olan tutkusuyla tanınır. Ailesine de çok bağlıdır, özellikle karısı Bonnie ve oğlu Kevin’e.\nEğlenceli Bilgi: Joe, çoğu kez inanılmaz fiziksel yetenekler sergileyerek, tekerlekli sandalyesiyle birçok zorluğu aşmıştır!", familyGuyImage: UIImage(named: "Joe")!)
        
        let bonnie = familyGuy(familyGuyName: "Bonnie Swanson", familyGuyComment: "Bonnie, Joe’nun karısıdır ve yıllar boyunca hamile kaldığı gösterilen karakterlerden biridir. Genelde sakin ve alttan alan bir karakter olarak bilinse de zaman zaman Joe ile evlilikleri hakkında derinlemesine diyalogları olur.\nEğlenceli Bilgi: Bonnie’nin hamileliği tam on sezon boyunca sürmüştü!", familyGuyImage: UIImage(named: "Bonnie")!)
        
        let herbert = familyGuy(familyGuyName: "Herbert", familyGuyComment: "Herbert, Griffin ailesinin yaşlı komşusudur. Sık sık genç Chris’e olan hayranlığıyla bilinir ve bu rahatsız edici saplantısı dizide birçok espriye konu olmuştur. Zayıf, yaşlı ve ince ses tonuyla Herbert, ilginç ve biraz ürkütücü bir karakterdir.\nEğlenceli Bilgi: Herbert’in birden fazla evcil hayvanı vardır, özellikle de köpeği Jesse, Herbert’e en yakın olan hayvandır!", familyGuyImage: UIImage(named: "Herbert")!)
        
        myFamily.append(peter)
        myFamily.append(lois)
        myFamily.append(stewie)
        myFamily.append(brian)
        myFamily.append(chris)
        myFamily.append(meg)
        myFamily.append(cleveland)
        myFamily.append(quagmire)
        myFamily.append(joe)
        myFamily.append(bonnie)
        myFamily.append(herbert)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFamily.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = myFamily[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenfamilyGuy = myFamily[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedfamilyGuy = chosenfamilyGuy
        }
    }
    
}
