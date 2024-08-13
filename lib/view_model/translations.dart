import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kitchen_app/model/language_model.dart';

class Languages extends Translations {
  static const LanguageModel english = LanguageModel(
      languagename: "English", languagecode: "en", countrycode: "US");
  static const LanguageModel hindi = LanguageModel(
      languagename: "हिंदी", languagecode: "hi", countrycode: "IN");

  static Locale locale = Locale(english.languagecode, english.countrycode);
  static Locale fallbacklocle = locale;

  static final List<LanguageModel> languages = [english, hindi];

  @override
  Map<String, Map<String, String>> get keys => {
        english.toString(): languagetype.english,
        hindi.toString(): languagetype.hindi,
      };
}

class languagetype {
  static final Map<String, String> english = {
    /// Splash Screen **************** ///
    LanguageConsts.foodlh: "Food like home",
    LanguageConsts.enjoyymt: "Enjoy your meal today!",
    LanguageConsts.gets: "Get Started",
    LanguageConsts.alreadyhaali: "Already have an account? ",
    LanguageConsts.login: "Log In",

    /// Login Screen  *******************///

    LanguageConsts.logIOSU: "Log In or Sign Up",
    LanguageConsts.enterMN: "Enter Mobile Number",
    LanguageConsts.continueText: "Continue",
    LanguageConsts.orCW: "Or continue with",
    LanguageConsts.byCYATO: "By continuing, you agree to our",
    LanguageConsts.termsOS: "Terms of Service",
    LanguageConsts.privacyP: "Privacy Policy",
    LanguageConsts.contentP: "Content Policies",

    /// OTP Verification Screen *****///
    LanguageConsts.otpV: "OTP Verification",
    LanguageConsts.weHSAVCT: "We have sent a verification code to",
    LanguageConsts.didtGTO: "Didn’t get the OTP? ",
    LanguageConsts.ResendSMS: "Resend SMS",
    LanguageConsts.tryMO: "Try more options",

    /// Home Screen ********///
    LanguageConsts.freshFCCJMYDK:
        "Fresh flavors, creative cooking, joyful moments - your dream kitchen!",
    LanguageConsts.searchFD: "Search for dishes",
    LanguageConsts.weeklyR: "WEEKLY REPORT",
    LanguageConsts.daily: "Daily",
    LanguageConsts.Last7Days: "Last 7 Days",
    LanguageConsts.Last30Days: "Last 30 Days",
    LanguageConsts.sales: "Sales",
    LanguageConsts.customers: "Customers",
    LanguageConsts.profit: "Profit",
    LanguageConsts.ongoingO: "ONGOING OFFERS",
    LanguageConsts.twentyPercentOff: "20% OFF",
    LanguageConsts.availTOOYFO: "Avail this order on your first order*",
    LanguageConsts.orderN: "Order Now",
    LanguageConsts.recentO: "RECENT ORDERS",
    LanguageConsts.popularI: "POPULAR ITEMS",
    LanguageConsts.home: "Home",
    LanguageConsts.myMenu: "My Menu",
    LanguageConsts.orders: "Orders",
    LanguageConsts.profile: "Profile",
    LanguageConsts.RemindML: "Remind me later",
    LanguageConsts.UpdateN: "Update Now",

    /// Search Screen ****///
    LanguageConsts.recentS: "Recent Search",
    LanguageConsts.clearA: "Clear All",

    /// Notification *******///
    LanguageConsts.notification: "Notification",
    LanguageConsts.today: "Today",
    LanguageConsts.fiveMA: "min ago",
    LanguageConsts.yourUOWBAOYLA:
        "Your Upcoming order will be arrive on your location at 01:00 PM.",
    LanguageConsts.membershipC: "Membership Cancellation!",
    LanguageConsts.yourMHBCS: "Your membership has been cancelled successfully",
    LanguageConsts.yesterday: "Yesterday",
    LanguageConsts.orderA: "Order Arriving",

    /// My Menu Screen *****///
    LanguageConsts.addM: "Add Meal",
    LanguageConsts.all: "All",
    LanguageConsts.brakefast: "Breakfast",
    LanguageConsts.lunch: "Lunch",
    LanguageConsts.dinner: "Dinner",

    /// Add Meal Screen ****///
    /// Hint Text *********************///
    LanguageConsts.EnterYMN: "Enter Your Meal Name",
    LanguageConsts.EnterYMD: "Enter Your Menu Details",
    LanguageConsts.EnterYD: "Enter Your Description",
    LanguageConsts.EnterYP: "Enter Your Price",
    LanguageConsts.EnterYC: "Enter Your Category",
    LanguageConsts.dragYPHO: "Drag your photo here or",
    LanguageConsts.BrowseFD: "browse from device",
    LanguageConsts.Availability: "Availablity",
    LanguageConsts.mealT: "Meal Tittle",
    LanguageConsts.mealN: "Meal Name",
    LanguageConsts.InsideBM: "Inside Box (Menu)",
    LanguageConsts.description: "Description",
    LanguageConsts.northIM: "North Indian Meal",
    LanguageConsts.includedIS: "Included in Subscription ",
    LanguageConsts.mealA: "Meal Addons",
    LanguageConsts.category: "Category",
    LanguageConsts.price: "Price*",
    LanguageConsts.addmore: "Add More",
    LanguageConsts.jeeraR: "Jeera Rayta",
    LanguageConsts.reset: "Reset",
    LanguageConsts.uploadD: "Upload Data",
    LanguageConsts.sun: "Sun",
    LanguageConsts.mon: "Mon",
    LanguageConsts.tue: "Tue",
    LanguageConsts.wed: "Wed",
    LanguageConsts.thu: "Thu",
    LanguageConsts.fri: "Fri",
    LanguageConsts.sat: "Sat",
    LanguageConsts.veg: "Veg",
    LanguageConsts.Nonvveg: "Non-Veg",
    //Order list screen ****************//
    LanguageConsts.june2: "June 22, 2024",
    //view order screen**************************//
    LanguageConsts.viewD: "View Details",
    LanguageConsts.tiffinBP: "Tiffin Base Price",
    LanguageConsts.addons: "+ Addons",
    LanguageConsts.Edit: "Edit",
    LanguageConsts.roti: "Roti",
    LanguageConsts.dahi: "Dahi",
    LanguageConsts.decline: "Decline",
    LanguageConsts.accept: "Accept",
    LanguageConsts.areYSYWTD: "Are you sure you want to Decline?",
    LanguageConsts.cancel: "Cancel",
    LanguageConsts.yesD: "Yes, Decline",

    /// Kitchen profile ******************************** ///
    LanguageConsts.kitchenP: "Kitchen Profile",
    LanguageConsts.tiffinW: "Tiffin Wala",
    // "B-677, Sector 14, Hisar": "B-677, Sector 14, Hisar",
    LanguageConsts.editP: "Edit Profile",
    LanguageConsts.manageA: "Manage Address",
    LanguageConsts.Contactssupp: " Contact & Supports",

    LanguageConsts.myC: "My Customers",
    LanguageConsts.offers: "Offers",
    LanguageConsts.transactions: "Transactions",
    LanguageConsts.myB: "My Bill",

    /// offers screen *****************************************///
    LanguageConsts.addOffers: "Add Offers",
    LanguageConsts.promoCT: "Promo Code Tittle",
    LanguageConsts.applyO: "Apply On",
    LanguageConsts.kitchen40: "KITCHEN40",
    LanguageConsts.above200: "Above ₹200",
    LanguageConsts.discount: "Discount",
    LanguageConsts.fortyPercent: "40%",
    LanguageConsts.validity: "Validity",
    LanguageConsts.fromDDMMYY: "From: DD/MM/YY",
    LanguageConsts.toDDMMYY: "To: DD/MM/YY",
    LanguageConsts.addFD: "Add Festival Discount",
    LanguageConsts.festivalT: "Festival Tittle",
    LanguageConsts.diwali: "DIWALI",
    LanguageConsts.above150: "Above ₹150",
    LanguageConsts.thirtyPercent: "30%",

    /// edit profile screen ******************** ///
    LanguageConsts.name: "Name",
    LanguageConsts.mobile: "Mobile",
    LanguageConsts.update: "UPDATE",
    LanguageConsts.email: "Email",
    LanguageConsts.updateP: "Update Profile",
    // Application setting screen ****************************///
    LanguageConsts.applicationS: "Application Setting",
    LanguageConsts.changeT: "Change Theme",
    LanguageConsts.language: "Language",

    //Change theme Screen  *********************************//
    LanguageConsts.light: "Light",
    LanguageConsts.dark: "Dark",
    LanguageConsts.systemD: "System Default",
    LanguageConsts.changeLS: "Change Language Screen",
    LanguageConsts.english: "English",
    LanguageConsts.hindi: "Hindi",
    LanguageConsts.telugu: "Telgu",
    LanguageConsts.marathi: "Marathi",
    //Change Notification Screen ************************* //
    LanguageConsts.sound: "Sound",
    LanguageConsts.vibrate: "Vibrate",
    LanguageConsts.mute: "Mute",
    //Manage Address Screen *************************** //
    LanguageConsts.addA: "Add Address",
    LanguageConsts.savedA: "SAVED ADDRESS",
    //Privacy Policy Screen *********************** //
    LanguageConsts.privacyPOCN: "Privacy Policy of Company Name",
    LanguageConsts.informationCAU: "Information Collection and Use",
    LanguageConsts.logD: "Log Data",
    LanguageConsts.cookies: "Cookies",
    LanguageConsts.Customersl: "Customers List",
    LanguageConsts.Customersd: "Customers Details",
    //************* */ logout****************************
    LanguageConsts.Logout: "Logout?",
    LanguageConsts.YesLogout: "Yes, Logout",
    LanguageConsts.Areysywtl: "Are you sure you want to Logout?",
    ////-----------------Customer Detail Screen----------------
    LanguageConsts.CustomerDetails: "Customer Details",
    LanguageConsts.SubscriptionD: "Subscription Duration",
    LanguageConsts.PlanD: "Plan Detail",
    LanguageConsts.GrandT: "Grand Total",
    LanguageConsts.GenerateI: "Generate Invoice",

    ///--------------------EixtAppDailog---------------
    LanguageConsts.ConfirmEixt: "Confirm Eixt",
    LanguageConsts.Areysywttea: "Are you sure you want to the exit app?",
    LanguageConsts.YesExit: "Yes, Exit",

///// ------------------------Download Report--------------------------

    LanguageConsts.CurrentW: "Current Week",
    LanguageConsts.LastW: "Last Week",
    LanguageConsts.DownloadReport: "Download Report",
    LanguageConsts.Download: "Download",

    /// View item Details *********************///
    LanguageConsts.back: "Back",
    ////------------------
    ///    //--------------------Manage Address----------------------------
    LanguageConsts.Mansftasa: "Search for the available service area...",
    LanguageConsts.HouseNoBN: "House No. / Building Name",
    LanguageConsts.AddressT: "Address Tittle",
    LanguageConsts.ContactN: "Contact Name",
    LanguageConsts.ContactNumber: "Contact Number",

    ///-----------------------
    LanguageConsts.AvailableB: 'Available Balance',
    LanguageConsts.Received: 'Received',
    LanguageConsts.Receivable: 'Receivable',
    LanguageConsts.Sent: 'Sent',
    LanguageConsts.ThisWeek: 'This Week',
    LanguageConsts.ThisMonth: 'This Month',

    /// Offer Screen **************///
    LanguageConsts.SelectOT: 'Select Offer Type',
    LanguageConsts.Generaldiscount: 'General Discount',
    LanguageConsts.FirstTCD: 'First-Time Customer Discount',
    LanguageConsts.TieredD: 'Tiered Discount',
    LanguageConsts.BundleD: 'Bundle Discount',
    LanguageConsts.ShowWB: 'Show with banner',
    LanguageConsts.AboutD: 'About Discount',
    LanguageConsts.CouponC: 'Coupon Code',
    LanguageConsts.EnterCH: 'Enter code here',
    LanguageConsts.EnterYOD: 'Enter your offer details',
    LanguageConsts.Benefits: 'Benefits',
    LanguageConsts.DiscountV: 'Discount Value',
    LanguageConsts.DiscountU: 'Discount Unit',
    LanguageConsts.Percentage: 'Percentage',
    LanguageConsts.ValidF: 'Valid From',
    LanguageConsts.ValidT: 'Valid Till',
    LanguageConsts.UsageD: 'Usage Details',
    LanguageConsts.TotalU: 'Total Uses',
    LanguageConsts.UsesPC: 'Uses per customer',
    LanguageConsts.SpendV: 'Spend Value',
    LanguageConsts.MinimumSV: 'Minimum spend value',
    LanguageConsts.BundleT: 'Bundle Type',
    LanguageConsts.Weekly: 'Weekly',

    /// bottam bar *******************///
    LanguageConsts.chat: 'Chat',

    /// My Bill Screen ************///
    LanguageConsts.Details: 'Details',
    LanguageConsts.SubT: 'Sub Total',
    LanguageConsts.Tax: 'Tax',
    LanguageConsts.BillNo: 'Bill No:',
    LanguageConsts.BillD: 'Bill Duration',
    LanguageConsts.BillB: 'Bill Breakout',
    LanguageConsts.QTY: 'QTY',
  };

