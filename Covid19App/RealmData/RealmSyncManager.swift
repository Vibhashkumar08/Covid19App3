//
//  RealmSyncManager.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 21/06/21.
//

import Foundation
import RealmSwift


class RealmSingletonManeger : NSObject{
    static let shared = RealmSingletonManeger()
    

    static let configuration = AppConfiguration(
       baseURL: "https://realm.mongodb.com", // Custom base URL
       transport: nil, // Custom RLMNetworkTransportProtocol
       localAppName: "Covid19App",
       localAppVersion: "1",
       defaultRequestTimeoutMS: 30000
    )
    static let app = App(id: "covid19app-ghrrc", configuration: configuration)

    var connection : Realm?
    
}


class RealmSyncManger {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func showAlert()->Void{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let alert = UIAlertController(title: "Realm", message: "Data Syncronise Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        SceneDelegate().window?.rootViewController?.present(alert,animated:true,completion:nil)
    }
    
    func establishConnection(CompletionHandler:@escaping(_ realm:Realm)->Void) -> Void{
        
        let credentials = Credentials.userAPIKey("WMEk3LnhyoaBnLPv1WHNBqyNP44bh8B8xtIOeHj0yHMw5QI2rWrmRo5AVBwpUFqM")
       
        DispatchQueue.global(qos: .background).async {
          
        
        
        RealmSingletonManeger.app.login(credentials: credentials) { (result) in
           
            switch result {
            case .failure(let error):
                print("Login failed: \(error.localizedDescription)")
            case .success(let user):
                print("Successfully logged in as user \(user)")
               
                self.appDelegate.user = user
                self.SyncchangesBetweenDevice(user: user){ (realm) in
                    CompletionHandler(realm)
                }
                // Now logged in, do something with user
                // Remember to dispatch to main if you are doing anything on the UI thread
            }
        }
            
            // do something in main thread after 3 seconds
        }
    }
    
    
    func SyncchangesBetweenDevice(user : User,CompletionHandler:@escaping(_ realm:Realm)->Void) -> Void {
      
      //  let user = app.currentUser
        let partitionValue =  appDelegate.user!.id
        let configuration = user.configuration(partitionValue: partitionValue)
        print("First configuration : ",configuration)
        Realm.asyncOpen(configuration: configuration) { result in
            switch result {
            case .failure(let error):
                print("Failed to open realm: \(error.localizedDescription)")
                // handle error
            case .success(let realm):
                print("Successfully opened realm: \(realm.schema)")
                
                let syncSession = realm.syncSession!
                let token = syncSession.addProgressNotification(
                    for: .upload, mode: .forCurrentlyOutstandingWork) { (progress) in
                    let transferredBytes = progress.transferredBytes
                    let transferrableBytes = progress.transferrableBytes
                    let transferPercent = progress.fractionTransferred * 100
                    print("Uploaded \(transferredBytes)B / \(transferrableBytes)B (\(transferPercent)%)")
                }
                // Upload something
               
                RealmSingletonManeger.shared.connection = realm
                
                CompletionHandler(realm)
                // Use realm
            }
        }
    }
    
    
}
