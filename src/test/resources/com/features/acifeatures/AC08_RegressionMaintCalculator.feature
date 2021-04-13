@AC08 @Regression1 @test21
Feature: AC08 - Advisor check function on Calculation of maintainance and able to generate PDF
  Description : Verify the function on Calculation of maintainance and able to generate PDF

  @AC-Regression-maintainCalculation-TEST2-Audi-noVIN
  Scenario Outline: Verify the function on Calculation of maintainance without Decode VIN
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    And I set "<DMS>" to the 'DMS'
    When I login the Application as User "automation" and password "dealerfxqa"
    And I move to switch dealer window on 'Home' page
    And I select the Dealer with "<DealerName>" or "<DealerCode>" in Dealer Page
    #And I choose "<Application>" application from the 'Home' page
    And I open "<Application>" application from the 'Home' page
    Then I verify Page Info "ng-scope" and Browser log in 'Advisor Check-In' page
    And I enter data set in Dealer 'VEHICLE' page
      | FieldName    | Value |
      #      | Manafacture  |     1 |
      | Year         |     2 |
      | Model        |     1 |
      | Transmission |     1 |
      | Engine       |     1 |
      | Drive        |     1 |
    And I verify "NEXT" button is not clickable if 'Odometer' field is empty
    And I input <Odometer> on "ODOMETER" field in Dealer 'VEHICLE' page
    And I click "NEXT" button in Dealer 'VEHICLE' page
    And I click "NEXT" button in Dealer 'HISTORY' page
    Then I verify selected "scheduled" services matched selected servies items
    And I keep Pre-Selected or choose random less "5" Scheduled services in 'SERVICE-FACTORY SCHEDULED MAINTENANCE' Tab if No Pre-selected
    Then I verify selected "scheduled" services matched selected servies items
    And I keep Pre-Selected or choose random less "5" Factory Required services in 'SERVICE-FACTORY SCHEDULED MAINTENANCE' Tab if No Pre-selected
    Then I verify selected "Factory Required" services matched selected servies items
    Then I verify Remove All to "Factory Required" services items on services page
    And I keep Pre-Selected or choose random less "5" Factory Required services in 'SERVICE-FACTORY SCHEDULED MAINTENANCE' Tab if No Pre-selected
    When I click "OTHER FACTORY MAINTENANCE" tab on 'SERVICES' Page
    And I keep Pre-Selected or choose random less "5" 'unScheduled' services in 'OTHER FACTORY MAINTENANCE' Tab
    Then I verify selected "unScheduled" services matched selected servies items
    Then I verify Remove All to "unScheduled" services items on services page
    And I choose random less "5" 'unScheduled' services in 'OTHER FACTORY MAINTENANCE' Tab
    When I click "RECOMMENDED SERVICES" tab on 'SERVICES' Page
    And I keep Pre-Selected or choose random less "5" 'recommend' services in 'RECOMMNED SERVICES' Tab
    Then I verify selected "RECOMMENDED" services matched selected servies items
    Then I verify Remove All to "RECOMMENDED" services items on services page
    When I choose random less "5" 'recommend' services in 'RECOMMNED SERVICES' Tab
    And I click "QUOTE_SERVICES" button on 'SERVICES' page
    Then I see 'GENERATE QUOTE' PDF completed
    Then I verify following in PDF generated on 'GENERATE QUOTE'
      | PDF_Name                     | VerifyField            |
      | SAVED CUSTOMER SERVICE QUOTE | Customer Service Quote |
      | SAVED INTERNAL SERVICE QUOTE | Internal Service Quote |
    And I click "CLOSE" button on 'GENERATE QUOTE' PopUp
    And I click "MENU" button on 'SERVICES' page
    Then I verify following in PDF generated on 'GENERATE QUOTE'
      | PDF_Name         | VerifyField       |
      | MAINTENANCE MENU | Maintenance Guide |
    And I signOut From AC

    Examples: below data set for data driven
      | URL      | DMS       | DealerName               | Odometer | Application     |
      | TEST2DFX | Menu Only | audi of anytown usa menu |    35001 | Advisor Checkin |

  @AC-Regression-maintainCalculation-TEST2-Audi-ByVIN
  Scenario Outline: Verify the function on Calculation of maintainance by Decode VIN
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    And I set "<DMS>" to the 'DMS'
    When I login the Application as User "automation" and password "dealerfxqa"
    And I move to switch dealer window on 'Home' page
    And I select the Dealer with "<DealerName>" or "<DealerCode>" in Dealer Page
    #And I choose "<Application>" application from the 'Home' page
    And I open "<Application>" application from the 'Home' page
    Then I verify Page Info "ng-scope" and Browser log in 'Advisor Check-In' page
    When I input <VIN> on "VIN" field in Dealer 'VEHICLE' page
    And I click "DECODE" button in Dealer 'VEHICLE' page
    And I verify "NEXT" button is not clickable if 'Odometer' field is empty
    And I input <Odometer> on "ODOMETER" field in Dealer 'VEHICLE' page
    And I click "NEXT" button in Dealer 'VEHICLE' page
    And I click "NEXT" button in Dealer 'HISTORY' page
    Then I verify selected "SCHEDULED" services matched selected servies items
    And I keep Pre-Selected or choose random less "5" Scheduled services in 'SERVICE-FACTORY SCHEDULED MAINTENANCE' Tab if No Pre-selected
    Then I verify selected "scheduled" services matched selected servies items
    And I keep Pre-Selected or choose random less "5" Factory Required services in 'SERVICE-FACTORY SCHEDULED MAINTENANCE' Tab if No Pre-selected
    Then I verify selected "Factory Required" services matched selected servies items
    Then I verify Remove All to "Factory Required" services items on services page
    And I keep Pre-Selected or choose random less "5" Factory Required services in 'SERVICE-FACTORY SCHEDULED MAINTENANCE' Tab if No Pre-selected
    When I click "OTHER FACTORY MAINTENANCE" tab on 'SERVICES' Page
    And I keep Pre-Selected or choose random less "5" 'unScheduled' services in 'OTHER FACTORY MAINTENANCE' Tab
    Then I verify selected "unScheduled" services matched selected servies items
    Then I verify Remove All to "unScheduled" services items on services page
    And I choose random less "5" 'unScheduled' services in 'OTHER FACTORY MAINTENANCE' Tab
    When I click "RECOMMENDED SERVICES" tab on 'SERVICES' Page
    And I keep Pre-Selected or choose random less "5" 'recommend' services in 'RECOMMNED SERVICES' Tab
    Then I verify selected "RECOMMENDED" services matched selected servies items
    Then I verify Remove All to "RECOMMENDED" services items on services page
    When I choose random less "5" 'recommend' services in 'RECOMMNED SERVICES' Tab
    And I click "QUOTE_SERVICES" button on 'SERVICES' page
    Then I see 'GENERATE QUOTE' PDF completed
    Then I verify following in PDF generated on 'GENERATE QUOTE'
      | PDF_Name                     | VerifyField            |
      | SAVED CUSTOMER SERVICE QUOTE | Customer Service Quote |
      | SAVED INTERNAL SERVICE QUOTE | Internal Service Quote |
    And I click "CLOSE" button on 'GENERATE QUOTE' PopUp
    And I click "MENU" button on 'SERVICES' page
    And I click "SHOW" button on 'POP UP' page
    Then I verify following in PDF generated on 'GENERATE QUOTE'
      | PDF_Name         | VerifyField       |
      | MAINTENANCE MENU | Maintenance Guide |
    And I click "EDIT" button on 'POP UP' page
    And I signOut From AC

    Examples: below data set for data driven
      | URL      | DMS       | DealerName               | Odometer | VIN               | Http                         | Application     |
      | TEST2DFX | Menu Only | audi of anytown usa menu |    35001 | WAUJ8GFFXG1034028 | https://auditd.dealer-fx.com | ADVISOR CHECKIN |
