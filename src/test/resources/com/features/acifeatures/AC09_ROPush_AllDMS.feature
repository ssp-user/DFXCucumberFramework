## This is the apart  of the regression test
@AC09 @DMSOnly_ACI
Feature: Advisor Check In Morning Health Check on Prod2 RO push
  Description : The purpose of this feature verify the AC function work proply on Push RO in Prod2 with diversity
  DMS name and VINs Data

  @AC-MorningCheck-Pord2-Dummy
  Scenario Outline: Advisor check Morning Check on RO push for <DMS> Dummy
    Description :

    Given I launch browser "chrome" in "GUI" and open "<URL>"
    And I set "<DMS>" to the 'DMS'
    When I login the Application as User "automation" and password "dealerfxqa"
    And I move to switch dealer window on 'Home' page
    And I select the Dealer with "<DealerName>" and "<DealerCode>" in Dealer Page
    Then I verify Page Info "ng-scope" and Browser log in 'Advisor Check-In' page
    And I choose "<Application>" application from the 'Home' page
    #search by the customer
    When I search 'VinNumber' "<VIN>" on 'Advisor Check-In' page
    And I deal with Customer Information PopUp in 'CUSTOMER' page
    Then I verify Mandatory Message Displayed in Fields on 'CUSTOMER' page
    And I verify "NEXT" button is not clickable if 'Odometer' field is empty
    When I enter "<Odometer>" in "ODOMETER" field on 'CUSTOMER' page
    And I click "NEXT" button on 'CUSTOMER' page
    And I click "NEXT" button on 'CONCERN' page
    And I click "NEXT" button on 'HISTORY' page
    And I keep Pre-Selected or "check" "multi-point inspection" or first in 'FACTORY SCHEDULED MAINTENANCE' Tab if No Pre-selected
    And I click "OTHER FACTORY MAINTENANCE" tab on 'SERVICES' Page
    And I click "REMOVE ALL" button on 'SERVICE-OTHER FACTORY MAINTENANCE' Page
    And I click "RECOMMENDED SERVICES" tab on 'SERVICES' Page
    And I click "REMOVE ALL" button on 'SERVICE-RECOMMENDED SERVICES' Page
    And I click "NEXT" button on 'SERVICES' page
    And I select "SUV/MINIVAN" on 'WALK AROUND' page
    And I click "ALL OK" button on 'WALK AROUND' page
    And I verify front color change correct on 'WALK AROUND' page
    And I click "NEXT" button on 'WALK AROUND' page
    And I set 'PROMISE TIME' "+1" working day "10" hour at "AM " on 'ASSIGN R.O.' page
    And I enter data set in 'ASSIGN R.O.' page
      | FieldName       | Value       |
      | SERVICE ADVISOR |             |
      | TRANSPORTATION  |           1 |
      | INSPECTION TYPE |           1 |
      | TAG             | <TagNumber> |
      | TECHNICIAN      |             |
    And I enter "This is a test Morning check dealerfx QA , please ignore" in "COMMENTS" field on 'ASSIGN R.O.' page
    And I click "NEXT" button on 'ASSIGN R.O.' page
    And I authorize and sign the agreement on 'AUTHORIZATION' page
    And I click "COMPLETE" button on 'AUTHORIZATION' page
    Then I assert RO push completed

    Examples: below data set for data driven
      | URL      | DMS   | DealerName          | DealerCode | Odometer | TagNumber | VIN               | Application     |
      | TEST2DFX | Dummy | audi of anytown usa | 408A85US   |    50010 | Tag1231   | WAUJ8GFFXG1034028 | ADVISOR CHECKIN |

  @AC-MorningCheck-Pord2-PBS @Ignore
  Scenario Outline: Advisor check Morning Check on RO push for <DMS> PBS
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    And I set "<DMS>" to the 'DMS'
    When I login the Application as User "automation" and password "dealerfxqa"
    And I move to switch dealer window on 'Home' page
    And I select the Dealer with "<DealerName>" and "<DealerCode>" in Dealer Page
    Then I verify Page Info "ng-scope" and Browser log in 'Advisor Check-In' page
    And I choose "<Application>" application from the 'Home' page
    #search by the customer
    When I search 'VinNumber' "<VIN>" on 'Advisor Check-In' page
    And I deal with Customer Information PopUp in 'CUSTOMER' page
    Then I verify Mandatory Message Displayed in Fields on 'CUSTOMER' page
    And I verify "NEXT" button is not clickable if 'Odometer' field is empty
    When I enter "<Odometer>" in "ODOMETER" field on 'CUSTOMER' page
    And I click "NEXT" button on 'CUSTOMER' page
    And I click "NEXT" button on 'CONCERN' page
    And I click "NEXT" button on 'HISTORY' page
    And I keep Pre-Selected or "check" "multi-point inspection" or first in 'FACTORY SCHEDULED MAINTENANCE' Tab if No Pre-selected
    And I click "OTHER FACTORY MAINTENANCE" tab on 'SERVICES' Page
    And I click "REMOVE ALL" button on 'SERVICE-OTHER FACTORY MAINTENANCE' Page
    And I click "RECOMMENDED SERVICES" tab on 'SERVICES' Page
    And I click "REMOVE ALL" button on 'SERVICE-RECOMMENDED SERVICES' Page
    And I click "NEXT" button on 'SERVICES' page
    And I select "SUV/MINIVAN" on 'WALK AROUND' page
    And I click "ALL OK" button on 'WALK AROUND' page
    And I verify front color change correct on 'WALK AROUND' page
    And I click "NEXT" button on 'WALK AROUND' page
    And I set 'PROMISE TIME' "+1" working day "10" hour at "AM " on 'ASSIGN R.O.' page
    And I enter data set in 'ASSIGN R.O.' page
      | FieldName       | Value       |
      | SERVICE ADVISOR |             |
      | TRANSPORTATION  |           1 |
      | INSPECTION TYPE |           1 |
      | TAG             | <TagNumber> |
      | TECHNICIAN      |             |
    And I enter "This is a test Morning check dealerfx QA , please ignore" in "COMMENTS" field on 'ASSIGN R.O.' page
    And I click "NEXT" button on 'ASSIGN R.O.' page
    And I authorize and sign the agreement on 'AUTHORIZATION' page
    And I click "COMPLETE" button on 'AUTHORIZATION' page
    Then I assert RO push completed

    Examples: below data set for data driven
      | URL      | DMS | DealerName       | DealerCode | Odometer | TagNumber | VIN               | Application     |
      | TEST2DFX | PBS |Beaverton Toyota  |      36047 |    35006 | Tag1236   | VNKKTUD39HA082562 | ADVISOR CHECKIN |
  

  @AC-MorningCheck-Pord2-LocalR&R
  Scenario Outline: Advisor check Morning Check on RO push for <DMS> Local R&R
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    And I set "<DMS>" to the 'DMS'
    When I login the Application as User "automation" and password "dealerfxqa"
    And I move to switch dealer window on 'Home' page
    And I select the Dealer with "<DealerName>" and "<DealerCode>" in Dealer Page
    Then I verify Page Info "ng-scope" and Browser log in 'Advisor Check-In' page
    And I choose "<Application>" application from the 'Home' page
    #search by the customer    
    When I search 'VinNumber' "<VIN>" on 'Advisor Check-In' page
    And I decode "<VIN>" on 'Advisor Check-In' page
   And I deal with Customer Information PopUp in 'CUSTOMER' page
    Then I verify Mandatory Message Displayed in Fields on 'CUSTOMER' page
    And I verify "NEXT" button is not clickable if 'Odometer' field is empty
    When I enter "<Odometer>" in "ODOMETER" field on 'CUSTOMER' page
    And I click "NEXT" button on 'CUSTOMER' page
    And I click "NEXT" button on 'CONCERN' page
    And I click "NEXT" button on 'HISTORY' page
    And I keep Pre-Selected or "check" "multi-point inspection" or first in 'FACTORY SCHEDULED MAINTENANCE' Tab if No Pre-selected
    And I click "OTHER FACTORY MAINTENANCE" tab on 'SERVICES' Page
    And I click "REMOVE ALL" button on 'SERVICE-OTHER FACTORY MAINTENANCE' Page
    And I click "RECOMMENDED SERVICES" tab on 'SERVICES' Page
    And I click "REMOVE ALL" button on 'SERVICE-RECOMMENDED SERVICES' Page
    And I click "NEXT" button on 'SERVICES' page
    And I select "SUV/MINIVAN" on 'WALK AROUND' page
    And I click "ALL OK" button on 'WALK AROUND' page
    And I verify front color change correct on 'WALK AROUND' page
    And I click "NEXT" button on 'WALK AROUND' page
    And I set 'PROMISE TIME' "+1" working day "10" hour at "AM " on 'ASSIGN R.O.' page
    And I enter data set in 'ASSIGN R.O.' page
      | FieldName       | Value       |
      | SERVICE ADVISOR |             |
      | TRANSPORTATION  |           1 |
      | INSPECTION TYPE |           1 |
      | TAG             | <TagNumber> |
      | TECHNICIAN      |             |
    And I enter "This is a test Morning check dealerfx QA , please ignore" in "COMMENTS" field on 'ASSIGN R.O.' page
    And I click "NEXT" button on 'ASSIGN R.O.' page
    And I authorize and sign the agreement on 'AUTHORIZATION' page
    And I click "COMPLETE" button on 'AUTHORIZATION' page
    Then I assert RO push completed

    Examples: below data set for data driven
      | URL      | DMS       | DealerName        | DealerCode | Odometer | TagNumber | VIN               | Application     |
      | TEST2DFX | Local R&R | Lexus of oakville | 955_LOO    |    35007 | Tag1237   | 2T2BZMCA7KC182665 | ADVISOR CHECKIN |

  @AC-MorningCheck-Pord2-PBSRepeat @Ignore
  Scenario Outline: Advisor check Morning Check on RO push for <DMS> PBS repeat run  More time
   
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    And I set "<DMS>" to the 'DMS'
    When I login the Application as User "automation" and password "dealerfxqa"
    And I move to switch dealer window on 'Home' page
    And I select the Dealer with "<DealerName>" and "<DealerCode>" in Dealer Page
    Then I verify Page Info "ng-scope" and Browser log in 'Advisor Check-In' page
    And I choose "<Application>" application from the 'Home' page
    #search by the customer
    When I search 'VinNumber' "<VIN>" on 'Advisor Check-In' page
    And I deal with Customer Information PopUp in 'CUSTOMER' page
    Then I verify Mandatory Message Displayed in Fields on 'CUSTOMER' page
    And I verify "NEXT" button is not clickable if 'Odometer' field is empty
    When I enter "<Odometer>" in "ODOMETER" field on 'CUSTOMER' page
    And I click "NEXT" button on 'CUSTOMER' page
    And I click "NEXT" button on 'CONCERN' page
    And I click "NEXT" button on 'HISTORY' page
    And I keep Pre-Selected or "check" "multi-point inspection" or first in 'FACTORY SCHEDULED MAINTENANCE' Tab if No Pre-selected
    And I click "OTHER FACTORY MAINTENANCE" tab on 'SERVICES' Page
    And I click "REMOVE ALL" button on 'SERVICE-OTHER FACTORY MAINTENANCE' Page
    And I click "RECOMMENDED SERVICES" tab on 'SERVICES' Page
    And I click "REMOVE ALL" button on 'SERVICE-RECOMMENDED SERVICES' Page
    And I click "NEXT" button on 'SERVICES' page
    And I select "SUV/MINIVAN" on 'WALK AROUND' page
    And I click "ALL OK" button on 'WALK AROUND' page
    And I verify front color change correct on 'WALK AROUND' page
    And I click "NEXT" button on 'WALK AROUND' page
    And I set 'PROMISE TIME' "+1" working day "10" hour at "AM " on 'ASSIGN R.O.' page
    And I enter data set in 'ASSIGN R.O.' page
      | FieldName       | Value       |
      | SERVICE ADVISOR |             |
      | TRANSPORTATION  |           1 |
      | INSPECTION TYPE |           1 |
      | TAG             | <TagNumber> |
      | TECHNICIAN      |             |
    And I enter "This is a test Morning check dealerfx QA , please ignore" in "COMMENTS" field on 'ASSIGN R.O.' page
    And I click "NEXT" button on 'ASSIGN R.O.' page
    And I authorize and sign the agreement on 'AUTHORIZATION' page
    And I click "COMPLETE" button on 'AUTHORIZATION' page
    Then I assert RO push completed
    Then I assert no DMS push error

    Examples: below data set for data driven
      | URL      | DMS | DealerName       | DealerCode | Odometer | TagNumber | VIN               | Application     |
      | TEST2DFX | PBS | Beaverton Toyota |      36047 |    35006 | Tag1236   | VNKKTUD39HA082562 | ADVISOR CHECKIN |
