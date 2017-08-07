//
//  ViewController.swift
//  ParseRegex
//
//  Created by Jasmine Simmons on 8/4/17.
//  Copyright © 2017 Jasmine Simmons. All rights reserved.
//

import Cocoa
import AppKit
import Foundation

class ViewController: NSViewController
{

    @IBOutlet weak var textbox1: NSTextField!
    @IBOutlet weak var textbox2: NSTextField!
    @IBOutlet weak var textbox3: NSTextField!
    
    @IBOutlet weak var checkbox: NSTextField!
    
    @IBOutlet weak var match_range_string: NSTextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any?
        {
        didSet
        {
        // Update the view, if already loaded.
        }
    }

    @IBAction func onButtonClicked(_ sender: Any)
    {
        
        let first_string = textbox1.stringValue;
        let second_string = textbox2.stringValue;
        let third_string = textbox3.stringValue;
        
        var firstArray = first_string.components(separatedBy: " ");
        var secondArray = second_string.components(separatedBy: " ");
        var thirdArray = third_string.components(separatedBy: " ");
        
        
        
        let regex_string = checkbox.stringValue;
  
        
        //Get the original string as a substring if it has spaces (if it doesn't have spaces then it 
        //is already a substring of itself.
        if (first_string.contains(" "))
        {
            firstArray.append(first_string);
        }
        if (second_string.contains(" "))
        {
           secondArray.append(second_string);
        }
        if (third_string.contains(" "))
        {
            thirdArray.append(third_string);
        }
        
        
        changeBoxColor(flag: parseRegexArray(the_array: firstArray, regex: regex_string), textbox: textbox1);
        changeBoxColor(flag: parseRegexArray(the_array: secondArray, regex: regex_string), textbox: textbox2);
        changeBoxColor(flag: parseRegexArray(the_array: thirdArray, regex: regex_string), textbox: textbox3);

        
        
 
        ///Using this string as the input to the check_regex box: [A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}
        
    }
    
    
    
    func parseRegexArray(the_array: [String], regex: String) -> Bool {
        let emailRegex = regex as NSString;
        var matchedArray: [String] = [];
        for substring in the_array
        {
            if (NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: substring))
            {
                matchedArray.append(substring);
            }
        }
        if (matchedArray.count != 0)
        {
            let stringRepresentation = matchedArray.joined(separator: " "); //substring" "substring" "substring, etc.
            print(stringRepresentation);
            return true;
        }
        else
        {
            return false;
        }
       
    }
    
    
    func validateEmail(candidate: String, regex: String) -> Bool {
        let emailRegex = regex as NSString;
       // let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}" as NSString;  //in textbox must be: [A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}
        //if (stringValue.isEqual(to: emailRegex))
        /*
        if (stringValue == emailRegex)
        {
            NSLog("YES! SAME.");
        }
        else
        {
          NSLog("NO! DIFFERENT.");
        }
        */
       // String emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
        //NSString emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
      //  NSLog("The regex string is %@ ", regex );
       // NSLog("The email_regex string is %@", emailRegex);
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
    
    
    /*
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
 */
    

    
    //Change the color of the textbox if the input string matches the regex string.
    func checkInput(Input:String, regString:String, textbox:NSTextField)
    {
        if (isValidInput(Input: Input, regString: regString))
        {
            NSLog("Returned true");
            //textbox.backgroundColor = NSColor.green;
        }
        else {
            NSLog("Returned false");
            //textbox.backgroundColor = NSColor.red;
        }
        
    }
    
    //Check if the input string matches the regex string.
    func isValidInput(Input:String, regString:String) -> Bool
    {
        NSLog("in validate input");
        //do
        //{
        let RegEx = regString as NSString;
        return NSPredicate(format: "SELFT MATCHES %@", RegEx).evaluate(with: regString);
        //}
        //catch (Exception e)
        //{
        //NSLog("An eception was caught");
        //}
       
        
    }
    
    //Makes the textbox green if true, makes it red if false.
    func changeBoxColor(flag: Bool, textbox: NSTextField)
    {
        if (flag == true)
        {
            textbox.backgroundColor = NSColor.green;
        }
        else
        {
            textbox.backgroundColor = NSColor.red;
        }
    }
    
    
    /////////Regex inputs: //////////////
    
    //emails: [A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.
    
    //dates with "/" separating, 1,2/1,2/2,4: ^\d{1,2}\/\d{1,2}\/(?:\d{4}|\d{2})$
    //  and dates with "-" separating: ^\d{1,2}\-\d{1,2}\-(?:\d{4}|\d{2})$
    /////now figure out a way to combine these with - AND / : 
    //                          ^\d{1,2}(?:\/|\-)\d{1,2}(?:\/|\-)(?:\d{4}|\d{2})$     <---- this one :)
   // (?:\/|\-) gets either "/" or "-"

    //credit card number: ^(?:X{4,}|x{4,}|\*{4,})\s*\d{4}
    //^(?:X{4,}|x{4,}|\*{4,})\s*\d{4}$
    
    //total amount: ^(\$?)\d{1,}\.\d{2} 
    //works if it starts with a dollar sign ($) or if it is just a decimal number
    // (still need to add the logic to find the max amount from the receipt)
    
    

}

