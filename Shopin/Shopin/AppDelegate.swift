//
//  AppDelegate.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Stripe
import OnePaySDK
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        // Override point for customization after application launch.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC: UINavigationController = storyboard.instantiateViewController(withIdentifier: "rootVC") as! UINavigationController
        let leftVC = storyboard.instantiateViewController(withIdentifier: "leftVC") as! LeftViewController
        let rightVC = storyboard.instantiateViewController(withIdentifier: "rightVC") as! RightViewController
        
        let slideMenuController = SlideMenuController(mainViewController: rootVC, leftMenuViewController: leftVC, rightMenuViewController: rightVC)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        
        STPPaymentConfiguration.shared().publishableKey = "pk_test_sjwi1RASft4usEfXU4oNezLe"
        UINavigationBar.appearance().backgroundColor = Color.navColor
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = Color.navColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font : (UIFont(name: "Helvetica", size: 18))!, NSAttributedStringKey.foregroundColor: UIColor.white]

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let sendingAppID = options[.sourceApplication]
        print("source application = \(sendingAppID ?? "Unknown")")
        guard
            let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
            let host = components.host,
            let path = components.path,
            let params = components.queryItems
            else {
                print("URL, host, path o params inválidos: %s", url.absoluteString)
                return false
        }
        if (host == "mi-app" && path == "onepay-result") {
            guard
                let occ = params.first(where: { $0.name == "occ" })?.value,
                let externalUniqueNumber = params.first(where: { $0.name == "externalUniqueNumber" })?.value,
                let status = params.first(where: { $0.name == "status" })?.value
                else {
                    print("Falta un parámetro occ o externalUniqueNumber: %s", url.absoluteString)
                    return false
            }
            // Envia el occ y el externalUniqueNumber a tu backend para que
            // confirme la transacción
            print(occ, externalUniqueNumber)
            self.confirmTransaction(occ: occ, externalUniqueNumber: externalUniqueNumber, status: status)
            
        } else {
            // Otras URLs que quizás maneja tu app
        }
        return false
        
    }
    
    func confirmTransaction(occ: String, externalUniqueNumber: String, status: String) {
        let parameters: Parameters=[
            "occ":occ,
            "externalUniqueNumber":externalUniqueNumber,
            "status":status
        ]
        
        print("parameters = ", parameters)
        
        Alamofire.request(API_ONEPAY_CONFIRM, method: .post, parameters: parameters,encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                if let result = response.result.value {
                    let responseData = result as! NSDictionary
                    //if there is no error
                    
                    if(responseData.value(forKey: "code") as! Int == 200){
                        
                        //getting the user from response
                        let data = responseData.value(forKey: "data") as! NSDictionary
                        
                        print(data)
                        
                    }else if(responseData.value(forKey: "statu") as! Int == 201){
                        let errorMessage = responseData.value(forKey: "message") as! String
                        print(errorMessage)
                        
                    }
                }
                break
            case .failure(let error):
                
                print(error)
            }
        }
    }

}

