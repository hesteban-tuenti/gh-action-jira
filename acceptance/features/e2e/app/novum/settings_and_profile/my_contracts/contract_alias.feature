# -*- coding: utf-8 -*-
@jira.QANOV-239726
Feature: Contract Alias

  Actions Before each Scenario:
    Given user has a "postpay" account type


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user without any alias can access to the "Contract Alias Choose Product" screen
    If the product has not an alias, the name field will show:
    - Phone number for a Mobile Line product
    - Device name for a My Handy product
    - Installation address for a internet@home product
    If the product has not an alias, a description field will show:
    - Tariff name for a Mobile Line product
    - No description for a My Handy product
    - 'internet@home' text for a internet@home product
    Given user has "several" products
      And user has any "mobile_line;internet_at_home" product in "active" status
      And user has no alias for any product
      And user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Contract Alias Choose Product" module configured in CMS for "Contract Alias Choose Product" page
      And user is in the "My Contracts" page
     When clicks on the "my_contracts.change_contract_alias_entrypoint" entrypoint
     Then the "Contract Alias Choose Product" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produkt auswählen und fortfahren" text is displayed
      And the "products_list" list is displayed
      And each element in the "products_list" list has the "icon" field
      And each element in the "products_list" list has the "name" field
      And each element in the "products_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    Examples:
          | product | cv   | depends_on                | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-217356              |                  | QANOV-239727 |
          | o2de    | 14.2 | QANOV-312322:QANOV-376011 | QANOV-437471     | QANOV-239728 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @sanity
  Scenario Outline: A multiproduct postpay user with alias in all the products can access to the "Contract Alias Choose Product" screen
    If the product has an alias, the name field will show:
    - Phone number for a Mobile Line product
    - Alias for a My Handy product
    - Alias for a internet@home product
    If the product has an alias, the description field will show:
    - The 'Alias · Tariff name' for a Mobile Line product
    - Device name for a My Handy product
    - The installation address for a internet@home product
    NOTE: right now, although the user inserts an alias for a internet product, the alias will be ignored in the app
    (subscription selector, disambiguation screens).
    Given user has "several" products
      And user has any "<user_product>" product in "active" status
      And user has alias for all products
      And user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Contract Alias Choose Product" module configured in CMS for "Contract Alias Choose Product" page
      And user is in the "My Contracts" page
     When clicks on the "change_contract_alias_entrypoint" entrypoint
     Then the "Contract Alias Choose Product" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produkt auswählen und fortfahren" text is displayed
      And the "products_list" list is displayed
      And each element in the "products_list" list has the "icon" field
      And each element in the "products_list" list has the "name" field
      And each element in the "products_list" list has the "description" field
      And each element in the "products_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    @automatic @live @next
    Examples:
          | product | cv   | user_product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line  | QANOV-217356 |                  | QANOV-239729 |

    @manual
    Examples:
          | product | cv   | user_product                 | depends_on                | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-312322:QANOV-376011 | QANOV-437471     | QANOV-239730 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A multiproduct postpay user can access to the "Contract Alias Edit" screen of the selected product
    If the product selected has already an alias, the "alias_inputtext" field will display that alias.
    Given user has "several" products
      And user has any "mobile_line;internet_at_home" product in "active" status
      And user has a "<product_type>" product
      And user has the "Contract Alias Choose Product" module configured in CMS for "Contract Alias Choose Product" page
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Choose Product" page
     When clicks on the "<product_type>" element in the "products_list" list
     Then the "Contract Alias Edit" page is displayed
      And the "Verträge benennen" header is displayed
      And the "title" textfield with "Name des Vertrags ändern" text is displayed
      And the "description" textfield with "Gib einen Namen ein, unter welchem dieser Vertrag in Zukunft zu finden sein wird." text is displayed
      And the "alias_inputtext" inputtext with the "Name des Vertrags" placeholder is displayed
      And the "alias_description" textfield with "Max. 20 Zeichen" text is displayed
      And the "change_alias_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    Examples:
          | product | cv   | product_type     | depends_on                | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line      | QANOV-239727:QANOV-239729 |                  | QANOV-239733 |
          | blaude  | 13.9 | my_handy         | QANOV-239727:QANOV-239729 |                  | QANOV-239734 |
          | o2de    | 14.2 | mobile_line      | QANOV-239728:QANOV-239730 |                  | QANOV-239735 |
          | o2de    | 14.2 | my_handy         | QANOV-239728:QANOV-239730 |                  | QANOV-239736 |
          | o2de    | 14.2 | internet_at_home | QANOV-239728:QANOV-239730 | QANOV-437471     | QANOV-239737 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke @har
  Scenario Outline: A monoproduct postpay user can access to the "Contract Alias Edit" screen
    If the product selected has already an alias, the "alias_inputtext" field will display that alias.
    Given user has "1" products
      And user has any "<user_product>" product in "active" status
      And user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Contract Alias Choose Product" module configured in CMS for "Contract Alias Choose Product" page
      And user is in the "My Contracts" page
     When clicks on the "change_contract_alias_entrypoint" entrypoint
     Then the "Contract Alias Edit" page is displayed
      And the "Verträge benennen" header is displayed
      And the "title" textfield with "Name des Vertrags ändern" text is displayed
      And the "description" textfield with "Gib einen Namen ein, unter welchem dieser Vertrag in Zukunft zu finden sein wird." text is displayed
      And the "alias_inputtext" inputtext is displayed
      And the "alias_inputtext_placeholder" placeholder with "Name des Vertrags" text is displayed
      And the "alias_description" textfield with "Max. 20 Zeichen" text is displayed
      And the "change_alias_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    @automatic @live @next
    Examples:
          | product | cv   | user_product | depends_on   | detects  | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line  | QANOV-217356 | LOC-1038 |                  | QANOV-239738 |

    @manual
    Examples:
          | product | cv   | user_product                 | depends_on                | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-312322:QANOV-376011 |         | QANOV-437471     | QANOV-239739 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with an alias can see the alias inputtext filled in the "Contract Alias Edit" screen
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has an alias stored for the "any" product in the contract details
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page for the matching product
     Then the "alias_inputtext" inputtext is not empty

    Examples:
          | product | depends_on                                          | jira_id      |
          | blaude  | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-392722 |
          | o2de    | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-392723 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user without an alias can see the alias inputtext empty in the "Contract Alias Edit" screen
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has not an alias stored for the "any" product in the contract details
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page for the matching product
     Then the "alias_inputtext" inputtext is empty

    Examples:
          | product | depends_on                                          | jira_id      |
          | blaude  | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-392724 |
          | o2de    | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-392725 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with an alias change in progress can see a comment about the status in the "Contract Alias Edit" screen
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has an alias in "in_progress" status
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page for the matching product
     Then the "Contract Alias Edit" page is displayed
      And the "alias_status_comment" textfield with "Your contract alias is in progress so it will be changed soon. If you want you can change to other alias." text is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 13.9 | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-239740 |
          | o2de    | 14.2 | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-239741 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can tap on back button after editing the contract alias on <client> device
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page
     When fills the "alias_inputtext" inputtext with the "Alias Test QA" text
      And clicks on the <button> button
     Then the "Contract Alias Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "popup.accept" button with "<continue_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | product | cv   | client  | button                           | continue_button | cancel_button | depends_on                                          | jira_id      |
          | blaude  | 13.9 | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-239742 |
          | blaude  | 13.9 | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-239743 |
          | o2de    | 14.2 | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-239744 |
          | o2de    | 14.2 | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-239745 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user decides to continue with the contract alias flow after seeing the Contract Alias Cancellation popup
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Contract Alias Edit" page is displayed
      And the "Verträge benennen" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-239742:QANOV-239743 | QANOV-239746 |
          | o2de    | 14.2 | QANOV-239744:QANOV-239745 | QANOV-239747 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user decides to cancel with the contract alias flow after seeing the Contract Alias Cancellation popup
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "My Contracts" page is displayed
      And the "Verträge" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-239742:QANOV-239743 | QANOV-239748 |
          | o2de    | 14.2 | QANOV-239744:QANOV-239745 | QANOV-239749 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user cannot change the contract alias of a product without making any change
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has an alias stored for the "any" product in the contract details
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page for the matching product
     When clicks on the "change_alias_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 13.9 | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-239750 |
          | o2de    | 14.2 | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-239751 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user cannot remove the contract alias of a product
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has an alias stored for the "any" product in the contract details
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page for the matching product
     When clears the "alias_inputtext" inputtext
      And clicks on the "change_alias_button" button
     Then the "alias_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 13.9 | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-239752 |
          | o2de    | 14.2 | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-239753 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user cannot add a contract alias to a product without filling the alias field
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has not an alias stored for the "any" product in the contract details
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page for the matching product
     When clicks on the "change_alias_button" button
     Then the "alias_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 13.9 | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-239754 |
          | o2de    | 14.2 | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-239755 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user cannot add/edit a contract alias longer than 20 characters
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page
     When clears the "alias_inputtext" inputtext
      And fills the "alias_inputtext" inputtext with the "morethantwentycharacters" text
      And clicks on the "change_alias_button" button
     Then the "alias_error_textfield" textfield with "Der Alias kann maximal 20 Zeichen lang sein." text is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 13.9 | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-392727 |
          | o2de    | 14.2 | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-392728 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A postpay user can add a contract alias successfully
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has not an alias stored for the "any" product in the contract details
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user has the "Contract Alias Success Feedback" module configured in CMS for "Contract Alias Success Feedback" page
      And user is in the "Contract Alias Edit" page for the matching product
     When fills the "alias_inputtext" inputtext with the "First Alias Test QA" text
      And clicks on the "change_alias_button" button
     Then the "Contract Alias Success Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with the "(Dein Vertrag wurde erfolgreich umbenannt)|(Wir haben deine Anfrage erhalten)" format is displayed
      And the "message" textfield with the "(Die Änderungen sind beim nächsten Login sichtbar.)|(Es kann eine Weile dauern bis deine Änderungen sichtbar werden.)" format is displayed
      And the "close_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on                                          | detects    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-239733:QANOV-239734:QANOV-239738              | OBO2DE-160 |                  | QANOV-239756 |

    Examples:
          | product | cv   | depends_on                                          | detects    | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 |            | QANOV-437471     | QANOV-239757 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user wants to change a contract alias: a confirmation popup is displayed
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has an alias stored for the "any" product in the contract details
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page for the matching product
     When fills the "alias_inputtext" inputtext with the "Change Alias Test QA" text
      And clicks on the "change_alias_button" button
     Then the "Change Alias Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen übernehmen?" text is displayed
      And the "popup.message" textfield with "Du kannst den Vertragsnamen jederzeit erneut anpassen." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 13.9 | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-239758 |
          | o2de    | 14.2 | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-239759 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can cancel to change the alias
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has an alias stored for the "any" product in the contract details
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Change Alias Confirmation" popup
     When clicks on the "popup.cancel" button
     Then the "Change Alias Confirmation" popup is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-239758 | QANOV-239760 |
          | o2de    | 14.2 | QANOV-239759 | QANOV-239761 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: A postpay user can change a contract alias successfully
    NOTE: if the alias change takes too long, an informative screen will be displayed instead of the Success Feedback screen.
    Given user has any "<user_product>" product in "active" status
      And user has "1" products
      And user has a product with alias
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user has the "Contract Alias Success Feedback" module configured in CMS for "Contract Alias Success Feedback" page
      And user is in the "My Contracts" page
      And clicks on the "change_contract_alias_entrypoint" entrypoint
      And the "Contract Alias Edit" page is displayed
      And fills the "alias_inputtext" inputtext with the "RANDOM:6" text
      And clicks on the "change_alias_button" button
      And the "Change Alias Confirmation Popup" popup is displayed
     When clicks on the "popup.accept" button
     Then the "Contract Alias Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with the "(Dein Vertrag wurde erfolgreich umbenannt)|(Wir haben deine Anfrage erhalten)" format is displayed
      And the "message" textfield with the "(Die Änderungen sind beim nächsten Login sichtbar.)|(Es kann eine Weile dauern bis deine Änderungen sichtbar werden.)" format is displayed
      And the "close_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | user_product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line  | QANOV-239758 |                  | QANOV-239762 |

    @manual
    Examples:
          | product | cv   | user_product                 | depends_on   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-239759 | QANOV-437471     | QANOV-239763 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can go back to "My contracts" screen from the "Contract Alias Success Feedback" screen
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has the "Contract Alias Success Feedback" module configured in CMS for "Contract Alias Success Feedback" page
      And user is in the "Contract Alias Success Feedback" page
     When clicks on the "close_button" button
     Then the "My Contracts" page is displayed
      And the "Verträge" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-239756:QANOV-239762 | QANOV-239764 |
          | o2de    | 14.2 | QANOV-239757:QANOV-239763 | QANOV-239765 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user changes a contract alias but it takes too long: an informative screen is displayed
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has an alias stored for the "any" product in the contract details
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user has the "Contract Alias Informative Feedback" module configured in CMS for "Contract Alias Informative Feedback" page
      And user is in the "Change Alias Confirmation" popup
     When clicks on the "popup.accept" button
      And the contract change takes too long
     Then the "Contract Alias Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Es kann eine Weile dauern bis deine Änderungen sichtbar werden." text is displayed
      And the "close_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-239758 | QANOV-325054 |
          | o2de    | QANOV-239759 | QANOV-325055 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can go back to "My contracts" screen from the "Contract Alias Informative Feedback" screen
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has the "Contract Alias Informative Feedback" module configured in CMS for "Contract Alias Informative Feedback" page
      And user is in the "Contract Alias Informative Feedback" page
     When clicks on the "close_button" button
     Then the "My Contracts" page is displayed
      And the "Verträge" header is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-325054 | QANOV-325056 |
          | o2de    | QANOV-325055 | QANOV-325057 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user tries to add a contract alias but an error happens (first 3 attempts)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to add the contract
    alias without success. The fourth attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has not an alias stored for the "any" product in the contract details
      And user has tried to save a contract alias "<3" times without success
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page for the matching product
     When fills the "alias_inputtext" inputtext with the "Alias Test QA" text
      And clicks on the "change_alias_button" button
      And there is an error saving the contract alias
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 13.9 | QANOV-239733:QANOV-239734:QANOV-239738              | QANOV-239766 |
          | o2de    | 14.2 | QANOV-239735:QANOV-239736:QANOV-239737:QANOV-239739 | QANOV-239767 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can close the error warning after trying to add the contract alias without success
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has not an alias stored for the "any" product in the contract details
      And user has tried to save a contract alias "<3" times without success
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Contract Alias Edit" page for the matching product
     When fills the "alias_inputtext" inputtext with the "Alias Test QA" text
      And clicks on the "change_alias_button" button
      And there is an error saving the contract alias
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Contract Alias Edit" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-239766 | QANOV-239768 |
          | o2de    | 14.2 | QANOV-239767 | QANOV-239769 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user tries to change a contract alias but an error happens (first 3 attempts)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to change the contract
    alias without success. The fourth attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has an alias stored for the "any" product in the contract details
      And user has tried to save a contract alias "<3" times without success
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Change Alias Confirmation" popup
     When clicks on the "popup.accept" button
      And there is an error saving the contract alias
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-239758 | QANOV-239770 |
          | o2de    | 14.2 | QANOV-239759 | QANOV-239771 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can close the error warning after trying to change the contract alias without success
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has an alias stored for the "any" product in the contract details
      And user has tried to save a contract alias "<3" times without success
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user is in the "Change Alias Confirmation" popup
     When clicks on the "popup.accept" button
      And there is an error saving the contract alias
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Contract Alias Edit" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-239770 | QANOV-239772 |
          | o2de    | 14.2 | QANOV-239771 | QANOV-239773 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user tries to add a contract alias but an error happens (fourth attempt)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to add a contract
    alias without success. The fourth attempt will redirect to a full screen error feedback.
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has not an alias stored for the "any" product in the contract details
      And user has tried to save a contract alias "3" times without success
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user has the "Contract Alias Error Feedback" module configured in CMS for "Contract Alias Error Feedback" page
      And user is in the "Contract Alias Edit" page for the matching product
     When fills the "alias_inputtext" inputtext with the "Alias Test QA" text
      And clicks on the "change_alias_button" button
      And there is an error saving the contract alias
     Then the "Contract Alias Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "We couldn't send your request" text is displayed
      And the "error_message" textfield with "Please try again later" text is displayed
      And the "back_to_my_contracts_button" button with "Zurück zu meinen Verträgen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-239729:QANOV-239730              | QANOV-239774 |
          | o2de    | 14.2 | QANOV-239733:QANOV-239734:QANOV-239735 | QANOV-239775 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user tries to change a contract alias but an error happens (fourth attempt)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to change a contract
    alias without success. The fourth attempt will redirect to a full screen error feedback.
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has an alias stored for the "any" product in the contract details
      And user has tried to save a contract alias "3" times without success
      And user has the "Contract Alias Edit" module configured in CMS for "Contract Alias Edit" page
      And user has the "Contract Alias Error Feedback" module configured in CMS for "Contract Alias Error Feedback" page
      And user is in the "Change Alias Confirmation" popup
     When clicks on the "popup.accept" button
      And there is an error saving the contract alias
     Then the "Contract Alias Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "We couldn't send your request" text is displayed
      And the "error_message" textfield with "Please try again later" text is displayed
      And the "back_to_my_contracts_button" button with "Zurück zu meinen Verträgen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-239758 | QANOV-239776 |
          | o2de    | 14.2 | QANOV-239759 | QANOV-239777 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can go back to "My Contracts" screen from the "Contract Alias Error Feedback" screen
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has the "Contract Alias Error Feedback" module configured in CMS for "Contract Alias Error Feedback" page
      And user is in the "Contract Alias Error Feedback" page
     When clicks on the "back_to_my_contracts_button" button
     Then the "My Contracts" page is displayed
      And the "Verträge" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-239774:QANOV-239776 | QANOV-239778 |
          | o2de    | 14.2 | QANOV-239775:QANOV-239777 | QANOV-239779 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can go to previous screen from the "Contract Alias Error Feedback" screen on <client> devices
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has the "Contract Alias Error Feedback" module configured in CMS for "Contract Alias Error Feedback" page
      And user is in the "Contract Alias Error Feedback" page
     When clicks on the <button> button
     Then the "Contract Alias Edit" page is displayed
      And the "Contract alias" header is displayed

    Examples:
          | product | cv   | client  | button                           | depends_on                | jira_id      |
          | blaude  | 13.9 | android | native "back"                    | QANOV-239774:QANOV-239776 | QANOV-239780 |
          | blaude  | 13.9 | ios     | "navigation_top_bar.back_button" | QANOV-239774:QANOV-239776 | QANOV-239781 |
          | o2de    | 14.2 | android | native "back"                    | QANOV-239775:QANOV-239777 | QANOV-239782 |
          | o2de    | 14.2 | ios     | "navigation_top_bar.back_button" | QANOV-239775:QANOV-239777 | QANOV-239783 |