  static Map<String, String> hindi = {
    LanguageConsts.foodlh: "घर जैसा खाना",
    LanguageConsts.enjoyymt: "आज अपने भोजन का आनंद लें!",
    LanguageConsts.gets: "शुरू करें",
    LanguageConsts.alreadyhaali: "पहले से ही खाता है? ",
    LanguageConsts.login: "लॉग इन करें",

    /// Login Screen  *******************///

    LanguageConsts.logIOSU: "लॉग इन या साइन अप करें",
    LanguageConsts.enterMN: "मोबाइल नंबर दर्ज करें",
    LanguageConsts.continueText: "जारी रखें",
    LanguageConsts.orCW: "या इसके साथ जारी रखें",
    LanguageConsts.byCYATO: "जारी रखते हुए, आप हमारी शर्तों से सहमत होते हैं",
    LanguageConsts.termsOS: "सेवा की शर्तें",
    LanguageConsts.privacyP: "गोपनीयता नीति",
    LanguageConsts.contentP: "सामग्री नीतियां",

    /// OTP Verification Screen *****///
    LanguageConsts.otpV: "ओटीपी सत्यापन",
    LanguageConsts.weHSAVCT: "हमने सत्यापन कोड भेजा है",
    LanguageConsts.didtGTO: "ओटीपी नहीं मिला? ",
    LanguageConsts.ResendSMS: "एसएमएस पुनः भेजें",
    LanguageConsts.tryMO: "अधिक विकल्प आज़माएं",

    /// Home Screen ********///
    LanguageConsts.freshFCCJMYDK:
        "ताजे स्वाद, रचनात्मक खाना पकाना, आनंददायक पल - आपका सपना रसोई!",
    LanguageConsts.searchFD: "व्यानजन खोजें",
    LanguageConsts.weeklyR: "साप्ताहिक रिपोर्ट",
    LanguageConsts.daily: "दैनिक",
    LanguageConsts.Last7Days: "पिछले 7 दिन",
    LanguageConsts.Last30Days: "पिछले 30 दिन",
    LanguageConsts.sales: "बिक्री",
    LanguageConsts.customers: "ग्राहक",
    LanguageConsts.profit: "लाभ",
    LanguageConsts.ongoingO: "चल रहे ऑफर",
    LanguageConsts.twentyPercentOff: "20% की छूट",
    LanguageConsts.availTOOYFO: "यह ऑर्डर अपनी पहली ऑर्डर पर पाएं*",
    LanguageConsts.orderN: "अभी ऑर्डर करें",
    LanguageConsts.recentO: "हाल के ऑर्डर",
    LanguageConsts.popularI: "लोकप्रिय आइटम",
    LanguageConsts.home: "मुख्य पृष्ठ",
    LanguageConsts.myMenu: "मेरा मेनू",
    LanguageConsts.orders: "ऑर्डर",
    LanguageConsts.profile: "प्रोफ़ाइल",
    LanguageConsts.RemindML: "Remind me later",
    LanguageConsts.UpdateN: "प्रोफ़ाइल",

    /// Search Screen ****///
    LanguageConsts.recentS: "हाल की खोज",
    LanguageConsts.clearA: "सभी साफ करें",

    /// Notification *******///
    LanguageConsts.notification: "सूचना",
    LanguageConsts.today: "आज",
    LanguageConsts.fiveMA: "5 मिनट पहले",
    LanguageConsts.yourUOWBAOYLA:
        "आपका आगामी ऑर्डर 01:00 बजे आपके स्थान पर पहुंचेगा।",
    LanguageConsts.membershipC: "सदस्यता रद्द!",
    LanguageConsts.yourMHBCS: "आपकी सदस्यता सफलतापूर्वक रद्द कर दी गई है",
    LanguageConsts.yesterday: "कल",
    LanguageConsts.orderA: "ऑर्डर आ रहा है",

    /// My Menu Screen *****///
    LanguageConsts.addM: "भोजन जोड़ें",
    LanguageConsts.all: "सभी",
    LanguageConsts.brakefast: "नाश्ता",
    LanguageConsts.lunch: "दोपहर का भोजन",
    LanguageConsts.dinner: "रात का भोजन",

    /// Add Meal Screen ****///
    /// Hint Text *********************///
    LanguageConsts.EnterYMN: "अपना भोजन नाम दर्ज करें",
    LanguageConsts.EnterYMD: "अपना मेनू विवरण दर्ज करें",
    LanguageConsts.EnterYD: "अपना विवरण दर्ज करें",
    LanguageConsts.EnterYP: "अपना मूल्य दर्ज करें",
    LanguageConsts.EnterYC: "अपना श्रेणी दर्ज करें",
    LanguageConsts.dragYPHO: "अपनी फोटो यहां खींचें या",
    LanguageConsts.BrowseFD: "डिवाइस से ब्राउज़ करें",
    LanguageConsts.Availability: "उपलब्धता",
    LanguageConsts.mealT: "भोजन शीर्षक",
    LanguageConsts.mealN: "भोजन नाम",
    LanguageConsts.InsideBM: "बॉक्स के अंदर (मेनू)",
    LanguageConsts.description: "विवरण",
    LanguageConsts.northIM: "उत्तर भारतीय भोजन",
    LanguageConsts.includedIS: "सदस्यता में शामिल",
    LanguageConsts.mealA: "भोजन ऐडऑन",
    LanguageConsts.category: "श्रेणी",
    LanguageConsts.price: "मूल्य*",
    LanguageConsts.addmore: "और जोड़ें",
    LanguageConsts.jeeraR: "जीरा रायता",
    LanguageConsts.reset: "रीसेट करें",
    LanguageConsts.uploadD: "डेटा अपलोड करें",
    LanguageConsts.sun: "रवि",
    LanguageConsts.mon: "सोम",
    LanguageConsts.tue: "मंगल",
    LanguageConsts.wed: "बुध",
    LanguageConsts.thu: "गुरु",
    LanguageConsts.fri: "शुक्र",
    LanguageConsts.sat: "शनि",
    LanguageConsts.veg: "शाकाहारी",
    LanguageConsts.Nonvveg: "मांसाहारी",

//Order list screen ****************//
    LanguageConsts.june2: "22 जून, 2024",

//view order screen     view item details screen   **************************//
    LanguageConsts.viewD: "विवरण देखें",
    LanguageConsts.tiffinBP: "टिफिन बेस प्राइस",
    LanguageConsts.addons: "+ ऐडऑन",
    LanguageConsts.Edit: "बदलाव करें",
    LanguageConsts.roti: "रोटी",
    LanguageConsts.dahi: "दही",
    LanguageConsts.decline: "अस्वीकार",
    LanguageConsts.accept: "स्वीकार करें",
    LanguageConsts.areYSYWTD: "क्या आप वाकई अस्वीकार करना चाहते हैं?",
    LanguageConsts.cancel: "रद्द करें",
    LanguageConsts.yesD: "हां, अस्वीकार करें",

    /// Kitchen profile ******************************** ///
    LanguageConsts.kitchenP: "रसोई प्रोफ़ाइल",
    LanguageConsts.tiffinW: "टिफिन वाला",
    LanguageConsts.editP: "प्रोफ़ाइल संपादित करें",
    LanguageConsts.manageA: "पता प्रबंधित करें",
    LanguageConsts.Contactssupp: "संपर्क और समर्थन",

    LanguageConsts.myC: "मेरे ग्राहक",
    LanguageConsts.offers: "ऑफर",
    LanguageConsts.transactions: "लेनदेन",

    /// offers screen *****************************************///
    LanguageConsts.addOffers: "ऑफर जोड़ें",
    LanguageConsts.promoCT: "प्रोमो कोड शीर्षक",
    LanguageConsts.applyO: "लागू करें",
    LanguageConsts.kitchen40: "KITCHEN40",
    LanguageConsts.above200: "₹200 से ऊपर",
    LanguageConsts.discount: "छूट",
    LanguageConsts.fortyPercent: "40%",
    LanguageConsts.validity: "वैधता",
    LanguageConsts.fromDDMMYY: "से: DD/MM/YY",
    LanguageConsts.toDDMMYY: "तक: DD/MM/YY",
    LanguageConsts.addFD: "त्योहार की छूट जोड़ें",
    LanguageConsts.festivalT: "त्योहार शीर्षक",
    LanguageConsts.diwali: "दीवाली",
    LanguageConsts.above150: "₹150 से ऊपर",
    LanguageConsts.thirtyPercent: "30%",

    /// edit profile screen ******************** ///
    LanguageConsts.name: "नाम",
    LanguageConsts.mobile: "मोबाइल",
    LanguageConsts.update: "अपडेट करें",
    LanguageConsts.email: "ईमेल",
    LanguageConsts.updateP: "प्रोफ़ाइल अपडेट करें",

// Application setting screen ****************************///
    LanguageConsts.applicationS: "एप्लिकेशन सेटिंग",
    LanguageConsts.changeT: "थीम बदलें",
    LanguageConsts.language: "भाषा",

//Change theme Screen  *********************************//
    LanguageConsts.light: "लाइट",
    LanguageConsts.dark: "डार्क",
    LanguageConsts.systemD: "सिस्टम डिफ़ॉल्ट",
    LanguageConsts.changeLS: "भाषा बदलें",
    LanguageConsts.english: "अंग्रेज़ी",
    LanguageConsts.hindi: "हिंदी",
    LanguageConsts.telugu: "तेलुगु",
    LanguageConsts.marathi: "मराठी",

//Change Notification Screen ************************* //
    LanguageConsts.sound: "ध्वनि",
    LanguageConsts.vibrate: "वाइब्रेट",
    LanguageConsts.mute: "म्यूट",

//Manage Address Screen *************************** //
    LanguageConsts.addA: "पता जोड़ें",
    LanguageConsts.savedA: "सहेजा हुआ पता",

//Privacy Policy Screen *********************** //
    LanguageConsts.privacyPOCN: "कंपनी नाम की गोपनीयता नीति",
    LanguageConsts.informationCAU: "सूचना संग्रहण और उपयोग",
    LanguageConsts.logD: "लॉग डेटा",
    LanguageConsts.cookies: "कुकीज़",
    LanguageConsts.Customersl: "ग्राहक सूची",
    LanguageConsts.Customersd: "ग्राहक विवरण",

//************* */ logout****************************
    LanguageConsts.Logout: "लॉगआउट?",
    LanguageConsts.YesLogout: "हां, लॉगआउट",
    LanguageConsts.Areysywtl: "क्या आप वाकई लॉगआउट करना चाहते हैं?",

////-----------------Customer Detail Screen----------------
    LanguageConsts.CustomerDetails: "ग्राहक विवरण",
    LanguageConsts.SubscriptionD: "सदस्यता अवधि",
    LanguageConsts.PlanD: "योजना विवरण",
    LanguageConsts.GrandT: "कुल योग",
    LanguageConsts.GenerateI: "चालान जनरेट करें",

    ///--------------------EixtAppDailog---------------
    LanguageConsts.ConfirmEixt: "एप्लिकेशन से बाहर निकलें",
    LanguageConsts.Areysywttea:
        "क्या आप वाकई एप्लिकेशन से बाहर निकलना चाहते हैं?",
    LanguageConsts.YesExit: "हां, बाहर निकलें",

///// ------------------------Download Report--------------------------

    LanguageConsts.CurrentW: "वर्तमान सप्ताह",
    LanguageConsts.LastW: "पिछला सप्ताह",
    LanguageConsts.DownloadReport: "रिपोर्ट डाउनलोड करें",
    LanguageConsts.Download: "डाउनलोड",

    /// View item Details *********************///
    LanguageConsts.back: "वापस",
    //--------------------Manage Address----------------------------
    LanguageConsts.Mansftasa: "उपलब्ध सेवा क्षेत्र खोजें...",
    LanguageConsts.HouseNoBN: "मकान संख्या/भवन का नाम",
    LanguageConsts.AddressT: "पता शीर्षक",
    LanguageConsts.ContactN: "संपर्क नाम",
    LanguageConsts.ContactNumber: "संपर्क संख्या",
    //--------------------
    LanguageConsts.AvailableB: 'उपलब्ध शेष राशि',
    LanguageConsts.Received: 'प्राप्त किया',
    LanguageConsts.Receivable: 'प्राप्त करने योग्य',
    LanguageConsts.Sent: 'भेजा गया',
    LanguageConsts.ThisWeek: 'इस सप्ताह',
    LanguageConsts.ThisMonth: 'इस महीने',

    /// Offer Screen **************///

    LanguageConsts.myB: 'मेरा बिल',
    LanguageConsts.SelectOT: 'ऑफर का प्रकार चुनें',
    LanguageConsts.Generaldiscount: 'सामान्य छूट',
    LanguageConsts.FirstTCD: 'पहली बार ग्राहक छूट',
    LanguageConsts.TieredD: 'स्तरीय छूट',
    LanguageConsts.BundleD: 'बंडल छूट',
    LanguageConsts.ShowWB: 'बैनर के साथ दिखाएँ',
    LanguageConsts.AboutD: 'छूट के बारे में',
    LanguageConsts.CouponC: 'कूपन कोड',
    LanguageConsts.EnterCH: 'यहाँ कोड दर्ज करें',
    LanguageConsts.EnterYOD: 'अपना ऑफ़र विवरण दर्ज करें',
    LanguageConsts.Benefits: 'फ़ायदे',
    LanguageConsts.DiscountV: 'छूट मूल्य',
    LanguageConsts.DiscountU: 'छूट इकाई',
    LanguageConsts.Percentage: 'प्रतिशत',
    LanguageConsts.ValidF: 'से मान्य',
    LanguageConsts.ValidT: 'तक मान्य',
    LanguageConsts.UsageD: 'उपयोग विवरण',
    LanguageConsts.TotalU: 'कुल उपयोग',
    LanguageConsts.UsesPC: 'प्रति ग्राहक उपयोग',
    LanguageConsts.SpendV: 'मूल्य खर्च करें',
    LanguageConsts.MinimumSV: 'न्यूनतम व्यय मूल्य',
    LanguageConsts.BundleT: 'बंडल प्रकार',
    LanguageConsts.Weekly: 'साप्ताहिक',

    /// bottam bar *******************///
    LanguageConsts.chat: 'चैट्‌',

    /// My Bill screen ***********///
    LanguageConsts.Details: 'विवरण',
    LanguageConsts.SubT: 'कुल योग',
    LanguageConsts.Tax: 'टैक्स',
    LanguageConsts.BillNo: 'बिल संख्या',
    LanguageConsts.BillD: 'बिल अवधि',
    LanguageConsts.BillB: 'बिल ब्रेकआउट',
    LanguageConsts.QTY: 'मात्रा',
    LanguageConsts.Total: 'कुल',

    /// Setup Business Profile ******************///
    LanguageConsts.SetBP: 'व्यवसाय प्रोफ़ाइल सेटअप करें',
    LanguageConsts.KitchenN: 'रसोई का नाम',
    LanguageConsts.TiffinS: 'टिफ़िन सेवा',
    LanguageConsts.EmailA: 'मेल पता',
    LanguageConsts.example: 'example@.com',
    LanguageConsts.example: 'example@.com',

    /// Chat Screen *************///
  };
}

