# -*- coding: utf-8 -*-
@jira.QANOV-126818
Feature: Invoice Actions


  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.VIVO-1896 @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-163791 @live
  @mobile @next @qa @smoke @vivobr @old_app
  Scenario Outline: A <account_type> user can access to the "Enviar por email" screen associated to a bill
    internal_checkpoint="If the email is available in the CRM registration, it should be preloaded."
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the card with "Enviar por e-mail" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the "Send Bill By Email" page is displayed
      And the "Enviar por e-mail" header is displayed
      And the "title" textfield with "Pra qual e-mail quer enviar sua fatura?" text is displayed
      And the "email_inputtext" inputtext is displayed
      And the "email_placeholder" placeholder with "E-mail" text is displayed
      And the "send_button" button with "Enviar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | ber | jira_id      |
          | 11.12 | beatrix      |            | QANOV-21949      | ber | QANOV-339917 |
          | 11.12 | multivivo    |            | QANOV-21949      |     | QANOV-339918 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      |     | QANOV-339919 |

  @jira.<jira_id> @android @ios @jira.cv.13.2 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-76707
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> user can access to the "Enviar por email" screen associated to a bill with an email saved in the system
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has an available email registered
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on a month with invoices in the "invoice-chart-header" invoices chart
      And clicks on the card with "Enviar por e-mail" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the "Send Bill By Email" page is displayed
      And the "Enviar por e-mail" header is displayed
      And the "title" textfield with "Pra qual e-mail quer enviar sua fatura?" text is displayed
      And the "email" inputtext with the "E-mail" placeholder is displayed
      And the "email" inputtext contains the available email registered
      And the "send" button with "Enviar" text is displayed

    Examples:
          | account_type | depends_on | jira_id     |
          | beatrix      |            | QANOV-78118 |
          | convergente  | QANOV-3949 | QANOV-78119 |
          | multivivo    |            | QANOV-78120 |

  @jira.<jira_id> @android @ios @jira.cv.13.2 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-76707
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> user can access to the "Enviar por email" screen associated to a bill without an email saved in the system
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user does not have an available email registered
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on a month with invoices in the "invoice-chart-header" invoices chart
      And clicks on the card with "Enviar por e-mail" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the "Send Bill By Email" page is displayed
      And the "Enviar por e-mail" header is displayed
      And the "title" textfield with "Pra qual e-mail quer enviar sua conta?" text is displayed
      And the "email" inputtext with the "E-mail" placeholder is displayed
      And the "email" inputtext is empty
      And the "send" button with "Enviar" text is displayed

    Examples:
          | account_type | depends_on | jira_id     |
          | beatrix      |            | QANOV-78121 |
          | convergente  | QANOV-3949 | QANOV-78122 |
          | multivivo    |            | QANOV-78123 |

  @jira.<jira_id> @android @ios @jira.cv.13.2 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-76707
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> user can access to the "Enviar por email" screen associated to a bill with a API problem with the email
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has an API problem with the email
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on a month with invoices in the "invoice-chart-header" invoices chart
      And clicks on the card with "Enviar por e-mail" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the "Send Bill By Email" page is displayed
      And the "Enviar por e-mail" header is displayed
      And the "title" textfield with "Pra qual e-mail quer enviar sua conta?" text is displayed
      And the "email" inputtext with the "E-mail" placeholder is displayed
      And the "email" inputtext is empty
      And the "send" button with "Enviar" text is displayed

    Examples:
          | account_type | depends_on | jira_id     |
          | beatrix      |            | QANOV-78124 |
          | convergente  | QANOV-3949 | QANOV-78125 |
          | multivivo    |            | QANOV-78126 |

  @jira.<jira_id> @android @ios @jira.cv.13.2 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-76707
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> user can see the email registered when user has sent the information with another email
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has an available email registered
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on a month with invoices in the "invoice-chart-header" invoices chart
      And clicks on the card with "Enviar por e-mail" text on the "title" of the "bills_summary.buttons_carousel" carousel
      And fills the "email" inputtext with the "abc@gmail.com" text
      And clicks on the "send" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
      And clicks on the "bills.more_bills_link" link
      And clicks on the card with "Enviar por e-mail" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the "Send Bill By Email" page is displayed
      And the "Enviar por e-mail" header is displayed
      And the "email" inputtext with the "E-mail" placeholder is displayed
      And the "email" inputtext contains the available email registered

    Examples:
          | account_type | depends_on | jira_id     |
          | beatrix      |            | QANOV-78127 |
          | convergente  | QANOV-3949 | QANOV-78128 |
          | multivivo    |            | QANOV-78129 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-163885 @manual @mobile @regression @vivobr
  Scenario Outline: User cannot send the bill by email using an email with wrong format
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Send Bill By Email" page
     When fills the "email" inputtext with the "abc@" text
     Then the "E-mail inválido" text is displayed under the "email" field
      And the "send_button" button is disabled

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-4002 |
          | 12.0  | convergente  |            | QANOV-21791      | QANOV-4003 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-4004 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-163885 @manual @mobile @regression @vivobr
  Scenario Outline: User cannot send the bill by email without filling the "email" field
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Send Bill By Email" page
     When clears the "email" inputtext
     Then the "send_button" button is disabled

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-4005 |
          | 12.0  | convergente  |            | QANOV-21791      | QANOV-4006 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-4007 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-163861 @live @mobile @next @smoke @vivobr
  Scenario Outline: User can send the bill by email successfully
    internal_checkpoint="It's not NOVUM's responsibility to send the email. It's derived to 4th platform and then to
    the OB. For 'contested' bills, it's OB's responsibility to send the updated bill instead of the original bill."
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the card with "Enviar por e-mail" text on the "title" of the "bills_summary.buttons_carousel" carousel
      And the "Send Bill By Email" page is displayed
      And fills the "email_inputtext" inputtext with the "systemtestnovum@gmail.com" text
      And clicks on the "send_button" button
     Then the "Feedback" page is displayed
      And the "title" textfield with "A fatura foi pra seu e-mail ;)" text is displayed
      And the "message" textfield with "Dá uma olhada na sua caixa de entrada (ou também no seu Lixo eletrônico) pra ver se você recebeu direitinho" text is displayed
      And the "main_button" button with "Ok, voltar pro início" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | ber | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      |     | QANOV-4008 |
          | 12.0  | convergente  |            | QANOV-21791      |     | QANOV-4009 |
          | 11.12 | multivivo    |            | QANOV-21949      | ber | QANOV-4010 |

  @jira.<jira_id> @android @automation.hard @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User can send the bill by email unsuccessfully
    internal_checkpoint="It's not NOVUM's responsibility to send the email. It's derived to 4th platform and then to
    the OB. For 'contested' bills, it's OB's responsibility to send the updated bill instead of the original bill."
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Send Bill By Email" page
     When fills the "email" inputtext with the "valid_email@telefonica.com" text
      And clicks on the "send_button" button
      And an error happens during the operation
     Then the "Feedback" page is displayed
      And the "title" textfield with "A gente não conseguiu enviar a conta pro seu e-mail" text is displayed
      And the "message" textfield with "Algo deu errado na hora de enviar a mensagem. Você pode tentar de novo e também mandar pra outro e-mail" text is displayed
      And the "main_button" button with "Ok, voltar pro início" text is displayed
      And the bill arrives to the email inserted

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-4011 |
          | 12.0  | convergente  |            | QANOV-21791      | QANOV-4012 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-4013 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-163888 @automatic @mobile @regression @vivobr @live @next
  Scenario Outline: User who sent a bill by email successfully can go back to the "Account" screen using the "Ok, voltar pro início" button
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the card with "Enviar por e-mail" text on the "title" of the "bills_summary.buttons_carousel" carousel
      And the "Send Bill By Email" page is displayed
     When fills the "email_inputtext" inputtext with the "systemtestnovum@gmail.com" text
      And clicks on the "send_button" button
      And the "Feedback" page is displayed
      And clicks on the "main_button" button
     Then the "Account" page is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-4008 | QANOV-21949      | QANOV-4014 |
          | 12.0  | convergente  | QANOV-4009 | QANOV-21791      | QANOV-4015 |
          | 11.12 | multivivo    | QANOV-4010 | QANOV-21949      | QANOV-4016 |

  @jira.<jira_id> @android @automation.hard @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User who sent a bill by email unsuccessfully can go back to the "Account" screen using the "Ok, voltar pro início" button
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Send Bill By Email" page
     When fills the "email" inputtext with the "valid_email@telefonica.com" text
      And clicks on the "send_button" button
      And an error happens during the operation
      And the "Feedback" page is displayed
      And clicks on the "main_button" button
     Then the "Account" page is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-4011 | QANOV-21949      | QANOV-4017 |
          | 12.0  | convergente  | QANOV-4012 | QANOV-21791      | QANOV-4018 |
          | 11.12 | multivivo    | QANOV-4013 | QANOV-21949      | QANOV-4019 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr
  Scenario Outline: <account_type> Dependent user can access to the "Enviar por email" screen associated to a bill
    Given user has a "<account_type>" account type
      And user has "several" mobile lines
      And user has a "dependent" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on a month with invoices in the "invoice-chart-header" invoices chart
      And clicks on the card with "Enviar por e-mail" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the "Send Bill By Email" page is displayed
      And the "Enviar por e-mail" header is displayed

    Examples:
          | account_type | depends_on | cv    | parent_test_plan | jira_id     |
          | multivivo    |            | 11.12 | QANOV-21949      | QANOV-4020  |
          | convergente  | QANOV-3949 | 12.0  | QANOV-21791      | QANOV-44933 |

  @jira.<jira_id> @<ber> @android @automatic @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-163890
  @live @mobile @next @qa @sanity @vivobr
  Scenario Outline: A <account_type> user can download an original bill on android devices
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the card with "2ª via de fatura" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | ber | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | ber | QANOV-4023 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | ber | QANOV-4024 |
          | 11.12 | multivivo    |            | QANOV-21949      |     | QANOV-4025 |

  @jira.<jira_id> @<ber> @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-163891
  @live @mobile @next @qa @sanity @vivobr
  Scenario Outline: A <account_type> user can open an original bill on iOS devices
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the card with "2ª via de fatura" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | ber | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      |     | QANOV-4026 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | ber | QANOV-4027 |
          | 11.12 | multivivo    |            | QANOV-21949      | ber | QANOV-4028 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr
  Scenario Outline: User can zoom in and out on an original bill
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
      And the "original" bill file is displayed
     When zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | cv    | account_type | direction | size    | depends_on            | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | in        | bigger  | QANOV-4023:QANOV-4026 | QANOV-21949      | QANOV-4029 |
          | 11.12 | beatrix      | out       | smaller | QANOV-4023:QANOV-4026 | QANOV-21949      | QANOV-4030 |
          | 12.0  | convergente  | in        | bigger  | QANOV-4024:QANOV-4027 | QANOV-21791      | QANOV-4031 |
          | 12.0  | convergente  | out       | smaller | QANOV-4024:QANOV-4027 | QANOV-21791      | QANOV-4032 |
          | 11.12 | multivivo    | in        | bigger  | QANOV-4025:QANOV-4028 | QANOV-21949      | QANOV-4033 |
          | 11.12 | multivivo    | out       | smaller | QANOV-4025:QANOV-4028 | QANOV-21949      | QANOV-4034 |

  @jira.<jira_id> @<execution_mode> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @live @mobile @next @smoke @vivobr @old_app
  Scenario Outline: User can share an original bill on iOS devices
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the card with "2ª via de fatura" text on the "title" of the "bills_summary.buttons_carousel" carousel
      And the browser webview is displayed
      And the PDF file is opened
      And clicks on the "share" button
     Then the native sharing options are displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | execution_mode | jira_id    |
          | 11.12 | beatrix      | QANOV-4026 | QANOV-21949      | automatic      | QANOV-4035 |
          | 12.0  | convergente  | QANOV-4027 | QANOV-21791      | manual         | QANOV-4036 |
          | 11.12 | multivivo    | QANOV-4028 | QANOV-21949      | automatic      | QANOV-4037 |

  @jira.<jira_id> @<automation> @<impeded> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> Dependent user can download an original bill on android devices
    Given user has a "<account_type>" account type
      And user has "several" mobile lines
      And user has a "dependent" role
      And user has invoices
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on a month with invoices in the "invoice-chart-header" invoices chart
      And clicks on the card with "2ª via de fatura" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the "bill" file with the "Documento_XXXXXXXXXXXXX.pdf" format is downloaded as a PDF
      And the "Google Drive" app is displayed
      And the PDF file is opened after it is downloaded

    Examples:
          | account_type | depends_on | cv    | parent_test_plan | impeded      | automation              | jira_id     |
          | multivivo    |            | 11.12 | QANOV-21949      |              |                         | QANOV-4038  |
          | convergente  | QANOV-3949 | 12.0  | QANOV-21791      | impeded_mock | automation.pending_mock | QANOV-44934 |

  @jira.<jira_id> @<automation> @<impeded> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> Dependent user can open an original bill on iOS devices
    Given user has a "<account_type>" account type
      And user has "several" mobile lines
      And user has a "dependent" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on a month with invoices in the "invoice-chart-header" invoices chart
      And clicks on the card with "2ª via de fatura" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | account_type | depends_on | cv    | parent_test_plan | impeded      | automation              | jira_id     |
          | multivivo    |            | 11.12 | QANOV-21949      |              |                         | QANOV-4039  |
          | convergente  | QANOV-3949 | 12.0  | QANOV-21791      | impeded_mock | automation.pending_mock | QANOV-44935 |

  @jira.<jira_id> @<test_priority> @android @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-163892 @live @mobile @next @qa @vivobr
  Scenario Outline: A <account_type> user with a <bill_status> bill can access to the "Inform Payment" screen
    internal_checkpoint="A specific message will be shown depending on the bill's status."
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "any" plan in "no cancelled" status
      And user has a month with "<bill_status>" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the card with "Avisar que já está paga" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the internal webview with "Avisar que já está paga" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

    Examples:
          | cv    | account_type | bill_status | depends_on | parent_test_plan | test_priority | jira_id      |
          | 11.12 | beatrix      | delayed     |            | QANOV-21949      | smoke         | QANOV-339920 |
          | 11.12 | multivivo    | delayed     |            | QANOV-21949      | smoke         | QANOV-339921 |
          | 11.12 | beatrix      | pending     |            | QANOV-21949      | regression    | QANOV-22292  |
          | 11.12 | multivivo    | pending     |            | QANOV-21949      | regression    | QANOV-22294  |
          | 12.0  | convergente  | delayed     | QANOV-3949 | QANOV-21791      | smoke         | QANOV-339922 |
          | 12.0  | convergente  | pending     | QANOV-3949 | QANOV-21791      | regression    | QANOV-22293  |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> Dependent user can access to the "Inform Payment" screen
    Given user has a "<account_type>" account type
      And user has "several" mobile lines
      And user has a "any" plan in "no cancelled" status
      And user has a "dependent" role
      And user has a month with "<bill_status>" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the card with "Avisar que já está paga" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the internal webview with "Avisar que já está paga" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

    Examples:
          | account_type | bill_status | depends_on | cv    | parent_test_plan | impeded      | automation              | jira_id     |
          | multivivo    | delayed     |            | 11.12 | QANOV-21949      |              |                         | QANOV-4060  |
          | multivivo    | pending     |            | 11.12 | QANOV-21949      | impeded_mock | automation.pending_mock | QANOV-22311 |
          | convergente  | delayed     | QANOV-3949 | 12.0  | QANOV-21791      | impeded_mock | automation.pending_mock | QANOV-44936 |
          | convergente  | pending     | QANOV-3949 | 12.0  | QANOV-21791      | impeded_mock | automation.pending_mock | QANOV-44937 |

  @jira.<jira_id> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-163894 @manual @mobile @smoke @vivobr @old_app
  Scenario Outline: User can download an updated bill on android devices
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a month with "contested" invoice
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the card with "Boleto atualizado" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the "bill" file with the "Documento_XXXXXXXXXXXXX.pdf" format is downloaded as a PDF
      And the "Google Drive" app is displayed
      And the PDF file is opened after it is downloaded

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-4063 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-4064 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-4065 |

  @jira.<jira_id> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-163895 @manual @mobile @smoke @vivobr @old_app
  Scenario Outline: User can open an updated bill on iOS devices
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a month with "contested" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the card with "Boleto atualizado" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-4066 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-4067 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-4068 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr
  Scenario Outline: User can zoom in and out on an updated bill
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a month with "contested" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
      And the "updated" bill file is displayed
     When zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | cv    | account_type | direction | size    | depends_on            | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | in        | bigger  | QANOV-4063:QANOV-4066 | QANOV-21949      | QANOV-4069 |
          | 11.12 | beatrix      | out       | smaller | QANOV-4063:QANOV-4066 | QANOV-21949      | QANOV-4070 |
          | 12.0  | convergente  | in        | bigger  | QANOV-4064:QANOV-4067 | QANOV-21791      | QANOV-4071 |
          | 12.0  | convergente  | out       | smaller | QANOV-4064:QANOV-4067 | QANOV-21791      | QANOV-4072 |
          | 11.12 | multivivo    | in        | bigger  | QANOV-4065:QANOV-4068 | QANOV-21949      | QANOV-4073 |
          | 11.12 | multivivo    | out       | smaller | QANOV-4065:QANOV-4068 | QANOV-21949      | QANOV-4074 |

  @jira.<jira_id> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile @smoke @vivobr @old_app
  Scenario Outline: User can share an updated bill on iOS devices
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a month with "contested" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
      And the "updated" bill file is displayed
     When clicks on the "share" button
     Then the native sharing options are displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-4066 | QANOV-21949      | QANOV-4075 |
          | 12.0  | convergente  | QANOV-4067 | QANOV-21791      | QANOV-4076 |
          | 11.12 | multivivo    | QANOV-4068 | QANOV-21949      | QANOV-4077 |

  @jira.<jira_id> @<automation> @<impeded> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> Dependent user can download an updated bill on android devices
    Given user has a "<account_type>" account type
      And user has "several" mobile lines
      And user has a "dependent" role
      And user has a month with "contested" invoice
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the card with "Boleto atualizado" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the "bill" file with the "Documento_XXXXXXXXXXXXX.pdf" format is downloaded as a PDF
      And the "Google Drive" app is displayed
      And the PDF file is opened after it is downloaded

    Examples:
          | account_type | depends_on | cv    | parent_test_plan | impeded      | automation              | jira_id     |
          | multivivo    |            | 11.12 | QANOV-21949      |              |                         | QANOV-4078  |
          | convergente  | QANOV-3949 | 12.0  | QANOV-21791      | impeded_mock | automation.pending_mock | QANOV-44938 |

  @jira.<jira_id> @<automation> @<impeded> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> Dependent user can open an updated bill on iOS devices
    Given user has a "<account_type>" account type
      And user has "several" mobile lines
      And user has a "dependent" role
      And user has a month with "contested" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the card with "Boleto atualizado" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | account_type | depends_on | cv    | parent_test_plan | impeded      | automation              | jira_id     |
          | multivivo    |            | 11.12 | QANOV-21949      |              |                         | QANOV-4079  |
          | convergente  | QANOV-3949 | 12.0  | QANOV-21791      | impeded_mock | automation.pending_mock | QANOV-44939 |

  @jira.QANOV-21963 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user with an unpaid bill and with automatic debit enabled confirms that he wants to pay with credit card in "Bill Selection" page
    A 'unpaid' bill is a bill in delayed or pending status
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has several invoices in "unpaid" status
      And user has "automatic_debit" service in "activated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue" button
     Then the "Automatic Debit Enabled Warning" popup is displayed
      And the "popup.title" textfield with "Sua conta já está em débito automático" text is displayed
      And the "popup.text" textfield with "Se pagar 2 vezes a mesma conta, você recebe o valor como crédito no próximo mês" text is displayed
      And the "popup.cancel" button with "Fechar" text is displayed
      And the "popup.confirm" button with "Continuar" text is displayed

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @live @mobile @next @smoke @vivobr @jira.link.detects.VIVO-3545
  Scenario Outline: A <account_type> user with a delayed bill can access to the "Negociar Faturas" screen
    Given user has a "<account_type>" account type
      And user has a "any" plan in "no cancelled" status
      And user does not have a "siebel" plan
      And user has a month with "delayed" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the card with "Negociar faturas" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the internal webview is displayed
      And the "Negociar faturas" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

    Examples:
          | account_type | depends_on | cv    | parent_test_plan | ber | jira_id      |
          | beatrix      | QANOV-3957 | 11.15 |                  | ber | QANOV-339923 |
          | multivivo    | QANOV-3959 | 11.15 |                  | ber | QANOV-339924 |
          | convergente  | QANOV-3949 | 12.0  | QANOV-21791      |     | QANOV-44942  |

  @jira.QANOV-66681 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3959 @jira.link.parent_test_plan.QANOV-66163
  @manual @mobile @smoke @vivobr @old_app
  Scenario: Siebel user with a delayed bill can access to the "Negociar Faturas" screen
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "delayed" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the card with "Negociar fatura" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the internal webview is displayed
      And the "Vivo Em Dia" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

  @jira.QANOV-22327 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-3949 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: Convergente Admin user can access to the "Negociar Faturas" screen
    Given user has a "convergente" account type
      And user has a "admin" role
      And user has a month with "delayed" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the card with "Negociar fatura" text on the "title" of the "bills_summary.buttons_carousel" carousel
     Then the internal webview is displayed
      And the "Vivo em Dia" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-66682 @android @automatic @ber @impeded_env @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-66163
  @mobile @smoke @vivobr @old_app
  Scenario: Siebel user can access to the "Ver acordo" screen when has a negociada bill
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "negociada" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.acordo_button" button
     Then the internal webview is displayed
      And the "Detalhes do Acordo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-66683 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Siebel user can access to the "Ver acordo" screen in other bill different to Negociada bill
    internal_checkpoint="acordo_entrypoint appear in all kind of bills"
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "delayed" invoice
      And user has a "negociada" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Ver acordos" entrypoint configured in CMS for the "vivo-acordos" list
      And user is in the "Bills" page
     When clicks on the month with "delayed" bill in the "bills_graph" graph
      And clicks on the "bills_negociada.acordo_entrypoint" button
     Then the internal webview is displayed
      And the "Detalhes do Acordo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-66684 @android @ios @jira.cv.12.7 @jira.link.detects.VIVO-2503 @jira.link.detects.VIVO-2506
  @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can access to the "Ver acordo" screen when does not have a negociada bill
    internal_checkpoint="acordo_entrypoint appear in all kind of bills"
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "delayed" invoice
      And user does not have a "negociada" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Ver acordos" entrypoint configured in CMS for the "vivo-acordos" list
      And user is in the "Bills" page
     When clicks on the month with "delayed" bill in the "bills_graph" graph
      And clicks on the "bills_negociada.acordo_entrypoint" button
     Then the internal webview is displayed
      And the "Detalhes do Acordo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-21953 @android @automatic @ber @ios @jira.cv.12.8 @jira.link.detects.ACCOUNT-13731
  @jira.link.detects.ACCOUNT-13827 @jira.link.detects.LOC-622 @jira.link.detects.LOC-630 @old_app
  @jira.link.parent_test_plan.QANOV-319348 @jira.link.parent_test_plan.QANOV-68826 @live @mobile @next @smoke @vivobr
  Scenario: A no legacy user with several unpaid bills clicks on pay with credit card button in "Faturas" page. Bill Selection screen is displayed
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has several invoices in "unpaid" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
     Then the "Bill Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Agora é só escolher as faturas que você quer pagar" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.description" textfield with "Só é possível fazer o pagamento de mais de uma fatura por meio de cartao de crédito" text is displayed
      And the "unpaid_bills_list" list is displayed
      And each element in the "unpaid_bills_list" list has the "label" textfield with the "(Fatura pronta para pagar|Fatura vencida)" format
      And each element in the "unpaid_bills_list" list has the "bill_date" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format
      And each element in the "unpaid_bills_list" list has the "due_date" textfield with the "(Vence|Venceu) em \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format
      And each element in the "unpaid_bills_list" list has the "bill_amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format
      And each element in the "unpaid_bills_list" list has the "bill_details_link" textfield with "Ver detalhes de fatura" text
      And each element in the "unpaid_bills_list" list has the "selected" field
      And the "terms_footer" textfield with "Ao continuar você aceita nossos Termos e condições" text is displayed
      And the "terms_link" link with "Termos e condições" text is displayed
      And the "continue_button" button with "Pagar agora" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-242620 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-68826 @live @manual @mobile @smoke
  @vivobr @old_app
  Scenario: A no legacy user with one unpaid bill clicks on pay with credit card button in "Faturas" page. Choose Payment Method screen is displayed
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has a month with "unpaid" invoices
      And user has the matching subscription selected in the accountge
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Escolha a forma de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.close" icon is displayed
      And the "informative_alert.title" textfield with "Dicas de segurança" text is displayed
      And the "informative_alert.description" textfield with "O App Vivo é o canal mais seguro pra você confirmar todas as informações da sua fatura" text is displayed
      And the "informative_alert.link" textfield with "Ver mais" text is displayed
      And the "payment_methods_list" list has "3" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Cartão de crédito" text
      And the "2" index in the "payment_methods_list" list has the "payment_description" field with "Código de barras" text
      And the "continue_button" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-21957 @android @ios @jira.cv.12.8 @jira.link.detects.ACCOUNT-13729 @jira.link.parent_test_plan.QANOV-68826
  @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with unpaid bills clicks on pay with credit card button in "Faturas" page without data connectivity
    A 'unpaid' bill is a bill in delayed or pending status
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has a month with "unpaid" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
      And user turns on the Airplane mode
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.pay_bill_button" button
     Then the "No Connectivity" internal webview is displayed
      And the "no_connectivity_title" textfield with "Tem algo errado com sua Internet" text is displayed
      And the "no_connectivity_text" textfield with "Veja se sua conexão está ok e tente novamente" text is displayed

  @jira.QANOV-21991 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user with a pending bill clicks on pay with credit card button in "Faturas" page. Bills already paid
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has a month with "pending" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And bill status changes to "paid" status
     Then the "No Pending Payments" internal webview is displayed
      And the "Pagamentos Pendentes" header is displayed
      And the "no_pending_payments_title" textfield with "Você não tem contas pra pagar" text is displayed
      And the "no_pending_payments_text" textfield with "Suas contas pendentes vão aparecer aqui" text is displayed
      And the "return" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-21993 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-21991 @jira.link.parent_test_plan.QANOV-68826
  @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user that reached the "No Pending Payments" page from the Bills page clicks back
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has a month with "pending" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And bill status changes to "paid" status
      And the "No Pending Payments" internal webview is displayed
      And clicks on the "return" button
     Then the "Bills" page is displayed

  @jira.QANOV-77073 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-21995 @jira.link.parent_test_plan.QANOV-68826
  @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user that reached the "Feedback Bill Payment with Credit Card Error" page from the Account page clicks back
    A 'unpaid' bill is a bill in delayed or pending status
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And is blacklisted by the OB for credit card payment
      And user has a month with "unpaid" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Feedback Bill Payment with Credit Card Error" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-95653 @android @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-2983 @jira.link.detects.NOVUMCC-5593
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1803 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with recurrent payment enabled sees a popup when trying to pay by credit card
    other_affected_versions="2021-50"
    Invoice Payment Automatic' popup won't be shown for old invoices
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has several invoices in "unpaid" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue" button
     Then the "Invoice Payment Automatic" popup is displayed
      And the "title" textfield with "Pagamento automático com cartão de crédito ativado" text is displayed
      And the "message" textfield with "Pra fazer a exclusão, você precisa alterar o cartão usado no pagamento ou desativar o pagamento automático com cartão de crédito." text is displayed
      And the "popup.cancel" button with "Fechar" text is displayed
      And the "popup.accept" button with "Continuar" text is displayed

  @jira.QANOV-95654 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95653 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1803 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with recurrent payment enabled can close the Invoice Payment Automatic popup opened by credit card payment
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
      And user has several invoices in "unpaid" status
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue" button
      And the "Invoice Payment Automatic" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Bill Selection" page is displayed

  @jira.QANOV-95655 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95653 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1803 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with recurrent payment enabled and with the Invoice Payment Automatic popup can continue the payment by hand flow
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
      And user has several invoices in "unpaid" status
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue" button
      And the "Invoice Payment Automatic" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Invoice Payment Automatic" popup is not displayed
      And the "Payment Summary" page is displayed
