//
//  CardServiceHomeView.swift
//  fastgi
//
//  Created by Hegaro on 04/11/2020.
//

import SwiftUI

struct CardServiceHomeView: View {
    //var nombreUsu: String
    var contContacts : Int
    var logo : String
    @State var isSelect:Bool
    @ObservedObject var login = Login()
    @State private var  estado : Bool = false
    //contacts
    @ObservedObject var contactsVM = ContactsViewModel()
    @ObservedObject var contacts = Contacts()
    //
    @Binding var currentBtnEm: BtnEm
    //navegation
    @State private var action:Int? = 0
    let btn: BtnEm
    var body: some View {
        HStack{
            Button(action: {
                //self.login.ruta = "recargas"
                self.currentBtnEm = self.btn
                self.action = 1
                
               // print("este es el current desde el home\(self.currentBtnEm)")
                //print("este es el btn desde el home\(self.btn)")
                //self.contactsVM.getContacts()
               
                /*print("desde el home \(self.contactsVM.listContacts.count)")
                print("cont desde el home \(self.contContacts)")
                //print("desde el home \(self.contContacts)")
                if self.contContacts == 0 {
                    //self.contacts.sendContacts()
                    print("se importo los contctos")
                }else if self.contContacts != 0{
                    print("ya existe contactos")
                }*/
            }) {
                Image(logo)
                    .resizable()
                    .frame(width:80, height: 80)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(  isSelect ? Color("primary") : Color("card"), lineWidth: 4)
                )
            }.buttonStyle(PlainButtonStyle())
            if self.logo == "Entel"{
                NavigationLink(destination: FormLoadCreditView( contContacts: self.contContacts, empresa: self.logo, SelectEm: .Entel, MontoRecarga1: .Btn30, MontoRecarga: ""), tag: 1, selection: self.$action) {
                    EmptyView()
                }
            }else if self.logo == "Viva"{
                NavigationLink(destination: FormLoadCreditView(contContacts: self.contContacts, empresa: self.logo, SelectEm: .Viva, MontoRecarga1: .Btn30, MontoRecarga: ""), tag: 1, selection: self.$action) {
                    EmptyView()
                }
            }else{
                NavigationLink(destination: FormLoadCreditView(contContacts: self.contContacts, empresa: self.logo, SelectEm: .Tigo, MontoRecarga1: .Btn30, MontoRecarga: ""), tag: 1, selection: self.$action) {
                    EmptyView()
                }
            }
        }
            
        .background(Color("card"))
        .cornerRadius(10)
        .frame(maxWidth:.infinity)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 2, y: 3)
       
        
    }

}

struct CardServiceHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CardServiceView(logo: "Entel", isSelect: true, currentBtnEm: .constant(.Entel), btn: .Entel)
       // CardServiceView(logo: "Entel", isSelect: true)
    }
}