class LanguageConsts {
  static const String foodlh = "Food like home";
  static const String enjoyymt = "Enjoy your meal today!";
  static const String gets = "Get Started";
  static const String alreadyhaali = "Already have an account? ";
  static const String login = "Log In";
  static const String logIOSU = "Log In or Sign Up";
  static const String enterMN = "Enter Mobile Number";
  static const String continueText = "Continue";
  static const String orCW = "Or continue with";
  static const String byCYATO = "By continuing, you agree to our";
  static const String termsOS = "Terms of Service";
  static const String privacyP = "Privacy Policy";
  static const String contentP = "Content Policies";
  static const String otpV = "OTP Verification";
  static const String weHSAVCT = "We have sent a verification code to";
  static const String didtGTO = "Didn’t get the OTP? ";
  static const String ResendSMS = "Resend SMS";
  static const String tryMO = "Try more options";

  /// Home Screen **************///
  static const String RemindML = "Remind me later";
  static const String UpdateN = "Update Now";

  static const String freshFCCJMYDK =
      "\"Fresh flavors, creative cooking, joyful moments - your dream kitchen!\"";
  static const String searchFD = "Search for dishes";
  static const String weeklyR = "WEEKLY REPORT";
  static const String daily = "Daily";
  static const String Last7Days = "Last 7 Days";
  static const String Last30Days = "Last 30 Days";
  static const String sales = "Sales";
  static const String customers = "Customers";
  static const String profit = "Profit";
  static const String ongoingO = "ONGOING OFFERS";
  static const String twentyPercentOff = "20% OFF";
  static const String availTOOYFO = "Avail this order on your first order*";
  static const String orderN = "Order Now";
  static const String recentO = "RECENT ORDERS";
  static const String popularI = "POPULAR ITEMS";
  static const String home = "Home";
  static const String myMenu = "My Menu";
  static const String orders = "Orders";
  static const String profile = "Profile";
  static const String recentS = "Recent Search";
  static const String clearA = "Clear All";
  static const String notification = "Notification";
  static const String today = "Today";
  static const String orderA = "Order Arriving";
  static const String fiveMA = "5 min ago";
  static const String yourUOWBAOYLA =
      "Your Upcoming order will be arrive on your location at 01:00 PM.";
  static const String membershipC = "Membership Cancellation!";
  static const String yourMHBCS =
      "Your membership has been cancelled successfully";
  static const String yesterday = "Yesterday";

