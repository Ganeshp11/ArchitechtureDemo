//
//  ScreenText.swift
//  EngagePro
//
//  Created by webwerks on 17/01/19.
//  Copyright © 2019 webwerks. All rights reserved.
//

import Foundation

struct ErrorMessage {
    static let agreementError = "Please click on I Agree button to recieve SMS notifications"
    static let sameMobileError = "You have enter same number as previous one. Please enter different mobile number."
    static let mobileNumberError = "Please enter 10 digit mobile number"
    static let otpInvalid = "Please enter 6 digit OTP sent on your mobile number"
    static let error = "Error"
    static let apiError = "Something went wrong. Please try again later."
    static let errorOcurred = "Error occured while processing request, Please try again"
    static let errorOcurredNew = "Error occured while connecting to the server, Please check your network connection and try again"
    static let barcodeErrorOcurred = "Error occured while processing request, Please try later."
    static let LoginFailed = "Login Failed, Please try again!"
    static let noInternetConnection = "Please check your internet connection and try again."
    static let noContactNumber = "No contact number found"
    static let sessionExpired = "Your session is expired, Please try again!"
    static let userInfoNotFound = "Unable to find User Information"
    static let noDataFound = "Service is Unavailable due to Data Not Found"
    static let dateError = "Error occured while loading Calendar module"
    static let blockedSite = "You are not authorized to visit this website."
    static let jailBroken = "Sorry, your device is jailbroken you are not authorised to use this application."
    static let requestTimeout = "Your request has timed out, Please try later."
    static let inValidDateRangeError = "Please select proper From & To date."
    static let selectMonthError = "You can select maximum upto 3 month, Please select again."
    static let seletctTermError = "Please agree the term and conditions"
    
}
