# -*- coding: utf-8 -*-
@jira.QANOV-240153
Feature: Cancel contract

  Actions Before each Scenario:
    Given user has not the "SUBSCRIPTION_RESERVE_CANCELLATION" forbidden use case


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @sanity @har
  Scenario Outline: A postpay user without a contract cancellation requested can access to the "Cancel Contract Method" screen from "My Contracts" screen
    Given user has a "postpay" account type
      And user has any "<product_list>" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Cancel Contract Method" module configured in CMS for "Cancel Contract Method" page
      And user is in the "My Contracts" page
     When clicks on the "cancel_contract_entrypoint" entrypoint
     Then the "Cancel Contract Method" page is displayed
      And the "Vertrag kündigen" header is displayed
      And the "title" textfield with "Wie möchtest du kündigen?" text is displayed
      And the "cancellation_method.online_title" textfield with "Online" text is displayed
      And the "cancellation_method.online_radiobutton" button is displayed
      And the "cancellation_method.telephone_tag" textfield with "Empfohlen" text is displayed
      And the "cancellation_method.telephone_title" textfield with "Telefonische Kündigung" text is displayed
      And the "cancellation_method.telephone_radiobutton" button is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    @raitt_drop3
    Examples:
          | product | cv    | depends_on   | product_list | detects                       | parent_test_plan | jira_id      |
          | blaude  | 13.10 | QANOV-217356 | mobile_line  | O2DE-2250:O2DE-2378:O2DE-3068 |                  | QANOV-240154 |

    Examples:
          | product | cv   | depends_on                | product_list                 | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-312322:QANOV-376011 | mobile_line;internet_at_home |         | QANOV-437471     | QANOV-240155 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A postpay user with any contract cancellation requested can access to the "Cancel Contract Detail" screen from "My Contracts" screen
    Possible status of the cancellation returned by the API:
    - not_initiated: the contract cancellation has not been requested yet.
    - requested (DEPRECATED, it's considered the same that not_initiated): the contract cancellation has been requested by the user.
    - confirmed: the contract cancellation request has been confirmed by the user (when OB requires this step).
    - completed: the contract cancellation process has been completed.
    If the cancellation requested is in Confirmed or Completed status, it will display the same "Kündigung bestätigt" tag.
    The "cancellation_contract.title" textfield will show the product alias or the phone number, depending what the user
    have.
    If the user has other cancellable products in active status, a "Make a new cancellation contract" button will be
    displayed at the bottom of the screen.
    User for Blau: 01796826549 / crt12345
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has a contract cancellation requested in "any" status
      And user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Cancel Contract Detail" module configured in CMS for "Cancel Contract Detail" page
      And user is in the "My Contracts" page
     When clicks on the "my_contracts.cancel_contract_entrypoint" entrypoint
     Then the "Cancel Contract Detail" page is displayed
      And the "Vertrag kündigen" header is displayed
      And the "cancellation_contract" module is displayed
      And the "cancellation_contract.title" textfield with "DEINE GEKÜNDIGTEN VERTRÄGE" text is displayed
      And the "cancellation_contract.list" list is displayed
      And each element in the "cancellation_contract.list" list has the "cancellation_tag" field
      And each element in the "cancellation_contract.list" list has the "title" field
      And each element in the "cancellation_contract.list" list has the "date" field
      And the "personal_advantages.section_title" textfield with "JETZT BLEIBEN UND PROFITIEREN" text is displayed
      And the "personal_advantages.tag" textfield with "Exklusiv für Blau Kunden" text is displayed
      And the "personal_advantages.title" textfield with "Dein persönliches Treueangebot" text is displayed
      And the "personal_advantages.description" textfield with "Jetzt sichern" text is displayed
      And the "personal_advantages.chevron" icon is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    @raitt_drop3
    Examples:
          | product | cv    | depends_on   | detects                        | parent_test_plan | jira_id      |
          | blaude  | 13.10 | QANOV-217356 | O2DE-2252:OBO2DE-460:O2DE-3294 |                  | QANOV-240156 |

    Examples:
          | product | cv   | depends_on                | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-312322:QANOV-376011 |         | QANOV-437471     | QANOV-240157 |

  @jira.<jira_id> @<product> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual
  @mobile
  Scenario Outline: A postpay user can see the details of a contract in "<cancellation_status>" status in the "Cancel Contract Detail" screen
    The "cancellation_contract.title" textfield will show the product alias or the phone number, depending what the user
    have.
    If the user has other cancellable products in active status, a "Make a new cancellation contract" button will be
    displayed at the bottom of the screen.
    User for Blau: 01796826549 / crt12345
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has a contract cancellation requested in "<cancellation_status>" status
      And user has the "Cancel Contract Detail" module configured in CMS for "Cancel Contract Detail" page
      And user is in the "Cancel Contract Detail" page
     Then any element in the "cancellation_contract.list" list has the "cancellation_tag" textfield with the "Kündigung bestätigt" text
      And any element in the "cancellation_contract.list" list has the "title" field
      And any element in the "cancellation_contract.list" list has the "date" textfield with the "Gekündigt zum \d{2}. (Jan.\|Feb.\|März\|Apr.\|Mai\|Jun.\|Jul.\|Aug.\|Sept.\|Okt.\|Nov.\|Dez.) \d{4}" format

    Examples:
          | product | cv    | cancellation_status    | test_priority | depends_on   | jira_id      |
          | blaude  | 13.10 | cancellation_confirmed | regression    | QANOV-240156 | QANOV-240158 |
          | blaude  | 13.10 | cancellation_completed | smoke         | QANOV-240156 | QANOV-240160 |
          | o2de    | 14.2  | cancellation_confirmed | regression    | QANOV-240157 | QANOV-240159 |
          | o2de    | 14.2  | cancellation_completed | smoke         | QANOV-240157 | QANOV-240161 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user who has requested cancellations for all products cannot see the "Make a new cancellation" button in the "Cancel Contract Detail" screen
    User for Blau: 01796826549 / crt12345
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has "several" products
      And user has a contract cancellation requested for "all" cancellable products
      And user has the "Cancel Contract Detail" module configured in CMS for "Cancel Contract Detail" page
      And user is in the "Cancel Contract Detail" page
     Then the "make_new_cancellation_button" button is not displayed

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | blaude  | 13.10 | QANOV-240156 | QANOV-240162 |
          | o2de    | 14.2  | QANOV-240157 | QANOV-240163 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user who has requested cancellations for not all products can see the "Make a new cancellation" button in the "Cancel Contract Detail" screen
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has "several" products
      And user has a contract cancellation requested for "not_all" cancellable products
      And user has the "Cancel Contract Detail" module configured in CMS for "Cancel Contract Detail" page
      And user is in the "Cancel Contract Detail" page
     Then the "make_new_cancellation_button" button with "Weitere Kündigung" text is displayed

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | blaude  | 13.10 | QANOV-240156 | QANOV-240164 |
          | o2de    | 14.2  | QANOV-240157 | QANOV-240165 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A multiproduct postpay user who has requested cancellations for not all products can access to the "Cancel Contract Method" screen from "Cancel Contract Detail" screen
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has "several" products
      And user has a contract cancellation requested for "not_all" cancellable products
      And user has the "Cancel Contract Detail" module configured in CMS for "Cancel Contract Detail" page
      And user has the "Cancel Contract Method" module configured in CMS for "Cancel Contract Method" page
      And user is in the "Cancel Contract Detail" page
     When clicks on the "make_new_cancellation_button" button
     Then the "Cancel Contract Method" page is displayed
      And the "Vertrag kündigen" header is displayed
      And the "title" textfield with "Select cancellation method" text is displayed
      And the "cancellation_method.online_title" textfield with "Online" text is displayed
      And the "cancellation_method.online_radiobutton" button is displayed
      And the "cancellation_method.telephone_tag" textfield with "Empfohlen" text is displayed
      And the "cancellation_method.telephone_title" textfield with "Telefonische Kündigung" text is displayed
      And the "cancellation_method.telephone_radiobutton" button is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | blaude  | 13.10 | QANOV-240164 | QANOV-240166 |
          | o2de    | 14.2  | QANOV-240165 | QANOV-240167 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A multiproduct postpay user can access to cancel the contract by telephone: a screen to choose the product is displayed
    Only mobile and internet@home products without a cancellation requested will be displayed.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has "several" products
      And user has the "Cancel Contract Method" module configured in CMS for "Cancel Contract Method" page
      And user has the "Cancel Contract Choose Product" module configured in CMS for "Cancel Contract Choose Product" page
      And user is in the "Cancel Contract Method" page
     When clicks on the "cancellation_method.telephone_radiobutton" button
      And clicks on the "continue_button" button
     Then the "Cancel Contract Choose Product" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produkt auswählen und fortfahren" text is displayed
      And the "products_list" list is displayed
      And each element in the "products_list" list has the "title" field
      And each element in the "products_list" list has the "description" field
      And each element in the "products_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    Examples:
          | product | cv    | depends_on                | jira_id      |
          | blaude  | 13.10 | QANOV-240154:QANOV-240166 | QANOV-240168 |
          | o2de    | 14.2  | QANOV-240155:QANOV-240167 | QANOV-240169 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user can access to the "Cancel Contract Better Offer" screen to cancel an active contract by telephone
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has "several" products
      And user has the "Cancel Contract Choose Product" module configured in CMS for "Cancel Contract Choose Product" page
      And user has the "Cancel Contract Better Offer" module configured in CMS for "Cancel Contract Better Offer" page
      And user is in the "Cancel Contract Choose Product" page
     When clicks on any element in the "products_list" list
     Then the "Cancel Contract Better Offer" page is displayed
      And the "Vertrag kündigen" header is displayed
      And the "title" textfield with "Bevor du gehst" text is displayed
      And the "description" textfield with "Schade, dass du nicht mehr zufrieden bist. Wir würden dir gerne ein Angebot machen." text is displayed
      And the "offer" module is displayed
      And the "offer.title" textfield with "Persönaliche Beratung" text is displayed
      And the "offer.description" textfield with "Ruf uns jetzt an und lasse dich zu einem Treue-Angebot beraten" text is displayed
      And the "offer.button" button with "Jetzt anrufen" text is displayed
      And the "priority" module is displayed
      And the "priority.title" textfield with "Dein Treue-Angebot" text is displayed
      And the "priority.description" textfield with "Entdecke dein persönliches Treue-Angebot direkt online" text is displayed
      And the "priority.button" button with "Zum Angebot" text is displayed
      And the "continue_button" button with "Mit der Kündigung fortfahren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    Examples:
          | product | cv    | depends_on   | detects             | jira_id      |
          | blaude  | 13.10 | QANOV-240168 | O2DE-2250:O2DE-2251 | QANOV-240174 |
          | o2de    | 14.2  | QANOV-240169 |                     | QANOV-240175 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A monoproduct postpay user without a contract cancellation requested can access to cancel the active contract by telephone
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has "1" products
      And user has the "Cancel Contract Method" module configured in CMS for "Cancel Contract Method" page
      And user has the "Cancel Contract Better Offer" module configured in CMS for "Cancel Contract Better Offer" page
      And user is in the "Cancel Contract Method" page
     When clicks on the "cancellation_method.telephone_radiobutton" button
      And clicks on the "continue_button" button
     Then the "Cancel Contract Better Offer" page is displayed
      And the "Vertrag kündigen" header is displayed
      And the "title" textfield with "Bevor du gehst" text is displayed
      And the "description" textfield with "Schade, dass du nicht mehr zufrieden bist. Wir würden dir gerne ein Angebot machen." text is displayed
      And the "offer" module is displayed
      And the "offer.title" textfield with "Persönaliche Beratung" text is displayed
      And the "offer.description" textfield with "Ruf uns jetzt an und lasse dich zu einem Treue-Angebot beraten" text is displayed
      And the "offer.button" button with "Jetzt anrufen" text is displayed
      And the "priority" module is displayed
      And the "priority.title" textfield with "Dein Treue-Angebot" text is displayed
      And the "priority.description" textfield with "Entdecke dein persönliches Treue-Angebot direkt online" text is displayed
      And the "priority.button" button with "Zum Angebot" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    @raitt_drop3
    Examples:
          | product | cv    | depends_on   | detects             | parent_test_plan | jira_id      |
          | blaude  | 13.10 | QANOV-240154 | O2DE-2250:O2DE-2251 |                  | QANOV-240176 |

    Examples:
          | product | cv   | depends_on   | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-240155 |         | QANOV-437471     | QANOV-240177 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can call to get a personal offer instead of cancelling an active contract by phone
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has the "Cancel Contract Better Offer" module configured in CMS for "Cancel Contract Better Offer" page
      And user is in the "Cancel Contract Better Offer" page
     When clicks on the "offer.button" button
     Then the "dialer" app is displayed

    Examples:
          | product | depends_on                | jira_id      |
          | blaude  | QANOV-240174:QANOV-240176 | QANOV-325333 |
          | o2de    | QANOV-240175:QANOV-240177 | QANOV-325334 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-3000
  @manual @mobile @regression
  Scenario Outline: A postpay user who wants to cancel the contract by phone can access to the e-contract (VVL) webview
    webview-id: prod-b2c-blau-start-tab-entry-point-vvl-deactivation-date
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has the "Cancel Contract Better Offer" module configured in CMS for "Cancel Contract Better Offer" page
      And user is in the "Cancel Contract Better Offer" page
     When clicks on the "priority.button" button
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Cancel Contract Better Offer" page is displayed

    Examples:
          | product | cv    | header  | depends_on                | jira_id      |
          | blaude  | 13.10 | blau.de | QANOV-240174:QANOV-240176 | QANOV-240180 |
          | o2de    | 14.2  | o2.de   | QANOV-240175:QANOV-240177 | QANOV-240181 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A postpay user confirms the cancellation of an active contract by telephone: request sent successfully
    NOTE: formely, when the user completed this flow, an API request was sent to the OB. Now, no API request is sent, we
    just show a Feedback screen indicating to the user that he has to call by telephone. If the user doesn't call, no
    cancelation request is generated, so it will no be displayed in the app.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has the "Cancel Contract Better Offer" module configured in CMS for "Cancel Contract Better Offer" page
      And user has the "Cancel Contract Info Feedback" module configured in CMS for "Cancel Contract Info Feedback" page
      And user is in the "Cancel Contract Better Offer" page
     When clicks on the "continue_button" button
     Then the "Cancel Contract Info Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Telefonische Kündigung" text is displayed
      And the "info_message" textfield with "Hier kannst du einfach und bequem telefonisch kündigen. Du hast noch Fragen? Unsere kompetenten Mitarbeiter helfen dir gerne weiter." text is displayed
      And the "call_now_button" button with "Jetzt anrufen" text is displayed
      And the "back_to_my_contracts_link" link with "Zurück zu Verträge" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    @raitt_drop3
    Examples:
          | product | cv    | depends_on                | product_list | detects   | parent_test_plan | jira_id      |
          | blaude  | 13.10 | QANOV-240174:QANOV-240176 | mobile_line  | O2DE-2250 |                  | QANOV-240184 |

    Examples:
          | product | cv   | depends_on                | product_list                 | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-240175:QANOV-240177 | mobile_line;internet_at_home |         | QANOV-437471     | QANOV-240185 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user who wants to cancel the contract by telephone can call to hotline from the "Cancel Contract Info Feedback" screen
    The contract cancellation number is provided by the API, and depends on the type of product.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has the "Cancel Contract Info Feedback" module configured in CMS for "Cancel Contract Info Feedback" page
      And user is in the "Cancel Contract Info Feedback" page
     When clicks on the "call_now_button" button
     Then the "dialer" app is displayed
      And the "+49 (0) 180 5 571766" phone number is inserted on the dialer

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | blaude  | 13.10 | QANOV-240184 | QANOV-240186 |
          | o2de    | 14.2  | QANOV-240185 | QANOV-240187 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1829
  @jira.link.detects.O2DE-1831 @manual @mobile @regression
  Scenario Outline: A postpay user who wants to cancel the contract by telephone can go back to My Contracts screen from the "Cancel Contract Info Feedback" screen
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has the "Cancel Contract Info Feedback" module configured in CMS for "Cancel Contract Info Feedback" page
      And user is in the "Cancel Contract Info Feedback" page
     When clicks on the "back_to_my_contracts_link" link
     Then the "My Contracts" page is displayed

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | blaude  | 13.10 | QANOV-240184 | QANOV-240188 |
          | o2de    | 14.2  | QANOV-240185 | QANOV-240189 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user confirms the cancellation of an active contract by telephone: request sent unsuccessfully
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has the "Cancel Contract Better Offer" module configured in CMS for "Cancel Contract Better Offer" page
      And user has the "Cancel Contract Error Feedback" module configured in CMS for "Cancel Contract Error Feedback" page
      And user is in the "Cancel Contract Better Offer" page
     When clicks on the "continue_button" button
      And there is an error sending the cancellation form
     Then the "Cancel Contract Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht" text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut" text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    Examples:
          | product | cv    | depends_on                | jira_id      |
          | blaude  | 13.10 | QANOV-240174:QANOV-240176 | QANOV-240190 |
          | o2de    | 14.2  | QANOV-240175:QANOV-240177 | QANOV-240191 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can go back to the Profile screen from the "Cancel Contract Error Feedback" screen
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has the "Cancel Contract Error Feedback" module configured in CMS for "Cancel Contract Error Feedback" page
      And user is in the "Cancel Contract Error Feedback" page
     When clicks on the "back_to_profile_button" button
     Then the "Profile" page is displayed

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | blaude  | 13.10 | QANOV-240190 | QANOV-240192 |
          | o2de    | 14.2  | QANOV-240191 | QANOV-240193 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A postpay user can access to cancel a contract online
    The offer's content is hardcoded and provided by the OB.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has the "Cancel Contract Method" module configured in CMS for "Cancel Contract Method" page
      And user has the "Cancel Contract Better Offer" module configured in CMS for "Cancel Contract Better Offer" page
      And user is in the "Cancel Contract Method" page
     When clicks on the "cancellation_method.online_radiobutton" button
      And clicks on the "continue_button" button
     Then the "Cancel Contract Better Offer" page is displayed
      And the "Vertrag kündigen" header is displayed
      And the "title" textfield with "Bevor du gehst" text is displayed
      And the "description" textfield with "Schade, dass du nicht mehr zufrieden bist. Wir würden dir gerne ein Angebot machen." text is displayed
      And the "offer" module is displayed
      And the "offer.title" textfield with "Persönaliche Beratung" text is displayed
      And the "offer.description" textfield with "Ruf uns jetzt an und lasse dich zu einem Treue-Angebot beraten" text is displayed
      And the "offer.button" button with "Jetzt anrufen" text is displayed
      And the "priority" module is displayed
      And the "priority.title" textfield with "Dein Treue-Angebot" text is displayed
      And the "priority.description" textfield with "Entdecke dein persönliches Treue-Angebot direkt online" text is displayed
      And the "priority.button" button with "Zum Angebot" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    @raitt_drop3
    Examples:
          | product | cv    | depends_on                | detects             | parent_test_plan | jira_id      |
          | blaude  | 13.10 | QANOV-240154:QANOV-240166 | O2DE-2250:O2DE-2251 |                  | QANOV-240194 |

    Examples:
          | product | cv   | depends_on                | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-240155:QANOV-240167 |         | QANOV-437471     | QANOV-240195 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user who wants to cancel the contract online can call to get a personal offer
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has the "Cancel Contract Method" module configured in CMS for "Cancel Contract Method" page
      And user has the "Cancel Contract Better Offer" module configured in CMS for "Cancel Contract Better Offer" page
      And user is in the "Cancel Contract Method" page
     When clicks on the "cancellation_method.online_radiobutton" button
      And clicks on the "continue_button" button
      And the "Cancel Contract Better Offer" page is displayed
      And clicks on the "offer.button" button
     Then the "dialer" app is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-240194 | QANOV-325335 |
          | o2de    | QANOV-240195 | QANOV-325336 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-3000
  @manual @mobile @regression
  Scenario Outline: A postpay user who wants to cancel the contract online can access to the e-contract (VVL) webview
    webview-id: prod-b2c-blau-start-tab-entry-point-vvl-deactivation-date
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has the "Cancel Contract Method" module configured in CMS for "Cancel Contract Method" page
      And user has the "Cancel Contract Better Offer" module configured in CMS for "Cancel Contract Better Offer" page
      And user is in the "Cancel Contract Method" page
     When clicks on the "cancellation_method.online_radiobutton" button
      And clicks on the "continue_button" button
      And the "Cancel Contract Better Offer" page is displayed
      And clicks on the "priority.button" button
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Cancel Contract Better Offer" page is displayed

    Examples:
          | product | cv    | header  | depends_on   | jira_id      |
          | blaude  | 13.10 | blau.de | QANOV-240194 | QANOV-240198 |
          | o2de    | 14.2  | o2.de   | QANOV-240195 | QANOV-240199 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A postpay user who wants to cancel the contract online can access to the online form
    Given user has a "postpay" account type
      And user has any "<product_list>" product not in "cancelled" status
      And user has not a contract cancellation requested
      And user has the "Cancel Contract Method" module configured in CMS for "Cancel Contract Method" page
      And user has the "Cancel Contract Better Offer" module configured in CMS for "Cancel Contract Better Offer" page
      And user is in the "Cancel Contract Method" page
     When clicks on the "cancellation_method.online_radiobutton" button
      And clicks on the "continue_button" button
      And the "Cancel Contract Better Offer" page is displayed
      And clicks on the "continue_button" button
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Cancel Contract Better Offer" page is displayed

    Examples:
          | product | cv    | product_list                 | header                                       | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.10 | mobile_line                  | Ihr Kündigungswunsch \| Blau                 | QANOV-240194 |                  | QANOV-240200 |
          | o2de    | 14.2  | mobile_line;internet_at_home | o2 Handyvertrag kündigen - so einfach geht's | QANOV-240195 | QANOV-437471     | QANOV-240201 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user with a contract cancellation requested can access to the offers screen from the "Cancel Contract Detail" screen
    An OB webview will be displayed with offers and advantages with winback for the user.
    Given user has any "mobile_line;internet_at_home" product not in "cancelled" status
      And user has a contract cancellation requested in "any" status
      And user has the "Cancel Contract Detail" module configured in CMS for "Cancel Contract Detail" page
      And user is in the "Cancel Contract Detail" page
     When clicks on the "personal_advantages.chevron" icon
     Then the internal webview is displayed
      And the "Tarif" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Cancel Contract Detail" page is displayed

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | blaude  | 13.10 | QANOV-240156 | QANOV-240216 |
          | o2de    | 14.2  | QANOV-240157 | QANOV-240217 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1832
  @mobile @smoke
  Scenario Outline: A <stack> prepay user can access to the "Cancel Contract Method" OB webview from "Profile" screen
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And user has any "mobile_line" product not in "cancelled" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Cancel Contract Method" module configured in CMS for "Cancel Contract Method" page
      And user is in the "Profile" page
     When clicks on the "cancel_contract_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "<string>" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Profile" page is displayed

    @live @manual @next @raitt_drop3
    Examples:
          | product | cv    | stack | string    | depends_on                | jira_id      |
          | blaude  | 14.10 | raitt | Kündigung | QANOV-217320:QANOV-386057 | QANOV-492079 |

    @automatic @ber @live @next
    Examples:
          | product | cv    | stack | string           | depends_on                | jira_id      |
          | blaude  | 13.10 | box7  | Vertrag kündigen | QANOV-217320:QANOV-386057 | QANOV-241997 |

    @ber @manual
    Examples:
          | product | cv   | stack | string           | depends_on                | jira_id      |
          | o2de    | 14.2 | box7  | Vertrag kündigen | QANOV-259695:QANOV-386058 | QANOV-241998 |