  /// Add meal screen **********  ///
  static const String addM = "Add Meal";
  static const String sun = "Sun";
  static const String mon = "Mon";
  static const String tue = "Tue";
  static const String wed = "Wed";
  static const String thu = "Thu";
  static const String fri = "Fri";
  static const String sat = "Sat";
  static const String all = "All";
  static const String veg = "Veg";
  static const String Nonvveg = "Non-Veg";
  static const String breakfast = "Breakfast";
  static const String lunch = "Lunch";
  static const String dinner = "Dinner";
  static const String dragYPHO = "Drag your photo here or";
  static const String BrowseFD = "browser from device";
  static const String Availability = "Availability";
  static const String brakefast = "Brakefast";
  static const String mealT = "Meal Title";
  static const String mealN = "Meal Name";
  static const String InsideBM = "Inside Box (Menu)";
  static const String description = "Description";

  /// Hint Txt Add meal Screen *****///
  static const String EnterYMN = "Enter Your Meal Name";
  static const String EnterYMD = "Enter Your Menu Details";
  static const String EnterYD = "Enter Your Description";
  static const String EnterYP = "Enter Price";
  static const String EnterYC = "Enter Your Category";
  static const String northIM = "North Indian Meal";
  static const String includedIS = "Included in Subscription";
  static const String mealA = "Meal Addons";
  static const String category = "Category";
  static const String price = "Price*";
  static const String addmore = "Add More";
  static const String jeeraR = "Jeera Rayta";
  static const String reset = "Reset";
  static const String uploadD = "Upload Data";
  static const String june2 = "June 22, 2024";
  static const String viewD = "View Details";

