@WiAdvisor_Regression-PILOT1
Feature: The Test suite function to verify the WiAdvisor RO Push work as desire on PILOT1
  Description : The purpose of this feature test Diveristy DMS and Data

  @WiAdvisor_Regression-PILOT1-Dummy
  Scenario Outline: Test Wi-Advisor function RO push properly on PILOT1 <DMS> Dummy and Data set
  Description: verify Wi-Advisor RO push properly on Pilot1 DMS Dummy and Data set
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    When I login the WiAdvisor as UserID "T0060VL" and Password "Vadlun1?" and Dealer Code "<DealerCode>"
    And I set "<DMS>" to the 'DMS'
    And I click "Accept" button in 'index' page
    And I click "Search" tab in 'index' page
    And I search "Customer Name" with "<CustomerName>" in 'Index-Search' tab
    And I select "first" customer from the list in 'Index-Search' tab
    And I select "first" vehicle from customer in 'Index-Search' tab
    And I select "DMS" when 'Customer Information' popup
    And I update "Odometer" with "<Odometer>" in 'Vehicle Information' tab
    And I click "Continue" button in 'Customer Info' page
    And I click "Continue" button in 'VIP/History' page
    And I accept Pre-Selected or "check" "Multi-point inspection" in 'Factory Required Maintenance' section if No Pre-selected
    Then I verify selected items under 'Factory Required Maintenance' section in BuildRO Page
    When I accept Pre-Selected or "check" "Multi-point inspection" in 'Triage Item' section if exist and No Pre-selected
    Then I verify selected items under 'Triage Item' section in BuildRO Page
    When I enter "This is a test from DealerFX QA." comments under "General Comments" section in 'Build RO' tab
    And I select "Customer Pay" for all dropdown under 'Selected Services' in 'Build RO' tab
    And I click "Continue" button in 'Build RO' page
    And I select a proper or default Service Advisor in 'Assign RO' tab
      |DealerCode             |Service Advisor|
      |62125                  |Todd Sherman   |
      |45155                  |Henry Machin   |
    And I set promise date next "2" month "The 3th Wednesday" in 'Assign RO' tab
    And I set promise time "11" hours "AM" in 'Assign RO' tab
    And I enter "<TagNumber>" under "Tag" field in 'Assign RO' tab
    And I click "Continue" button in 'Assign RO' page
    And I click "Continue" button in 'Walk Around' page
    And I click "Continue" button in 'Walk Around' page
    And I "sign" in 'Finalize RO' tab
    And I click "Complete" button in 'Finalize RO' page
    Then I see following PDF generated on 'Complete Repair Order' pop up
      |PDFName                   |Status|
      |Open pre-service write-up |show  |
      |Open maintenance menu     |show  |
      |Open VIP                  |show  |
    And I verify following PDF generated on 'Complete Repair Order' PopUP
      |PDF_Name                     |VerifyField1              |VerifyField2         |VerifyField3|
      |Open maintenance menu        |Estimated Maintenance Cost|SIGNATURE AUTHORIZING|Grand Total |
      |Open pre-service write-up    |Pre-Service Write-Up      |                     |            |
      |Open VIP                     |VIP SUMMARY REPORT        |                     |            |
    And I click "OK" button on 'Complete Repair Order' PopUP
    Examples: below data set for data driven
      |URL      |DMS        |DealerCode|CustomerName |Odometer|TagNumber|
      |PILOT1WI |Dummy      |99970     |Jon Buck     |56000   |TEST     |

  @WiAdvisor_Regression-PILOT1-Automate
  Scenario Outline: Test Wi-Advisor function RO push properly on PILOT1 <DMS> Automate and Data set
  Description: Verify Wi-Advisor RO push properly on Pilot1 DMS CDK  and Data set
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    When I login the WiAdvisor as UserID "T0060VL" and Password "Vadlun1?" and Dealer Code "<DealerCode>"
    And I set "<DMS>" to the 'DMS'
    And I click "Accept" button in 'index' page
    And I click "Search" tab in 'index' page
    And I search "Customer Name" with "<CustomerName>" in 'Index-Search' tab
    And I select "first" customer from the list in 'Index-Search' tab
    And I select "first" vehicle from customer in 'Index-Search' tab
    And I select "DMS" when 'Customer Information' popup
    And I update "Odometer" with "<Odometer>" in 'Vehicle Information' tab
    And I click "Continue" button in 'Customer Info' page
    And I click "Continue" button in 'VIP/History' page
    And I accept Pre-Selected or "check" "Multi-point inspection" in 'Factory Required Maintenance' section if No Pre-selected
    Then I verify selected items under 'Factory Required Maintenance' section in BuildRO Page
    When I accept Pre-Selected or "check" "Multi-point inspection" in 'Triage Item' section if exist and No Pre-selected
    Then I verify selected items under 'Triage Item' section in BuildRO Page
    When I enter "This is a test from DealerFX QA." comments under "General Comments" section in 'Build RO' tab
    And I select "Customer Pay" for all dropdown under 'Selected Services' in 'Build RO' tab
    And I click "Continue" button in 'Build RO' page
    And I select a proper or default Service Advisor in 'Assign RO' tab
      |DealerCode             |Service Advisor|
      |62125                  |Todd Sherman   |
      |45155                  |Henry Machin   |
    And I set promise date next "2" month "The 3th Wednesday" in 'Assign RO' tab
    And I set promise time "11" hours "AM" in 'Assign RO' tab
    And I enter "<TagNumber>" under "Tag" field in 'Assign RO' tab
    And I click "Continue" button in 'Assign RO' page
    And I click "Continue" button in 'Walk Around' page
    And I click "Continue" button in 'Walk Around' page
    And I "sign" in 'Finalize RO' tab
    And I click "Complete" button in 'Finalize RO' page
    Then I see following PDF generated on 'Complete Repair Order' pop up
      |PDFName                   |Status|
      |Open pre-service write-up |show  |
      |Open maintenance menu     |show  |
      |Open VIP                  |show  |
    And I verify following PDF generated on 'Complete Repair Order' PopUP
      |PDF_Name                     |VerifyField1              |VerifyField2         |VerifyField3|
      |Open maintenance menu        |Estimated Maintenance Cost|SIGNATURE AUTHORIZING|Grand Total |
      |Open pre-service write-up    |Pre-Service Write-Up      |                     |            |
      |Open VIP                     |VIP SUMMARY REPORT        |                     |            |
    And I click "OK" button on 'Complete Repair Order' PopUP
    Examples: below data set for data driven
      |URL      |DMS          |DealerCode|CustomerName     |Odometer|TagNumber|
      |PILOT1WI |Automate     |63401     |Wiadvisor2       |56000   |1234     |

  @WiAdvisor_Regression-PILOT1-DealerTrack
  Scenario Outline: Test Wi-Advisor function RO push properly on PILOT1 <DMS> DealerTrack and Data set
  Description: Verify Wi-Advisor RO push properly on Pilot1 DMS Autosoft and Data set
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    When I login the WiAdvisor as UserID "T0060VL" and Password "Vadlun1?" and Dealer Code "<DealerCode>"
    And I set "<DMS>" to the 'DMS'
    And I click "Accept" button in 'index' page
    And I click "Search" tab in 'index' page
    And I search "Customer Name" with "<CustomerName>" in 'Index-Search' tab
    And I select "first" customer from the list in 'Index-Search' tab
    And I select "first" vehicle from customer in 'Index-Search' tab
    And I select "DMS" when 'Customer Information' popup
    And I update "Odometer" with "<Odometer>" in 'Vehicle Information' tab
    And I click "Continue" button in 'Customer Info' page
    And I click "Continue" button in 'VIP/History' page
    And I accept Pre-Selected or "check" "Multi-point inspection" in 'Factory Required Maintenance' section if No Pre-selected
    Then I verify selected items under 'Factory Required Maintenance' section in BuildRO Page
    When I accept Pre-Selected or "check" "Multi-point inspection" in 'Triage Item' section if exist and No Pre-selected
    Then I verify selected items under 'Triage Item' section in BuildRO Page
    When I enter "This is a test from DealerFX QA." comments under "General Comments" section in 'Build RO' tab
    And I select "Customer Pay" for all dropdown under 'Selected Services' in 'Build RO' tab
    And I click "Continue" button in 'Build RO' page
    And I select "<ServiceAdvisor>" under 'Service Advisor' field in 'Assign RO' tab
    And I set promise date next "2" month "The 3th Wednesday" in 'Assign RO' tab
    And I set promise time "11" hours "AM" in 'Assign RO' tab
    And I enter "<TagNumber>" under "Tag" field in 'Assign RO' tab
    And I click "Continue" button in 'Assign RO' page
    And I click "Continue" button in 'Walk Around' page
    And I click "Continue" button in 'Walk Around' page
    And I "sign" in 'Finalize RO' tab
    And I click "Complete" button in 'Finalize RO' page
    Then I see following PDF generated on 'Complete Repair Order' pop up
      |PDFName                   |Status|
      |Open pre-service write-up |show  |
      |Open maintenance menu     |show  |
      |Open VIP                  |show  |
    And I verify following PDF generated on 'Complete Repair Order' PopUP
      |PDF_Name                     |VerifyField1              |VerifyField2         |VerifyField3|
      |Open maintenance menu        |Estimated Maintenance Cost|SIGNATURE AUTHORIZING|Grand Total |
      |Open pre-service write-up    |Pre-Service Write-Up      |                     |            |
      |Open VIP                     |VIP SUMMARY REPORT        |                     |            |
    And I click "OK" button on 'Complete Repair Order' PopUP
    Examples: below data set for data driven
      |URL      |DMS           |DealerCode|CustomerName     |Odometer|TagNumber|ServiceAdvisor |
      |PILOT1WI |DealerTrack   |62125     |wiadvisor        |65100   |TEST     |Todd Sherman   |

  @WiAdvisor_Regression-PILOT1-CDK
  Scenario Outline: Test Wi-Advisor function RO push properly on PILOT1 <DMS> CDK and Data set
  Description: Verify Wi-Advisor RO push properly on Pilot1 DMS R&R and Data set
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    When I login the WiAdvisor as UserID "T0060VL" and Password "Vadlun1?" and Dealer Code "<DealerCode>"
    And I set "<DMS>" to the 'DMS'
    And I click "Accept" button in 'index' page
    And I click "Search" tab in 'index' page
    And I search "Customer Name" with "<CustomerName>" in 'Index-Search' tab
    And I select "first" customer from the list in 'Index-Search' tab
    And I select "first" vehicle from customer in 'Index-Search' tab
    And I select "DMS" when 'Customer Information' popup
    And I update "Odometer" with "<Odometer>" in 'Vehicle Information' tab
    And I click "Continue" button in 'Customer Info' page
    And I click "Continue" button in 'VIP/History' page
    And I accept Pre-Selected or "check" "Multi-point inspection" in 'Factory Required Maintenance' section if No Pre-selected
    Then I verify selected items under 'Factory Required Maintenance' section in BuildRO Page
    When I accept Pre-Selected or "check" "Multi-point inspection" in 'Triage Item' section if exist and No Pre-selected
    Then I verify selected items under 'Triage Item' section in BuildRO Page
    When I enter "This is a test from DealerFX QA." comments under "General Comments" section in 'Build RO' tab
    And I select "Customer Pay" for all dropdown under 'Selected Services' in 'Build RO' tab
    And I click "Continue" button in 'Build RO' page
    And I select a proper or default Service Advisor in 'Assign RO' tab
      |DealerCode             |Service Advisor|
      |62125                  |Todd Sherman   |
      |45155                  |Henry Machin   |
    And I set promise date next "2" month "The 3th Wednesday" in 'Assign RO' tab
    And I set promise time "11" hours "AM" in 'Assign RO' tab
    And I enter "<TagNumber>" under "Tag" field in 'Assign RO' tab
    And I click "Continue" button in 'Assign RO' page
    And I click "Continue" button in 'Walk Around' page
    And I click "Continue" button in 'Walk Around' page
    And I "sign" in 'Finalize RO' tab
    And I click "Complete" button in 'Finalize RO' page
    Then I see following PDF generated on 'Complete Repair Order' pop up
      |PDFName                   |Status|
      |Open pre-service write-up |show  |
      |Open maintenance menu     |show  |
      |Open VIP                  |show  |
    And I verify following PDF generated on 'Complete Repair Order' PopUP
      |PDF_Name                     |VerifyField1              |VerifyField2         |VerifyField3|
      |Open maintenance menu        |Estimated Maintenance Cost|SIGNATURE AUTHORIZING|Grand Total |
      |Open pre-service write-up    |Pre-Service Write-Up      |                     |            |
      |Open VIP                     |VIP SUMMARY REPORT        |                     |            |
    And I click "OK" button on 'Complete Repair Order' PopUP
    Examples: below data set for data driven
      |URL      |DMS           |DealerCode|CustomerName   |Odometer|TagNumber|
      |PILOT1WI |CDK           |45155     |push           |38000   |TEST     |

  @WiAdvisor_Regression-PILOT1-PBS
  Scenario Outline: Test Wi-Advisor function RO push properly on PILOT1 <DMS> PBS and Data set
  Description: Verify Wi-Advisor RO push properly on Pilot1 DMS DealerBuilt and Data set
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    When I login the WiAdvisor as UserID "T0060VL" and Password "Vadlun1?" and Dealer Code "<DealerCode>"
    And I set "<DMS>" to the 'DMS'
    And I click "Accept" button in 'index' page
    And I click "Search" tab in 'index' page
    And I search "Customer Name" with "<CustomerName>" in 'Index-Search' tab
    And I select "first" customer from the list in 'Index-Search' tab
    And I select "first" vehicle from customer in 'Index-Search' tab
    And I select "DMS" when 'Customer Information' popup
    And I update "Odometer" with "<Odometer>" in 'Vehicle Information' tab
    And I click "Continue" button in 'Customer Info' page
    And I click "Continue" button in 'VIP/History' page
    And I accept Pre-Selected or "check" "Multi-point inspection" in 'Factory Required Maintenance' section if No Pre-selected
    Then I verify selected items under 'Factory Required Maintenance' section in BuildRO Page
    When I accept Pre-Selected or "check" "Multi-point inspection" in 'Triage Item' section if exist and No Pre-selected
    Then I verify selected items under 'Triage Item' section in BuildRO Page
    When I enter "This is a test from DealerFX QA." comments under "General Comments" section in 'Build RO' tab
    And I select "Customer Pay" for all dropdown under 'Selected Services' in 'Build RO' tab
    And I click "Continue" button in 'Build RO' page
    And I select a proper or default Service Advisor in 'Assign RO' tab
      |DealerCode             |Service Advisor|
      |62125                  |Todd Sherman   |
      |45155                  |Henry Machin   |
    And I set promise date next "2" month "The 3th Wednesday" in 'Assign RO' tab
    And I set promise time "11" hours "AM" in 'Assign RO' tab
    And I enter "<TagNumber>" under "Tag" field in 'Assign RO' tab
    And I click "Continue" button in 'Assign RO' page
    And I click "Continue" button in 'Walk Around' page
    And I click "Continue" button in 'Walk Around' page
    And I "sign" in 'Finalize RO' tab
    And I click "Complete" button in 'Finalize RO' page
    Then I see following PDF generated on 'Complete Repair Order' pop up
      |PDFName                   |Status|
      |Open pre-service write-up |show  |
      |Open maintenance menu     |show  |
      |Open VIP                  |show  |
    And I verify following PDF generated on 'Complete Repair Order' PopUP
      |PDF_Name                     |VerifyField1              |VerifyField2         |VerifyField3|
      |Open maintenance menu        |Estimated Maintenance Cost|SIGNATURE AUTHORIZING|Grand Total |
      |Open pre-service write-up    |Pre-Service Write-Up      |                     |            |
      |Open VIP                     |VIP SUMMARY REPORT        |                     |            |
    And I click "OK" button on 'Complete Repair Order' PopUP
    Examples: below data set for data driven
      |URL      |DMS        |DealerCode|CustomerName   |Odometer|TagNumber|
      |PILOT1WI |PBS        |45493     |pldfx          |35000   |TEST     |