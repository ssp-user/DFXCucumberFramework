@TIONE17 @TIONE
Feature: TIONE17_TechInspection_WalkAround, update walk around
  
  @tioneflow_parts
  Scenario Outline: [@tiflow_parts] update walk around
    #Login as Service Technician
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    When I login the Application as User "DarrenT" and password "welcome"
    And I click 'Click Here to Select your Dealership' on 'Home' page
    And I select Dealer with "<DealerName>" and "<DealerCode>" on DFX Page
    And I launch "Technician Inspection" Application on 'Main Page'
    #Create MPI
    And I launch 'Search popup panel' in Inspection dashboard
    And I launch 'Create MPI' popup window in Inspection dashboard
    And I enter data set in Create MPI popup window
    #  for 'Customer/VIN Search' section 
      | FieldName        |Value |
      | VIN              | <VIN>|
      | Customer Name    |      |
      | Phone            |      |
    And I decode <VIN> in MPI popup windows
    And I enter data set in Create MPI popup window 
    # for the 'Vehicle' Section
      | FieldName        |Value  |
      | Make             |       |
      | Year             |       |
      | Model            |       |
      | Transmission     |       |
      | Engine Size      |       |
      | Drive Train      |       |
      | Mileage          |       |
      | Mileage Value    | 65400 |
      | Months           |       |
      | Months Value     |       |
    And I enter data set in Create MPI popup window
    # for the 'Inspection Information' Section
      | FieldName         |Value      |
      | Service Advisor    |           |
      | Technician        |           |
      | TAG               | <TAG>     |
      | RO                |           |
      | Lot Number        |           |
      | License Plate     |           |
      | Promise Date      | +2        |
      | Promise Time      | 11:45 AM  |
      | Quarter Date      |           |
      | Quarter Time      |           |
      | Inspection Type   | <Template>|
      | Transportation    |           |
      | Save parts        |           |
      | Car Wash          |           |
      | Glove box         |           |
      | Spare tire        |           |
      | Comments          |           |
    And I submit 'Complete' in Create MPI popup window
    Then I see vehicle with "<VIN>" with "CREATED" status on 'TECHNICIAN INSPECTION Dashboard'
    # Open the MPI & add a recommendation service with parts requested flag
    When I click vehicle "<VIN>" on 'TECHNICIAN INSPECTION Dashboard'
    And I 'Mark Section All OK' on 'MPI Details' page
    And I click "Red" icon on "Left Front Wipers" inspection on 'INSPECTION' tab
    And I enter data set in addRecommendationField
      | FieldName         |Value  |
      | Recommendation    | Test1 |
      | OPcode            |       |
      | Hours             | 2.5   |
      | LaborSale         | 25.5  |
      | PartSale          | 100   |
      | Price             |       |
    And I click "plus" icon on 'Inspection Detail' page
    And I click "Save" button on 'Inspection Detail' page
    And I click "Save" button on 'MPI Details' page
    And I click "WALK AROUND" button on 'MPI Details' page
    And I update "this is for testing" in COMMENTS with "Windshield Damage" Description on 'WALK AROUND' tab
    #And I click "Save" button on "WALK AROUND" tab
    And I click "Save" button on 'MPI Details' page
    And I click "INSPECTION" button on 'MPI Details' page
    And I click "Mark Completed" button on 'MPI Details' page
    Then I see vehicle with "<VIN>" with "COMPLETED" status on 'TECHNICIAN INSPECTION Dashboard'

    #Login as Service Advisor
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    When I login the Application as User "DarrenA" and password "welcome"
    And I click 'Click Here to Select your Dealership' on 'Home' page
    And I select Dealer with "<DealerName>" and "<DealerCode>" on DFX Page
    And I launch "Technician Inspection" Application on 'Main Page'
    And I select "Select All" in Created By drop down in Search MPI popup
    Then I see vehicle with "<VIN>" with "COMPLETED" status on 'TECHNICIAN INSPECTION Dashboard'
    # Open the MPI and Mark review
    When I click vehicle "<VIN>" on 'TECHNICIAN INSPECTION Dashboard'
    And I click "SHOW" button on 'MPI Details' page
    Then I should see "COMPLETED" status on 'MPI Details' page
    When I click "Mark Reviewed" button on 'MPI Details' page
    And I click "vehicle queue" icon on 'MPI Details' page
    Then I see vehicle with "<VIN>" with "REVIEWED" status on 'TECHNICIAN INSPECTION Dashboard'
    When I click vehicle "<VIN>" on 'TECHNICIAN INSPECTION Dashboard'
    And I click "WALK AROUND" button on 'MPI Details' page
    Then I should see "this is for testing" in COMMENTS with "Windshield Damage" Description on 'WALK AROUND' tab
    When I update "this is for testing 2" in COMMENTS with "Left Windshield Wiper" Description on 'WALK AROUND' tab
    #And I click "Save" button on "WALK AROUND" tab
    And I click "Save" button on 'MPI Details' page
    And I click "vehicle queue" icon on 'MPI Details' page
    Then I see vehicle with "<VIN>" with "REVIEWED" status on 'TECHNICIAN INSPECTION Dashboard'

    # Open the MPI, approve the service and mark confirmed
    When I click vehicle "<VIN>" on 'TECHNICIAN INSPECTION Dashboard'
    And I click "SHOW" button on 'MPI Details' page
    Then I should see "REVIEWED" status on 'MPI Details' page
    When I click "APPROVED" button with "Test1" Description on 'RECOMMENDATION' page
    And I click "Save" button on 'MPI Details' page
    And I click "SHOW TOTALS" on 'footbar' tab on 'MPI Details' page
    Then I should see "RECOMMENDED" with "$125.50" on 'footbar' tab
    And I should see "APPROVED" with "$125.50" on 'footbar' tab
    When I click "Confirm" button on 'MPI Details' page
    #And I click "vehicle queue" icon on 'MPI Details' page
    Then I see vehicle with "<VIN>" with "CONFIRMED" status on 'TECHNICIAN INSPECTION Dashboard'

    #Login as Service Technician
    Given I launch browser "chrome" in "GUI" and open "<URL>"
    When I login the Application as User "DarrenT" and password "welcome"
    And I click 'Click Here to Select your Dealership' on 'Home' page
    And I select Dealer with "<DealerName>" and "<DealerCode>" on DFX Page
    And I launch "Technician Inspection" Application on 'Main Page'
    Then I see vehicle with "<VIN>" with "CONFIRMED" status on 'TECHNICIAN INSPECTION Dashboard'
    # Open the MPI and move the vehicle to ready for processing
    When I click vehicle "<VIN>" on 'TECHNICIAN INSPECTION Dashboard'
    And I click "SHOW" button on 'MPI Details' page
    Then I should see "CONFIRMED" status on 'MPI Details' page
    And I should see "Test1" Description with "2.50" labor with "$125.50" price in 'recommendations' section on 'APPROVED SERVICES' tab

    When I click "WALK AROUND" button on 'MPI Details' page
    Then I should see "this is for testing" in COMMENTS with "Windshield Damage" Description on 'WALK AROUND' tab
    And I should see "this is for testing 2" in COMMENTS with "Left Windshield Wiper" Description on 'WALK AROUND' tab
    When I click "APPROVED SERVICES" button on 'MPI Details' page
    When I click "green" toggle with "Test1" Description on 'APPROVED SERVICES' tab
    And I click "Save" button on 'MPI Details' page
    And I click "Ready for processing" button on 'MPI Details' page
    Then I see vehicle with "<VIN>" with "READY FOR PROCESSING" status on 'TECHNICIAN INSPECTION Dashboard'

    Examples: this is for data driver testing
      |URL   |DealerName |DealerCode|TAG   |VIN              |Template                   |
      |PROD1 |CHRYSLER QA|99970     |Walk1 |1C3CCBCGXDN674128|Chrysler Vehicle Inspection|