  /// Item details screen and order details screen*************************///

  static const String tiffinBP = "Tiffin Base Price";
  static const String Edit = "Edit";
  static const String addons = "+ Addons";
  static const String roti = "Roti";
  static const String dahi = "Dahi";
  static const String decline = "Decline";
  static const String accept = "Accept";
  static const String areYSYWTD = "Are you sure you want to Decline?";
  static const String cancel = "Cancel";
  static const String yesD = "Yes, Decline";
  static const String kitchenP = "Kitchen Profile";
  static const String tiffinW = "Tiffin Wala";
  static const String address = "B-677, Sector 14, Hisar";
  static const String editP = "Edit Profile";
  static const String manageA = "Manage Address";
  static const String myC = "My Customers";
  static const String offers = "Offers";
  static const String transactions = "Transactions";
  static const String Contactssupp = "Contact & Support";
  static const String Logout = "Logout?";
  static const String Customersl = "Customers List";
  static const String Customersd = "Customers Details";
  static const String addOffers = "Add Offers";
  static const String addPC = "Add Promo code";
  static const String promoCT = "Promo Code Tittle";
  static const String applyO = "Apply On";
  static const String kitchen40 = "KITCHEN40";
  static const String above200 = "Above ₹200";
  static const String discount = "Discount";
  static const String fortyPercent = "40%";
  static const String validity = "Validity";
  static const String fromDDMMYY = "From: DD/MM/YY";
  static const String toDDMMYY = "To: DD/MM/YY";
  static const String addFD = "Add Festival Discount";
  static const String festivalT = "Festival Tittle";
  static const String diwali = "DIWALI";
  static const String above150 = "Above ₹150";
  static const String thirtyPercent = "30%";
  static const String name = "Name";
  static const String mobile = "Mobile";
  static const String update = "UPDATE";
  static const String email = "Email";
  static const String updateP = "Update Profile";
  static const String applicationS = "Application Setting";
  static const String changeT = "Change Theme";
  static const String language = "Language";
  static const String light = "Light";
  static const String dark = "Dark";
  static const String systemD = "System Default";
  static const String changeLS = "Change Language Screen";
  static const String english = "English";
  static const String hindi = "Hindi";
  static const String telugu = "Telugu";
  static const String marathi = "Marathi";
  static const String sound = "Sound";
  static const String vibrate = "Vibrate";
  static const String mute = "Mute";
  static const String addA = "Add Address";
  static const String savedA = "SAVED ADDRESS";
  static const String privacyPOCN = "Privacy Policy of Company Name";
  static const String informationCAU = "Information Collection and Use";
  static const String logD = "Log Data";
  static const String cookies = "Cookies";
  static const String YesLogout = "Yes, Logout";
  static const String Areysywtl = "Are you sure you want to Logout?";
  static const String CustomerDetails = "Customer Details";
  static const String SubscriptionD = "Subscription Duration";
  static const String PlanD = "Plan Detail";
  static const String GrandT = "Grand Total";
  static const String GenerateI = "Generate Invoice";
  static const String ConfirmEixt = "Confirm Eixt";
  static const String Areysywttea = "Are you sure you want to the exit app?";
  static const String YesExit = "Yes, Exit";
  static const String CurrentW = "Current Week";
  static const String LastW = "Last Week";
  static const String DownloadReport = "Download Report";
  static const String Download = "Download";
  static const String ManageA = "Manage Address";
  static const String Mansftasa = "Search for the available service area...";
  static const String HouseNoBN = "House No. / Building Name";
  static const String AddressT = "Address Tittle";
  static const String ContactN = "Contact Name";
  static const String ContactNumber = "Contact Number";
  static const String AvailableB = "Available Balance";
  static const String Received = "Received";
  static const String Receivable = "Receivable";
  static const String Sent = "Sent";
  static const String ThisWeek = "This Week";
  static const String ThisMonth = "This Month";

