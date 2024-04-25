# -*- coding: utf-8 -*-
@jira.QANOV-126429
Feature: Access to Profile Main Screen

  Actions Before each Scenario:
    Given user is in the "Profile" page


  @jira.<jira_id> @<client> @<product> @<har> @jira.cv.<cv> @jira.link.relates_to.NOV-186973 @mobile @regression
  Scenario Outline: User who accesses to profile from <main_tab> tab returns to the same tab after leaving the screen
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "<button>" button
     Then the "<main_tab>" page is displayed

    @automatic @cert2 @jira.dv.Future @live @next
    Examples:
          | product | cv   | main_tab  | button                          | client  | har | jira_id     |
          | moves   | 11.7 | Dashboard | navigation_top_bar.back_button  | android | har | QANOV-6021  |
          | moves   | 11.7 | Dashboard | navigation_top_bar.close_button | ios     | har | QANOV-44508 |
          | moves   | 11.7 | Explore   | navigation_top_bar.back_button  | android |     | QANOV-6023  |
          | moves   | 11.7 | Explore   | navigation_top_bar.close_button | ios     |     | QANOV-44518 |
          | moves   | 11.7 | Gestiones | navigation_top_bar.close_button | ios     |     | QANOV-44509 |
          | moves   | 11.7 | Gestiones | navigation_top_bar.back_button  | android |     | QANOV-47862 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | main_tab | button                          | client  | har | jira_id     |
          | o2uk    | 11.7 | Account  | navigation_top_bar.back_button  | android | har | QANOV-6026  |
          | o2uk    | 11.7 | Account  | navigation_top_bar.close_button | ios     | har | QANOV-44510 |
          | o2uk    | 11.7 | Explore  | navigation_top_bar.back_button  | android |     | QANOV-6028  |
          | o2uk    | 11.7 | Explore  | navigation_top_bar.close_button | ios     |     | QANOV-44511 |
          | o2uk    | 11.7 | Support  | navigation_top_bar.back_button  | android |     | QANOV-6030  |
          | o2uk    | 11.7 | Support  | navigation_top_bar.close_button | ios     |     | QANOV-44512 |

    @automatic @jira.link.parent_test_plan.QANOV-200803 @live @next @old_app @qa
    Examples:
          | product | cv   | main_tab | button                          | client  | har | jira_id     |
          | vivobr  | 11.7 | Account  | navigation_top_bar.back_button  | android |     | QANOV-6032  |
          | vivobr  | 11.7 | Account  | navigation_top_bar.close_button | ios     |     | QANOV-44513 |
          | vivobr  | 11.7 | Explore  | navigation_top_bar.back_button  | android |     | QANOV-6034  |
          | vivobr  | 11.7 | Explore  | navigation_top_bar.close_button | ios     |     | QANOV-44514 |
          | vivobr  | 11.7 | Tab Mais | navigation_top_bar.back_button  | android | har | QANOV-6036  |
          | vivobr  | 11.7 | Tab Mais | navigation_top_bar.close_button | ios     | har | QANOV-44515 |

    @manual
    Examples:
          | product | cv     | main_tab | button                          | client  | jira_id      |
          | blaude  | 13.9   | Account  | navigation_top_bar.back_button  | android | QANOV-217411 |
          | blaude  | 13.9   | Account  | navigation_top_bar.close_button | ios     | QANOV-217412 |
          | blaude  | 13.9   | Explore  | navigation_top_bar.back_button  | android | QANOV-217413 |
          | blaude  | 13.9   | Explore  | navigation_top_bar.close_button | ios     | QANOV-217414 |
          | blaude  | 13.9   | Support  | navigation_top_bar.back_button  | android | QANOV-217415 |
          | blaude  | 13.9   | Support  | navigation_top_bar.close_button | ios     | QANOV-217416 |
          | blaude  | 14.0   | Start    | navigation_top_bar.back_button  | android | QANOV-271654 |
          | blaude  | 14.0   | Start    | navigation_top_bar.close_button | ios     | QANOV-271655 |
          | o2de    | 14.2   | Account  | navigation_top_bar.back_button  | android | QANOV-217417 |
          | o2de    | 14.2   | Account  | navigation_top_bar.close_button | ios     | QANOV-217418 |
          | o2de    | 14.2   | Explore  | navigation_top_bar.back_button  | android | QANOV-217419 |
          | o2de    | 14.2   | Explore  | navigation_top_bar.close_button | ios     | QANOV-217420 |
          | o2de    | 14.2   | Support  | navigation_top_bar.back_button  | android | QANOV-217421 |
          | o2de    | 14.2   | Support  | navigation_top_bar.close_button | ios     | QANOV-217422 |
          | o2de    | 14.2   | Start    | navigation_top_bar.back_button  | android | QANOV-271656 |
          | o2de    | 14.2   | Start    | navigation_top_bar.close_button | ios     | QANOV-271657 |
          | o2es    | Future | Account  | navigation_top_bar.back_button  | android | QANOV-410671 |
          | o2es    | Future | Account  | navigation_top_bar.close_button | ios     | QANOV-410672 |
          | o2es    | Future | Explore  | navigation_top_bar.back_button  | android | QANOV-410673 |
          | o2es    | Future | Explore  | navigation_top_bar.close_button | ios     | QANOV-410674 |
          | o2es    | Future | Support  | navigation_top_bar.back_button  | android | QANOV-410675 |
          | o2es    | Future | Support  | navigation_top_bar.close_button | ios     | QANOV-410676 |
          | o2es    | Future | Invoices | navigation_top_bar.back_button  | android | QANOV-410677 |
          | o2es    | Future | Invoices | navigation_top_bar.close_button | ios     | QANOV-410678 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-186940 @mobile @smoke
  Scenario Outline: User can see the profile entry point from the <main_tab> main tab
    other_affected_versions="2021-07"
    Given user is in the "<main_tab>" page
     Then the "navigation_top_bar.profile_icon" icon is displayed

    @automatic @cert2 @jira.dv.Future @live @next
    Examples:
          | product | cv   | main_tab  | jira_id    |
          | moves   | 11.7 | Dashboard | QANOV-6042 |
          | moves   | 11.7 | Explore   | QANOV-6045 |

    @manual @jira.dv.Future
    Examples:
          | product | cv   | main_tab  | jira_id    |
          | moves   | 24.1 | Gestiones | QANOV-6048 |

    @automatic @cert0 @cert1 @jira.link.parent_test_plan.QANOV-35253 @live @next
    Examples:
          | product | cv   | main_tab | jira_id    |
          | o2uk    | 11.7 | Account  | QANOV-6050 |
          | o2uk    | 11.7 | Explore  | QANOV-6053 |
          | o2uk    | 11.7 | Support  | QANOV-6055 |

    @automatic @live @next
    Examples:
          | product | cv   | main_tab | jira_id      |
          | blaude  | 13.9 | Account  | QANOV-217423 |
          | blaude  | 13.9 | Explore  | QANOV-217424 |
          | blaude  | 13.9 | Support  | QANOV-217425 |
          | blaude  | 14.0 | Start    | QANOV-271658 |
          | o2de    | 14.2 | Account  | QANOV-217426 |
          | o2de    | 14.2 | Explore  | QANOV-217427 |
          | o2de    | 14.2 | Support  | QANOV-217428 |
          | o2de    | 14.2 | Start    | QANOV-271659 |

    @manual
    Examples:
          | product | cv     | main_tab | jira_id      |
          | o2es    | Future | Account  | QANOV-410679 |
          | o2es    | Future | Explore  | QANOV-410680 |
          | o2es    | Future | Support  | QANOV-410681 |
          | o2es    | Future | Invoices | QANOV-410682 |

  @jira.<jira_id> @<ber> @<execution_mode> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @smoke @vivobr @<har>
  Scenario Outline: <account_type> Vivo user can see the profile entry point from the <main_tab> main tab
    Given user has a "<account_type>" account type
      And user has "<plan>" plans
      And user is in the "<main_tab>" page
     Then the "navigation_top_bar.profile_icon" icon is displayed

    @live @next @old_app @qa
    Examples:
          | cv    | account_type   | plan | main_tab  | execution_mode | parent_test_plan          | ber | har | jira_id      |
          | 11.7  | legacy control | 1    | AccountV1 | automatic      |                           |     |     | QANOV-21771  |
          | 11.7  | legacy         | any  | Explore   | automatic      |                           | ber |     | QANOV-21772  |
          | 11.7  | legacy         | any  | Tab Mais  | automatic      |                           |     |     | QANOV-21774  |
          | 11.12 | beatrix        | any  | Account   | automatic      |                           |     | har | QANOV-21779  |
          | 11.12 | beatrix        | any  | Explore   | automatic      |                           |     |     | QANOV-21780  |
          | 11.12 | beatrix        | any  | Tab Mais  | automatic      |                           |     |     | QANOV-21782  |
          | 11.12 | multivivo      | any  | Account   | automatic      |                           |     | har | QANOV-21787  |
          | 11.12 | multivivo      | any  | Explore   | automatic      |                           |     |     | QANOV-21788  |
          | 11.12 | multivivo      | any  | Tab Mais  | automatic      |                           |     |     | QANOV-21790  |
          | 12.0  | convergente    | any  | Account   | automatic      | QANOV-21791               | ber |     | QANOV-21783  |
          | 12.0  | convergente    | any  | Explore   | automatic      | QANOV-21791               |     |     | QANOV-21784  |
          | 12.0  | convergente    | any  | Tab Mais  | automatic      | QANOV-21791               |     |     | QANOV-21786  |
          | 13.5  | jeri           | any  | Account   | automatic      | QANOV-200803:QANOV-226748 | ber |     | QANOV-203812 |
          | 13.5  | jeri           | any  | Explore   | automatic      | QANOV-200803:QANOV-226748 |     |     | QANOV-203813 |
          | 13.5  | jeri           | any  | Tab Mais  | automatic      | QANOV-200803:QANOV-226748 |     |     | QANOV-203814 |
          | 13.5  | control_n      | any  | Account   | automatic      | QANOV-200803              | ber |     | QANOV-203816 |
          | 13.5  | control_n      | any  | Explore   | automatic      | QANOV-200803              |     |     | QANOV-203817 |
          | 13.5  | control_n      | any  | Tab Mais  | automatic      | QANOV-200803              |     |     | QANOV-203818 |

    Examples:
          | cv   | account_type | plan | main_tab  | execution_mode | parent_test_plan          | ber | har | jira_id      |
          | 12.4 | legacy       | any  | Menu Mais | manual         |                           | ber |     | QANOV-599522 |
          | 12.4 | beatrix      | any  | Menu Mais | manual         |                           |     | har | QANOV-599523 |
          | 12.4 | multivivo    | any  | Menu Mais | manual         |                           |     |     | QANOV-599524 |
          | 12.4 | convergente  | any  | Menu Mais | manual         | QANOV-21791               | ber |     | QANOV-599525 |
          | 12.4 | jeri         | any  | Menu Mais | manual         | QANOV-200803:QANOV-226748 |     |     | QANOV-599527 |
          | 12.4 | control_n    | any  | Menu Mais | manual         | QANOV-200803              |     |     | QANOV-599529 |

    @live @next @old_app
    Examples:
          | cv   | account_type   | plan | main_tab      | execution_mode | parent_test_plan        | ber | har | jira_id     |
          | 12.1 | legacy control | any  | Vivo Valoriza | automatic      | QANOV-21737             |     | har | QANOV-21773 |
          | 12.1 | legacy postpay | any  | Vivo Valoriza | automatic      | QANOV-21737             |     |     | QANOV-60170 |
          | 12.1 | beatrix        | any  | Vivo Valoriza | automatic      | QANOV-21737             |     |     | QANOV-21781 |
          | 12.1 | multivivo      | any  | Vivo Valoriza | automatic      | QANOV-21737             | ber |     | QANOV-21789 |
          | 12.1 | convergente    | any  | Vivo Valoriza | automatic      | QANOV-21791:QANOV-21737 |     |     | QANOV-21785 |

    @old_app @qa
    Examples:
          | cv   | account_type | plan    | main_tab      | execution_mode | parent_test_plan          | ber | har | jira_id      |
          | 13.5 | jeri         | several | Vivo Valoriza | automatic      | QANOV-200803:QANOV-226748 |     |     | QANOV-203815 |
          | 13.5 | control_n    | several | Vivo Valoriza | automatic      | QANOV-200803              | ber |     | QANOV-203819 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-186941 @mobile @regression
  Scenario Outline: Profile screen is opened as a new screen on Android devices
    internal_checkpoint="NOTE: For Android presentation is delegated to the OS (it could be from right to left, bottom
    to top, etc)"
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed
      And the "navigation_top_bar.back_button" button is displayed

    @automatic @cert2 @jira.dv.Future @live @next
    Examples:
          | product | cv   | main_tab  | jira_id    |
          | moves   | 11.7 | Dashboard | QANOV-6068 |
          | moves   | 11.7 | Explore   | QANOV-6072 |
          | moves   | 24.1 | Gestiones | QANOV-6075 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | main_tab | jira_id    |
          | o2uk    | 11.7 | Account  | QANOV-6077 |
          | o2uk    | 11.7 | Explore  | QANOV-6079 |
          | o2uk    | 11.7 | Support  | QANOV-6083 |

    Examples:
          | product | cv   | main_tab  | jira_id      |
          | vivobr  | 14.2 | Menu Mais | QANOV-599534 |

    @jira.link.parent_test_plan.QANOV-200803 @live @next @old_app @qa
    Examples:
          | product | cv   | main_tab | jira_id    |
          | vivobr  | 11.7 | Account  | QANOV-6085 |
          | vivobr  | 11.7 | Explore  | QANOV-6088 |
          | vivobr  | 11.7 | Tab Mais | QANOV-6090 |

    @manual
    Examples:
          | product | cv     | main_tab | jira_id      |
          | blaude  | 13.9   | Account  | QANOV-217430 |
          | blaude  | 13.9   | Explore  | QANOV-217431 |
          | blaude  | 13.9   | Support  | QANOV-217432 |
          | blaude  | 14.0   | Start    | QANOV-271660 |
          | o2de    | 14.2   | Account  | QANOV-217433 |
          | o2de    | 14.2   | Explore  | QANOV-217434 |
          | o2de    | 14.2   | Support  | QANOV-217435 |
          | o2de    | 14.2   | Start    | QANOV-271661 |
          | o2es    | Future | Account  | QANOV-410683 |
          | o2es    | Future | Explore  | QANOV-410684 |
          | o2es    | Future | Support  | QANOV-410685 |
          | o2es    | Future | Invoices | QANOV-410686 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-186942 @mobile @regression
  Scenario Outline: Profile screen is opened as a modal on iOS devices
    internal_checkpoint="For modal ios version should be 13 or higher"
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed
      And the "navigation_top_bar.close_button" button is displayed

    @automatic @cert2 @jira.dv.Future @live @next
    Examples:
          | product | cv   | main_tab  | jira_id    |
          | moves   | 11.7 | Dashboard | QANOV-6124 |
          | moves   | 11.7 | Explore   | QANOV-6125 |
          | moves   | 24.1 | Gestiones | QANOV-6126 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | main_tab | jira_id    |
          | o2uk    | 11.7 | Account  | QANOV-6127 |
          | o2uk    | 11.7 | Explore  | QANOV-6128 |
          | o2uk    | 11.7 | Support  | QANOV-6129 |

    @automatic @jira.link.parent_test_plan.QANOV-200803 @live @next @old_app @qa
    Examples:
          | product | cv   | main_tab | jira_id    |
          | vivobr  | 11.7 | Account  | QANOV-6130 |
          | vivobr  | 11.7 | Explore  | QANOV-6131 |
          | vivobr  | 11.7 | Tab Mais | QANOV-6132 |

    Examples:
          | product | cv   | main_tab  | jira_id      |
          | vivobr  | 14.2 | Menu Mais | QANOV-599540 |

    @jira.link.detects.OBO2DE-161 @manual
    Examples:
          | product | cv   | main_tab | jira_id      |
          | blaude  | 13.9 | Account  | QANOV-217436 |
          | blaude  | 13.9 | Explore  | QANOV-217437 |
          | blaude  | 13.9 | Support  | QANOV-217439 |
          | blaude  | 14.0 | Start    | QANOV-271662 |
          | o2de    | 14.2 | Account  | QANOV-217440 |
          | o2de    | 14.2 | Explore  | QANOV-217441 |
          | o2de    | 14.2 | Support  | QANOV-217442 |
          | o2de    | 14.2 | Start    | QANOV-271663 |

    @manual
    Examples:
          | product | cv     | main_tab | jira_id      |
          | o2es    | Future | Account  | QANOV-410687 |
          | o2es    | Future | Explore  | QANOV-410688 |
          | o2es    | Future | Support  | QANOV-410689 |
          | o2es    | Future | Invoices | QANOV-410690 |


  @jira.QANOV-556370 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @sanity
  Scenario: Admin user can see his/her name on top of the profile tab
    Given user has a "admin" role
     Then the "title" textfield with "[CONTEXT:user.user_name]" text is displayed

  @jira.QANOV-556371 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario: Admin light user can see the admin's name on top of the profile tab
    Given user has a "admin-light" role
     Then the "title" textfield with "Titular" text is displayed
      And the "subtitle" textfield with "[CONTEXT:user.admin_name]" text is displayed

  @jira.QANOV-410691 @android @ios @jira.cv.24.3 @live @manual @mobile @o2es @sanity
  Scenario: O2es admin user selects Profile icon: DNI is displayed in the profile title
    Given user has a "admin" role
     Then the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" textfield with "[CONTEXT:user.user_dni]" text is displayed

  @jira.QANOV-410692 @android @ios @jira.cv.Future @live @manual @mobile @o2es @smoke
  Scenario: O2es admin-light user selects Profile icon: Phone number is displayed in the profile title
    Given user has a "admin-light" role
     Then the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" textfield with "[CONTEXT:user.msisdn]" text is displayed

  @jira.QANOV-6140 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.10.6 @jira.link.parent_test_plan.QANOV-178803
  @jira.link.relates_to.NOV-72203 @live @mobile @next @o2uk @sanity
  Scenario: O2uk user without a SIM-free product with data connection selects Profile icon: Profile's title is updated according to the user's type
    other_affected_versions="2021-22, 2022-23"
    Given user does not have a "device" account type
      And user has "1" mobile lines
     Then the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" element with user number is displayed with the correct format

  @jira.QANOV-37523 @android @automatic @cert0 @cert1 @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-178803
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-35253 @jira.link.parent_test_plan.QANOV-77438
  @live @mobile @next @o2uk @sanity
  Scenario: O2uk user with a SIM-free product with data connection selects Profile icon: Profile's title is updated according to the user's type
    other_affected_versions="2021-07, 2022-23"
    Given user has a "device" account type
      And user has "0" mobile lines
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" textfield is empty

  @jira.QANOV-145523 @android @automatic @cert0 @cert1 @ios @jira.cv.12.0 @jira.link.detects.O2UK-4171 @live @mobile @next
  @o2uk @sanity
  Scenario: O2uk user with multiple products with data connection selects Profile icon: Profile's title is updated according to the user's type
    Given user has "several" mobile lines
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" textfield is empty

  @jira.QANOV-6139 @android @ios @jira.cv.11.13 @jira.link.parent_test_plan.QANOV-200803 @jira.link.relates_to.NOV-72203
  @manual @mobile @old_app @sanity @vivobr @har
  Scenario: Vivo users logged by CPF with data connection selects Profile icon: Profile's title only shows name and surname
    Given user has a "any" role
      And user has logged by "usr/pwd"
     When clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" textfield is not displayed

  @jira.QANOV-599542 @android @ios @jira.cv.14.2 @manual @mobile @sanity @vivobr @har
  Scenario: Vivo users logged by CPF with data connection selects Profile icon: Profile's title only shows name and surname
    Given user has a "any" role
      And user has logged by "usr/pwd"
      And user is in the "Menu Mais" page
     When clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" textfield is not displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke @har
  Scenario Outline: A <product> user without mobile lines selects Profile icon: Profile's title is updated according to the user's type
    Given user does not have a "mobile_line" product
      And user has the "Profile header" module configured in CMS for "Profile" page
     When clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" textfield with "Vertragsinhaber" text is displayed

    @raitt_drop1
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 13.9 |                  | QANOV-217444 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-437471     | QANOV-217445 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @sanity @har @ber
  Scenario Outline: A BOX7 <product> user with just 1 mobile line selects Profile icon: Profile's title is updated according to the user's type
    Given user has a "box7" account type
      And user has "1" products
      And user has "1" mobile lines
      And user has the "Profile header" module configured in CMS for "Profile" page
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" element with user number is displayed with the correct format

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-217446 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-217447 |

  @jira.QANOV-518135 @android @blaude @ios @jira.cv.14.10 @mobile @raitt_drop1 @manual @sanity @har
  Scenario: A RAITT blaude user with just 1 mobile line selects Profile icon: Profile's title is updated according to the user's type
    We don't display the phone number for RAITT users because we cannot detect the main msisdn.
    Given user has a "raitt" account type
      And user has "1" products
      And user has "1" mobile lines
      And user has the "Profile header" module configured in CMS for "Profile" page
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" textfield is not displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A <product> user with several products selects Profile icon: Profile's title is updated according to the user's type
    Given user has "several" products
      And user has "1" mobile lines
      And user has the "Profile header" module configured in CMS for "Profile" page
     When clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONTEXT:user.user_name]" text is displayed
      And the "subtitle" textfield with "Vertragsinhaber" text is displayed

    @raitt_drop1
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 13.9 |                  | QANOV-217448 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-437471     | QANOV-217449 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can see the app version in the profile screen
    Given user is in the "Profile" page
     Then the "version" textfield with "[CONTEXT:app.version]" text is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 10.0 | QANOV-410693 |

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 10.0   | QANOV-410694 |
          | blaude  | 13.9   | QANOV-410696 |
          | o2de    | 14.2   | QANOV-410697 |
          | o2es    | Future | QANOV-410698 |

  @jira.QANOV-453422 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @sanity
  @vivobr
  Scenario: A vivo user can access the profile screen as a new screen from Menu Mais
    Given user is in the "Menu Mais" page
     When clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Menu Mais" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr @har
  Scenario Outline: A vivo user can not see the profile entrypoint in the <page> page
    This scenario can be closed after the first release.
    Given user is in the "<page>" page
     Then the "navigation_top_bar.profile_icon" icon is not displayed

    Examples:
          | page          | jira_id      |
          | Assinatura    | QANOV-453423 |
          | Explore       | QANOV-453424 |
          | Vivo Valoriza | QANOV-453425 |
          | Financas      | QANOV-511463 |
          | Start         | QANOV-453427 |

  @jira.QANOV-491887 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A user has not verified the contacts methods: An alert is displayed in the Profile page
    Given user has not verified the personal data
     Then the "verify_alert" alert is displayed
      And the "verify_alert.icon" icon is displayed
      And the "verify_alert.title" textfield is displayed
      And the "verify_alert.message" textfield is displayed
      And the "verify_alert.link" link is displayed

  @jira.QANOV-491888 @android @e2e @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: An admin user clicks on the alert to verify contact methods: OB webview is displayed
    Given user has not verified the personal data
      And user has a "admin" role
      And clicks on the "alert.link" link
     Then the browser webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Profile" page is displayed

  @jira.QANOV-621101 @android @e2e @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user has  verified the contacts methods: An alert is not displayed in the Profile page
    Given user has verified the personal data
     Then the "verify_alert" alert is not displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  Scenario Outline: User who is in the <main_tab> tab can access to the Profile tab
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_tab_bar.profile_tab" tab
     Then the "Profile" page is displayed
      And the "Mi Perfil" header is displayed

    @ber @smoke
    Examples:
          | main_tab  | jira_id      |
          | Dashboard | QANOV-556372 |
          | Start     | QANOV-556373 |

    @regression
    Examples:
          | main_tab  | jira_id      |
          | Invoices  | QANOV-556374 |
          | Gestiones | QANOV-556375 |
