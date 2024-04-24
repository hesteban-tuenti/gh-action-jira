# -*- coding: utf-8 -*-
@jira.QANOV-216400
Feature: Manage phone payments (third party services configuration)

  Actions Before each Scenario:
    Given user has not the "ACCOUNT_UPDATE_DATA" forbidden use case


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke @har
  Scenario Outline: A BOX7 user with one "<user_product>" product can access to the "Manage Phone Payments" screen
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has "1" products
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     When clicks on the "manage_phone_payments_entrypoint" entrypoint
     Then the "Manage Phone Payments" page is displayed
      And the "Drittanbieterdienste" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    @raitt_drop1
    Examples:
          | product | cv   | user_product | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line  | QANOV-402198     | QANOV-216401 |

    Examples:
          | product | cv   | user_product                    | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot |                  | QANOV-216402 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A BOX7 user with several <user_product> products can access to the "Distributive Manage Phone Payments" screen
    Cancelled products will not be displayed in the distributive screen because this setting is not available for cancelled products.
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has "several" products
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user has the "Distributive Manage Phone Payments" modules configured in CMS for "Distributive Manage Phone Payments" page
      And user is in the "Payment Settings" page
     When clicks on the "manage_phone_payments_entrypoint" entrypoint
     Then the "Distributive Manage Phone Payments" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produkt auswählen und fortfahren" text is displayed
      And the "mobile_lines_list" list is displayed
      And each element in the "mobile_lines_list" list has the "phone_number" field
      And each element in the "mobile_lines_list" list has the "chevron_icon" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | user_product                    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-402198     | QANOV-216403 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot |                  | QANOV-216404 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A BOX7 user with several <user_product> products can access to the "Manage Phone Payments" screen
    Cancelled products will not be displayed in the distributive screen because this setting is not available for cancelled products.
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has "several" products
      And user is in the "Distributive Manage Phone Payments" page
      And user has the "Distributive Manage Phone Payments" modules configured in CMS for "Distributive Manage Phone Payments" page
     When clicks on any element in the "mobile_lines_list" list
     Then the "Manage Phone Payments" page is displayed
      And the "Drittanbieterdienste" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | user_product                    | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216403 | QANOV-402198     | QANOV-216405 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216404 |                  | QANOV-216406 |

  @jira.QANOV-420241 @TBD @android @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile
  @smoke @raitt_drop1 @har
  Scenario: A RAITT user can access to the "Manage Phone Payments" OB webview
    Given user has a "raitt" account type
      And user has a "mobile_line" product
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     When clicks on the "manage_phone_payments_entrypoint" entrypoint
     Then the browser webview with "b2c-sim-settings-app" text in the header is displayed
      And the "SIM-Karte & Einstellungen" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @mobile @sanity
  Scenario Outline: A BOX7 user can see a list of third-party services to allow mobile payments
    For multiproduct users, the user will have to select the desired product before accessing the "Manage Phone Payments" screen.
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Payment Settings" page
     When clicks on the element with "name" field with "[LANG:profile.dashboard.payment_settings.manage_phone_payments]" value of the "payment_settings_list" list
     Then the "Manage Phone Payments" page is displayed
      And the "title" textfield with "Drittanbieterdienste verwalten" text is displayed
      And the "description1" textfield with "Diese Einstellung gilt für alle SIM-Karten mit der Rufnummer des ausgewählten Vertrags." text is displayed
      And the "description2" textfield with "Wähle aus, welche Dienste über die von dir ausgewählte Rufnummer bezahlt werden sollen." text is displayed
      And the "services_list" list is displayed
      And each element in the "services_list" list has the "service_name" field
      And each element in the "services_list" list has the "service_description" field
      And each element in the "services_list" list has the "checkbox" field
      And the "save_changes_button" button with "Änderung speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | user_product                    | depends_on                | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216401:QANOV-216405 | QANOV-216407 |

    @manual
    Examples:
          | product | cv   | user_product                    | depends_on                | jira_id      |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216402:QANOV-216406 | QANOV-216408 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user cannot save the phone payment settings without making any change
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Manage Phone Payments" page
     When clicks on the "save_changes_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderunggen vorgenommen." text is displayed

    Examples:
          | product | cv   | user_product                    | depends_on   | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216407 | QANOV-216409 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216408 | QANOV-216410 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can tap on back button after making any change in the "Manage Phone Payments" page: a cancellation popup is displayed on <client> device
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Manage Phone Payments" page
     When clicks on any element in the "services_list" list
      And clicks on the <button> button
     Then the "Phone Payments Cancellation" popup is displayed
      And the "title" textfield with "Hinweis" text is displayed
      And the "body" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "continue_button" button with "<continue_button>" text is displayed
      And the "cancel_button" button with "<cancel_button>" text is displayed

    Examples:
          | client  | product | cv   | user_product                    | button                           | continue_button | cancel_button | depends_on   | jira_id      |
          | android | blaude  | 13.9 | mobile_line                     | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-216407 | QANOV-216411 |
          | ios     | blaude  | 13.9 | mobile_line                     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-216407 | QANOV-216412 |
          | android | o2de    | 14.2 | mobile_line;home_spot;data_spot | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-216408 | QANOV-216413 |
          | ios     | o2de    | 14.2 | mobile_line;home_spot;data_spot | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-216408 | QANOV-216414 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user decides to continue with the "Manage Phone Payments" flow after seeing the cancellation popup
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Phone Payments Cancellation" popup
     When clicks on the "continue_button" button
     Then the "Manage Phone Payments" page is displayed
      And the "Drittanbieterdienste" header is displayed

    Examples:
          | product | cv   | user_product                    | depends_on                | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216411:QANOV-216412 | QANOV-216415 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216413:QANOV-216414 | QANOV-216416 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user decides to cancel the "Manage Phone Payments" flow after seeing the cancellation popup
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Phone Payments Cancellation" popup
     When clicks on the "cancel_button" button
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed

    Examples:
          | product | cv   | user_product                    | depends_on                | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216411:QANOV-216412 | QANOV-216417 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216413:QANOV-216414 | QANOV-216418 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can <action> a service in the Phone Payments settings: a confirmation popup is displayed
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has the "any" phone payment setting in "<service_status>" status
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Manage Phone Payments" page
     When clicks on the element with "service_name" field with "[CONTEXT:service_name]" value of the "services_list" list
      And clicks on the "save_changes_button" button
     Then the "Phone Payments Confirmation" popup is displayed
      And the "title" textfield with "Du bist dabei, deine Einstellungen zu Drittanbieterdiensten zu ändern." text is displayed
      And the "body" textfield with "Du kannst diese in deinem Profilbereich erneut ändern" text is displayed
      And the "continue_button" button with the "(OK|Ok)" format is displayed
      And the "cancel_button" button with the "(ABBRECHEN|Abbrechen)" format is displayed

    Examples:
          | product | cv   | user_product                    | action     | service_status | depends_on   | jira_id      |
          | blaude  | 13.9 | mobile_line                     | activate   | deactivated    | QANOV-216407 | QANOV-216419 |
          | blaude  | 13.9 | mobile_line                     | deactivate | activated      | QANOV-216407 | QANOV-216420 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | activate   | deactivated    | QANOV-216408 | QANOV-216421 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | deactivate | activated      | QANOV-216408 | QANOV-216422 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user cancels to modify the Phone Payments settings
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Manage Phone Payments" page
     When clicks on any element in the "services_list" list
      And clicks on the "save_changes_button" button
      And the "Phone Payments Confirmation" popup is displayed
      And clicks on the "cancel_button" button
     Then the "Manage Phone Payments" page is displayed
      And the "Drittanbieterdienste" header is displayed

    Examples:
          | product | cv   | user_product                    | depends_on                | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216419:QANOV-216420 | QANOV-216423 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216421:QANOV-216422 | QANOV-216769 |

  @jira.<jira_id> @<product> @android @<ber> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: A BOX7 user confirms to <action> the Phone Payments settings: changes saved successfully
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has "any" phone payment setting in "<service_status>" status
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user has the "Phone Payments Success Feedback" module configured in CMS for "Phone Payments Success Feedback" page
      And user is in the "Payment Settings" page
      And clicks on the element with "name" field with "[LANG:profile.dashboard.payment_settings.manage_phone_payments]" value of the "payment_settings_list" list
      And the "Manage Phone Payments" page is displayed
     When clicks on the element with "service_name" field with "[CONTEXT:service_name]" value of the "services_list" list
      And clicks on the "save_changes_button" button
      And the "Manage Phone Payments Confirmation Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vielen Dank. Deine Einstellungen werden aktualisiert." text is displayed
      And the "message" textfield with "Deine Einstellungen zu Drittanbieterdiensten werden in unseren Systemen aktualisiert. Bitte beachte, dass die Bearbeitung in der Regel wenige Minuten dauert. Du kannst deine Einstellungen unter “Profil” jederzeit erneut ändern." text is displayed
      And the "main_button" button with "Zurück zu den Zahlungseinstellungen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | user_product                    | action     | service_status | ber | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line                     | activate   | deactivated    | ber | QANOV-216419 | QANOV-402198     | QANOV-216770 |
          | blaude  | 13.9 | mobile_line                     | deactivate | activated      |     | QANOV-216420 | QANOV-402198     | QANOV-216771 |

    @manual
    Examples:
          | product | cv   | user_product                    | action     | service_status | ber | depends_on   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | activate   | deactivated    | ber | QANOV-216421 |                  | QANOV-216773 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | deactivate | activated      |     | QANOV-216422 |                  | QANOV-216774 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user who modified the Phone Payment settings successfully can tap on the "<button_name>" button in the Success Feedback screen
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has the "Phone Payments Success Feedback" module configured in CMS for "Phone Payments Success Feedback" page
      And user is in the "Phone Payments Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed

    Examples:
          | product | cv   | user_product                    | depends_on                | button_name              | button_id                       | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216770:QANOV-216771 | Back to payment settings | back_to_payment_settings_button | QANOV-216775 |
          | blaude  | 13.9 | mobile_line                     | QANOV-216770:QANOV-216771 | Close                    | navigation_top_bar.close_button | QANOV-216776 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216773:QANOV-216774 | Back to payment settings | back_to_payment_settings_button | QANOV-216777 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216773:QANOV-216774 | Close                    | navigation_top_bar.close_button | QANOV-216778 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user tries to modify the Phone Payment settings but an error happens (first 3 attempts)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to modify the
    phone payment settings without success. The fourth attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has tried to modify the phone payment settings "<3" times without success
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Manage Phone Payments" page
     When clicks on any element in the "services_list" list
      And clicks on the "save_changes_button" button
      And the "Phone Payments Confirmation" popup is displayed
      And clicks on the "continue_button" button
      And there is an error modifying the phone payment settings
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

    Examples:
          | product | cv   | user_product                    | depends_on                | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216419:QANOV-216420 | QANOV-216780 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216421:QANOV-216422 | QANOV-216781 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can close the error warning after trying to modify the Phone Payment settings without success
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has tried to modify the phone payment settings "<3" times without success
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Manage Phone Payments" page
     When clicks on any element in the "services_list" list
      And clicks on the "save_changes_button" button
      And the "Phone Payments Confirmation" popup is displayed
      And clicks on the "continue_button" button
      And there is an error modifying the phone payment settings
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Manage Phone Payments" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv   | user_product                    | depends_on   | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216780 | QANOV-216782 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216781 | QANOV-216783 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user tries to modify the Phone Payment settings but an error happens (fourth attempt)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to modify the
    phone payment settings without success. The fourth attempt will redirect to a full screen error feedback.
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has tried to modify the phone payment settings "3" times without success
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user has the "Phone Payments Error Feedback" module configured in CMS for "Phone Payments Error Feedback" page
      And user is in the "Manage Phone Payments" page
     When clicks on any element in the "services_list" list
      And clicks on the "save_changes_button" button
      And the "Phone Payments Confirmation" popup is displayed
      And clicks on the "continue_button" button
      And there is an error modifying the phone payment settings
     Then the "Phone Payments Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Your changes have not been saved" text is displayed
      And the "error_message" textfield with "Please try again later" text is displayed
      And the "back_to_payment settings_button" button with "Zurück zu den Zahlungseinstellungen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | product | cv   | user_product                    | depends_on                | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216419:QANOV-216420 | QANOV-216784 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216421:QANOV-216422 | QANOV-216786 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user who is in the "Phone Payments Error Feedback" screen can tap on the "<button_name>" button
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has the "Phone Payments Error Feedback" module configured in CMS for "Phone Payments Error Feedback" page
      And user is in the "Phone Payments Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed

    Examples:
          | product | cv   | user_product                    | depends_on   | button_name              | button_id                       | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216784 | Back to payment settings | back_to_payment_settings_button | QANOV-216787 |
          | blaude  | 13.9 | mobile_line                     | QANOV-216784 | Close                    | navigation_top_bar.close_button | QANOV-216788 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216786 | Back to payment settings | back_to_payment_settings_button | QANOV-216789 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216786 | Close                    | navigation_top_bar.close_button | QANOV-216790 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go to previous screen from the "Phone Payments Error Feedback" screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has any "<user_product>" product in "active" status
      And user has a "box7" account type
      And user has the "Phone Payments Error Feedback" module configured in CMS for "Phone Payments Error Feedback" page
      And user is in the "Phone Payments Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Manage Phone Payments" page is displayed
      And the "Manage phone payments" header is displayed

    Examples:
          | product | cv   | user_product                    | depends_on   | jira_id      |
          | blaude  | 13.9 | mobile_line                     | QANOV-216784 | QANOV-216791 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216786 | QANOV-216792 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
  Scenario Outline: A BOX7 user with all products cancelled cannot edit the phone payments settings
    This screen will be displayed in "only read" mode. Only the services selected by the user will be displayed in the list.
    Given user has any "<user_product>" product
      And user has a "box7" account type
      And user has all products in "cancelled" status
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Manage Phone Payments" page
     Then the "title" textfield with "Drittanbieterdienste verwalten" text is displayed
      And the "description1" textfield with "Diese Einstellung gilt für alle SIM-Karten mit der Rufnummer des ausgewählten Vertrags." text is displayed
      And the "description2" textfield with "Zur Zahlung dieser Dienste hast du diese Telefonnummer ausgewählt." text is displayed
      And the "services_list" list is displayed
      And each element in the "services_list" list has the "service_name" field
      And each element in the "services_list" list has the "service_description" field
      And the "save_changes_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | user_product                    | depends_on                | jira_id      |
          | blaude  | 14.1 | mobile_line                     | QANOV-216401:QANOV-216405 | QANOV-308053 |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-216402:QANOV-216406 | QANOV-308054 |
