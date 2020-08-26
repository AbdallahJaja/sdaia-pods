//
//  EnsureAppController.swift
//  Tawakkalna
//
//  Created by Aziz Dev on 06/04/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import UIKit

public class EnsureAppController {
    
    public var score: Int = 1
    public var repak: Bool = false

    public init() {
        
        /** Check Jailbrak **/

        #if DEBUG
        repak = false
        #else
        repak = addIntegrityProtection()
        #endif



        //########################################################
        //              How to get Jailbreak Score               #
        // The libinfo() will return a value >= NOTAJAIL         #
        // the score will be the difference between them         #
        //                                                       #
        //              score = libinfo() - NOTAJAIL             #
        //########################################################
        //     let score = libinfo() - NOTAJAIL                  #
        //########################################################
        //                      THE END                          #
        //########################################################

        #if DEBUG
         score = 0
        #else
         score = Int(libinfo())
        #endif

    }
}
