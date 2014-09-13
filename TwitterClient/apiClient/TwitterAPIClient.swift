//
//  TwitterAPIClient.swift
//  TwitterClient
//
//  Created by Garrett Richards on 9/12/14.
//  Copyright (c) 2014 bluewaves. All rights reserved.
//

import UIKit
import Accounts
import Social

class TwitterAPIClient: NSObject {
   
    var account:ACAccount?
    var username:String? {
        get{
            return account?.username
        }
    }


    init(_ account:ACAccount?)
    {
        if let a = account
        {
            self.account = a
        }
    }
    
    
    class func fetchTwitterAccounts(handler:([AnyObject]?, NSError!)->Void)
    {
        var availableUserAccounts:[AnyObject]?
        let account = ACAccountStore()
        let accountType = account.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        account.requestAccessToAccountsWithType(accountType, options: nil) {
            accessGranted, error in
            if(accessGranted)
            {
                availableUserAccounts = account.accountsWithAccountType(accountType)
            }
            handler(availableUserAccounts, error)
        }
    }
}