  /// bottam bar ***************///
  static const String chat = "Chat";

  /// View item Details *********************///
  static const String back = "Back";
  static const String myB = "My Bill";

  /// Offers Screen *********************///

  static const String AddOffers = "Add Offers";

  /// Dropdown const *****///
  static const String SelectOT = "Select Offer Type";
  static const String Generaldiscount = "General Discount";
  static const String FirstTCD = "First-Time Customer Discount";
  static const String TieredD = "Tiered Discount";
  static const String BundleD = "Bundle Discount";

  /// about discount *******///
  static const String ShowWB = "Show with banner";
  static const String AboutD = "About Discount";
  static const String CouponC = "Coupon Code";
  static const String EnterCH = "Enter code here";
  static const String EnterYOD = "Enter your offer details";

  /// Benifits ******* ///
  static const String Benefits = "Benefits";
  static const String DiscountV = "Discount Value";
  static const String DiscountU = "Discount Unit";
  static const String Percentage = "Percentage";
  static const String ValidF = "Valid From";
  static const String ValidT = "Valid Till";

  /// Usage Details *******///
  static const String UsageD = "Usage Details";
  static const String TotalU = "Total Uses";
  static const String UsesPC = "Uses per customer";
  static const String SpendV = "Spend Value";
  static const String MinimumSV = "Minimum spend value";
  static const String BundleT = "Bundle Type";
  static const String Weekly = "Weekly";

