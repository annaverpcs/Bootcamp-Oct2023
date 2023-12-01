#Mikita Yakavenka
  #Medical center
  # Jira id oc-915
  Feature: Login MC

#E2E testing  (Mikita Predefined steps2)
  Scenario: Login/create an appointment/ verify present/ delete/ logout
  Given Nikita launch "MedicalCenterV"
  Then Nikita should see page title "Medical Center"
  Then Nikita click "Login"
  Then Nikita wait 5 sec
  Then Nikita type "patient1@gmail.com" in field with xpath "EmailField"
  Then Nikita type "abc123" in password field with xpath "YourPasswordField"
  And Nikita click to sign in "SignInButton"
  And Nikita wait 2 sec
  #Create an appointment
  And Nikita click to create appointment "MakeAnAppointmentButton"
  And Nikita wait 2 sec
  And Nikita type "Headache" in info field with xpath "InfoPurposeOfAppointmentField"
  And Nikita select specialist "SpecialistOption"
  And Nikita type "13/05/2024" in date field with xpath "DateField"
  And Nikita wait 2 sec
  And Nikita select time "TimeOption"
  Then Nikita click save "SaveButton"
  Then Nikita wait 2 sec
  Then Nikita assert appointment with xpath "CreatedAppointmentElement" precent
  Then Nikita click delete "CancelButton"
  Then Nikita wait 1 sec
  Then Nikita click cancel "CancelAppointmentButton"
  Then Nikita wait 1 sec
  Then Nikita click logout "LogoutnButton"
  And  Nikita wait 2 sec
  And Nikita should see page title "MedicalCenter"
  