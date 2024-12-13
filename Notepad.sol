// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract NotepadProject {

    struct Not {
        string baslik;
        string icerik;
    }

    mapping(address => Not[]) private notlar;

    // not ekle, not sil, not sayisi, index'i verilen notu goruntule, notu güncelle

    function notEkle(string memory _baslik, string memory _icerik) public {
        Not memory yeniNot = Not({baslik: _baslik, icerik: _icerik});
        notlar[msg.sender].push(yeniNot);
    }

    function notSil(uint _index) public {
            require(_index < notlar[msg.sender].length);
            notlar[msg.sender][_index] = notlar[msg.sender][(notlar[msg.sender].length - 1)];
            notlar[msg.sender].pop();
    }

    function notGuncelle(uint _index, string memory yeniBaslik, string memory yeniIcerik) public {
        require(_index < notlar[msg.sender].length, "Gecersiz index.");
        Not storage mevcutNot = notlar[msg.sender][_index];
        mevcutNot.baslik = yeniBaslik;
        mevcutNot.icerik = yeniIcerik;
    }

    function notSayisi() public view returns (uint) {
        require(notlar[msg.sender].length > 0, "Notunuz yok.");
        return (notlar[msg.sender]. length);
    }

    function notGoruntule(uint _index) public view returns (string memory baslik, string memory icerik) {
            require(_index <= notlar[msg.sender].length - 1, "Gecersiz index.");
            Not memory mevcutNot = notlar[msg.sender][_index];
            return(mevcutNot.baslik, mevcutNot.icerik);
    }

}
