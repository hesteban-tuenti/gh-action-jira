@jira.QANOV-8069
Feature: Contacts as friendly names

  Actions Before the Feature:
    Given user has a "any_admin" role
      And user has a "postpay" account type


  @jira.<jira_id> @android @ios @mobile @jira.cv.10.6 @manual @jira.link.relates_to.NOV-174892
  @moves @regression @automation.hard
  Scenario Outline: User cannot see the mobile lines in the Consumption details screen as Friendly Names if the user hasn't synchronized the local phonebook
    commented_tags="@depends_on.NOV-64020 @depends_on.NOV-64072"
    Given user has a "mobile_line" product
      And the "<allowance>" tab is selected
      And user has made consumption on the "<allowance>" allowances in the "mobile_line" product
      And user has denied "contacts" permissions
      And user has the matching subscription selected in the account
      And user has the "consumption-events-list-postpay" module configured in CMS for "<page>" page
      And user is in the "Consumption" page
      And a phone number from the "<allowance>" events is stored with "Contact Test" name in the phonebook
     Then the lines are displayed with the phone number in the "<allowance>" events
      And the lines are displayed with the default icon in the "<allowance>" events

    Examples:
      | allowance | page                         | jira_id    |
      | minutes   | consumption-details-calls    | QANOV-8070 |
      | messages  | consumption-details-messages | QANOV-8072 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.6 @manual @jira.link.relates_to.NOV-174888
  @moves @automation.hard
  Scenario Outline: User cannot see the mobile lines in the Consumption details screen as Friendly Names if the user has not the phone numbers stored in the phonebook
    commented_tags="@depends_on.NOV-64020 @depends_on.NOV-64072"
    Given user has a "mobile_line" product
      And the "<allowance>" tab is selected
      And user has made consumption on the "<allowance>" allowances in the "mobile_line" product
      And user has granted "contacts" permissions
      And user has not stored in the phonebook any phone number displayed in the "<allowance>" events
      And user has the matching subscription selected in the account
      And user has the "consumption-events-list-postpay" module configured in CMS for "<page>" page
      And user is in the "Consumption" page
     Then the lines are displayed with the phone number in the "<allowance>" events
      And the lines are displayed with the default icon in the "<allowance>" events

    @smoke @har
    Examples:
      | allowance | page                         | jira_id    |
      | minutes   | consumption-details-calls    | QANOV-8074 |

    @regression
    Examples:
      | allowance | page                         | jira_id    |
      | messages  | consumption-details-messages | QANOV-8076 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.6 @manual @jira.link.relates_to.NOV-92020 @moves
  @regression @automation.hard
  Scenario Outline: User can see the mobile lines in the Consumption details screen as Friendly Names if the user has the phone numbers stored in the phonebook
    internal_checkpoint="User has to restart the app to have the phonebook synched again"
    commented_tags="@depends_on.NOV-64020 @depends_on.NOV-64072"
    Given user has a "mobile_line" product
      And the "<allowance>" tab is selected
      And user has made consumption on the "<allowance>" allowances in the "mobile_line" product
      And user has granted "contacts" permissions
      And a phone number from the "<allowance>" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "consumption-events-list-postpay" module configured in CMS for "<page>" page
      And user is in the "Consumption" page
     Then the stored line is displayed with the "Contact Test" name in the "<allowance>" events
      And the other lines not stored in the phonebook are displayed with the phone number and the default mobile avatar

    Examples:
      | allowance | page                         | jira_id    |
      | minutes   | consumption-details-calls    | QANOV-8078 |
      | messages  | consumption-details-messages | QANOV-8080 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.11.10 @manual @moves @regression @automation.hard
  Scenario Outline: User can see the contact avatar in the Consumption details screen if the user has the phone numbers stored in the phonebook with an avatar
    internal_checkpoint="User has to restart the app to have the phonebook synched again"
    commented_tags="@depends_on.NOV-64020 @depends_on.NOV-64072"
    Given user has a "mobile_line" product
      And the "<allowance>" tab is selected
      And user has made consumption on the "<allowance>" allowances in the "mobile_line" product
      And user has granted "contacts" permissions
      And a phone number from the "<allowance>" events is stored with an avatar in the phonebook
      And user has the matching subscription selected in the account
      And user has the "consumption-events-list-postpay" module configured in CMS for "<page>" page
      And user is in the "Consumption" page
     Then the stored line is displayed with the contact avatar in the "<allowance>" events

    Examples:
      | allowance | page                         | jira_id    |
      | minutes   | consumption-details-calls    | QANOV-8082 |
      | messages  | consumption-details-messages | QANOV-8084 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @manual @jira.link.relates_to.NOV-122144
  @moves @regression @automation.hard
  Scenario Outline: User can see the friendly name updated in the Consumption details screen if the user has updated the contact stored in the phonebook
    internal_checkpoint="User has to restart the app to have the phonebook synched again"
    Given user has a "mobile_line" product
      And the "<allowance>" tab is selected
      And user has made consumption on the "<allowance>" allowances in the "mobile_line" product
      And user has granted "contacts" permissions
      And a phone number from the "<allowance>" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "consumption-events-list-postpay" module configured in CMS for "<page>" page
      And user is in the "Consumption" page
     When updates the "Contact Test" contact to "Contact Test Updated" in the phonebook
     Then the stored line is displayed with the "Contact Test Updated" name in the "<allowance>" events

    Examples:
      | allowance | page                         | jira_id    |
      | minutes   | consumption-details-calls    | QANOV-8086 |
      | messages  | consumption-details-messages | QANOV-8087 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @manual @jira.link.relates_to.NOV-122143
  @moves @regression @automation.hard
  Scenario Outline: User cannot see the mobile products in the Consumption details screen as Friendly Names if the user has deleted the contact stored in the phonebook
    internal_checkpoint="User has to restart the app to have the phonebook synched again"
    Given user has a "mobile_line" product
      And the "<allowance>" tab is selected
      And user has made consumption on the "<allowance>" allowances in the "mobile_line" product
      And user has granted "contacts" permissions
      And a phone number from the "<allowance>" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "consumption-events-list-postpay" module configured in CMS for "<page>" page
      And user is in the "Consumption" page
     When deletes the "Contact Test" contact in the phonebook
     Then the deleted line is displayed with the phone number in the "<allowance>" events
      And the deleted line is displayed with the default icon in the "<allowance>" events

    Examples:
      | allowance | page                         | jira_id    |
      | minutes   | consumption-details-calls    | QANOV-8088 |
      | messages  | consumption-details-messages | QANOV-8091 |

  @jira.QANOV-8098 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.relates_to.NOV-137100
  @moves @regression @automation.hard @impeded_legacy
  Scenario: Legado user with Fusion plan cannot see the line names in Account main tab as Friendly Names if the user has not the phonebook synchronized
    User has to restart the app to have the phonebook synched again
    Given user has a "fusion" plan
      And user has a "legado" account type
      And user has denied "contacts" permissions
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
      And a phone number from the plan is stored with "Contact Test" name in the phonebook
     Then the stored line is displayed with the "Línea móvil" text in the mobile line roundels

  @jira.QANOV-8099 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.relates_to.NOV-137111
  @moves @regression @automation.hard @impeded_legacy
  Scenario: Legado user with convergente plan cannot see the avatar picture in Account main tab if the user has not synchronized the native phonebook
    internal_checkpoint="User has to restart the app to have the phonebook synched again
    The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "fusion" plan
      And user has a "legado" account type
      And user has denied "contacts" permissions
      And a phone number from the plan is stored with avatar in the phonebook
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the stored line is displayed with the default icon in the mobile lines roundels

  @jira.QANOV-8100 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.relates_to.NOV-91908
  @moves @regression @automation.hard @impeded_legacy
  Scenario: Legado user with convergente plan cannot see the line names in Account main tab as Friendly Names if the user has not the phone numbers stored in the phonebook
    internal_checkpoint="The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "fusion" plan
      And user has a "legado" account type
      And user has granted "contacts" permissions
      And user has not stored any phone number from the plan in the phonebook
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "Línea móvil" text is displayed in each mobile lines roundel

  @jira.QANOV-8101 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.relates_to.NOV-137112
  @moves @regression @automation.hard @impeded_legacy
  Scenario: Legado user with convergente plan cannot see the avatar picture in Account main tab if the user has not the saved the line as a contact
    internal_checkpoint="The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "fusion" plan
      And user has a "legado" account type
      And user has granted "contacts" permissions
      And user has not stored any phone number of the plan in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
     Then the default mobile icon is displayed in each mobile lines roundel

  @jira.QANOV-8102 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.relates_to.NOV-91915
  @moves @regression @automation.hard @impeded_legacy
  Scenario: Legado user with convergente plan cannot see the line image in Account main tab if the mobile line account has not an image on the local phonebook
    User has to restart the app to have the phonebook synched again
    Given user has a "fusion" plan
      And user has a "legado" account type
      And user is in the "Account" page
      And user has the communications and leisure content displayed
      And user has granted "contacts" permissions
      And a phone number from the plan is stored with "Contact Test" name in the phonebook
      And the "Contact Test" contact has not avatar in the phonebook
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the stored line is displayed with the default icon in the mobile lines roundels

  @jira.QANOV-8103 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.relates_to.NOV-91907
  @moves @regression @automation.hard @impeded_legacy
  Scenario: Legado user with convergente plan can see the line names in Account main tab as Friendly Names if the user has the phone numbers stored in his/her phonebook
    internal_checkpoint="User has to restart the app to have the phonebook synched again
    The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "fusion" plan
      And user has a "legado" account type
      And user has granted "contacts" permissions
      And a phone number from the plan is stored with "Contact Test" name in the phonebook
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the stored line is displayed with the "Contact Test" text in the mobile lines roundels

  @jira.QANOV-8104 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.relates_to.NOV-91912
  @moves @regression @automation.hard @impeded_legacy
  Scenario: Legado user with convergente plan can see the line image in Account main tab if the mobile line account has an image on the local phonebook
    User has to restart the app to have the phonebook synched again
    Given user has a "fusion" plan
      And user has a "legado" account type
      And user has granted "contacts" permissions
      And a phone number from the plan is stored with avatar in the phonebook
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the stored line is displayed with the contact avatar in the mobile lines roundels

  @jira.QANOV-8105 @android @ios @mobile @jira.cv.11.2 @manual @jira.link.relates_to.NOV-174897
  @moves @regression @automation.hard @impeded_legacy
  Scenario: Legado user with convergente plan can see the friendly names updated in the account dashboard if the user updates those contacts in the local phonebook
    User has to restart the app to have the phonebook synched again
    Given user has a "fusion" plan
      And user has a "legado" account type
      And user has granted "contacts" permissions
      And a phone number from the plan is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     When updates the "Contact Test" contact to "Contact Test Updated" in the phonebook
     Then the stored line is displayed with the "Contact Test Updated" text in the mobile lines roundels

  @jira.QANOV-8106 @android @ios @mobile @jira.cv.11.2 @manual @jira.link.relates_to.NOV-174898
  @moves @regression @automation.hard @impeded_legacy
  Scenario: Legado user with convergente plan cannot see the friendly name or the avatar in the account dashboard if the user deletes that contact in the local phonebook
    internal_checkpoint="User has to restart the app to have the phonebook synched again
    The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "fusion" plan
      And user has a "legado" account type
      And user has granted "contacts" permissions
      And a phone number from the plan is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When deletes the "Contact Test" contact in the phonebook
     Then the stored line is displayed with the "Línea móvil" text in the mobile line roundels
      And the stored line is displayed with the default icon in the mobile lines roundels