  /// My Bill screen ***********///
  static const String BillNo = "Bill No:";
  static const String BillD = "Bill Duration:";
  static const String Details = "Details";
  static const String BillB = "Bill Breakout";
  static const String QTY = "QTY";
  static const String Total = "Total";
  static const String SubT = "Sub Total";
  static const String Tax = "Tax";

  /// Setup Business Profile ************///
  static const String SetBP = "Setup Business Profile";
  static const String KitchenN = "Kitchen Name";
  static const String TiffinS = "Tiffin Service";
  static const String EmailA = "E-mail Address";
  static const String example = "example@.com";
  static const String PhoneN = "+916212358552";
  static const String Address = "Address";
  static const String Street = "Street";
  static const String Country = "Country";
  static const String India = "India";
  static const String State = "State";
  static const String Haryana = "Haryana";
  static const String City = "City";
  static const String Hisar = "Hisar";
  static const String PostalC = "Postal Code";
  static const String PostalH = "125001";
  static const String Latitude = "Latitude";
  static const String Longitude = "Longitude";
  static const String SocialM = "Social Media";
  static const String Facebook = "Facebook";
  static const String OperatingH = "Operating Hours";
  static const String Day = "Day";
  static const String To = "To:";

  /// Chat Screen ********///
  static const String Dabavala = "DABA VALA";
}
