//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Luiz Fernando Santiago on 11/8/15.
//  Copyright © 2015 Luiz Fernando Santiago. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        /*
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        
        newUser.setValue("Ralphie", forKey: "username")
        
        newUser.setValue("aaaa", forKey: "password")
        
        do {
            
            try context.save()
        
        
        }catch{
        
            print("There is a problem!")
            
        }

        */
        
        
        let request = NSFetchRequest(entityName: "Users")
        
            //request.predicate = NSPredicate(format: "username = %@", "Ralphie")
        
            request.returnsObjectsAsFaults = false
        
        
        do{
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    //context.deleteObject(result)
                    
                    //result.setValue("Ralphie", forKey: "username")
                    
                    do{
                    try context.save()
                    } catch{
                    }
                    if let username = result.valueForKey("username") as? String{
                    
                        print(username)
                    }
                    //print(result.valueForKey("username")!)
                    //print(result.valueForKey("password")!)
                }
            
            
            }
           
            
            
        }catch{
            
            print("Fecth Failed")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

