package definitions;

import com.sun.jdi.VoidValue;

public class MikitaXpathLibrary {

    public static String MedicalCenterV1 ="https://medicenter-qa1.vercel.app/";

    public static String MedicalCenterV2 ="https://medicenter-qa2.vercel.app/";
    public static String LoginButton ="//button[contains(text(),'Login')]";
    public static String CreateAccountButton = "//button[contains(text(),'Create account')]";
    public static String ContactLink = "//a[contains(text(),'Contact')]";
    public static String MedicalCenterText = "//h1[text()='Medical Center']";
    public static String LoginCreateText = "//h2[text()='Login or create a new account to make an appointment']";
    public static String BackHomeButton = "//a[contains(text(),'Back to home')]";
    public static String EmailField = "//input[@id='email']";
    public static String YourPasswordField = "//input[@id='password']";
    public static String SignInButton = "//button[@type='submit']";
    public static String ForgotYourPasswordLink = "//*[contains(text(),'Forgot your password')]";
    public static String DontHaveAnAccountLink = "//*[contains(text(),'have an account? ')]";
    public static String SignUpButton = "//button[@type='submit']";
    public static String AlreadyHaveAnAccountLink = "//*[contains(text(),'Already have an account?')]";
    public static String CheckYourEmailForTheConfirmationLinkText = "//*[contains(text(),'Check your email')]";
    public static String ContactUsTitle = "//*[contains(text(),'Contact us')]";
    public static String OpeningHoursText = "//*[contains(text(),'Opening hours')]";
    public static String ReceptionText = "//*[contains(text(),'Reception')]";
    public static String DiagnosticAndSurgicalOffice = "//*[contains(text(),'Diagnostic and Surgical Office')]";
    public static String MakeAnAppointmentButton = "//button[@type='button']";
    public static String MyAppointments = "//*[contains(text(),'My appointments')]";
    public static String PatientName = "//h1[@class='font-medium text-xl']";
    public static String CancelButton = "//article[div//h3[contains(text(),'Monday 13 May 2024, 11:00')]]/div[@type='button']";
    public static String CancelAppointmentButton= "//button[contains(text(),'Cancel appointment')]";
    public static String InfoPurposeOfAppointmentField = "//textarea[@name='note']";
    public static String SpecialistOption = "//option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']";
    public static String DateField = "//input[@type='date']";
    public static String TimeOption = "//button[@value='2024-05-13T09:00:00.000Z']";
    public static String SaveButton = "//button[@type='submit']";
    public static String LogoutButton = "//button[contains(text(),'Logout')]";
    public static String CreatedAppointmentElement= "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:00')]]//p[contains(text(),'Headache')]]";
    public static String AdminName = "//h1[@class='font-medium text-xl']";
    public static String SpecialistButton = "//button[@id='radix-:r2nh:-trigger-employees']";
    public static String AppointmentButton = "//button[@id='radix-:r2nh:-trigger-appointments']";
    public static String AddSpecialistButton = "//button[contains(text(),'Add specialist')]";
    public static String RemoveSpecialistButton = "//button[contains(text(),'Remove specialist')]";
    public static String SpecialistFirstNameField = "//input[@name='first_name']";
    public static String SpecialistLastNameField = "//input[@name='last_name']";
    public static String SpecialistTypeOption = "//option[@value='doctor']";
    public static String SpecialistWorkingDayOption = "//button[@id='tuesday']";
    public static String SpecialistWorkingHoursOption = "//input[@name='working_hours.tuesday.from']";
    public static String ViewDayOption= "//button[@title='day view']";
    public static String ViewWeekOption = "//button[@title='week view']";
    public static String ViewMonthOption = "//button[@title='month view']";
    public static String SwitchBackDateOption = "//button[@title='Previous week']";
    public static String SwitchForwardDateOption = "button[@title='Next week']";
    public static String PatientFirstAndLastNameField = "//input[@name='user_name']";
    public static String PurposeOfAppointmentField= "//textarea[@name='note']";
    public static String DateCreatedAppointmentText= "//*[contains(text(),'2023')]";
    public static String SpecialistNameCreatedAppointmentText= "//*[contains(text(),'Toni Mancuso')]";
    public static String EditSpecialistButton = "//tr[td[contains(text(),'Toni Mancuso')]]//span[contains(text(),'edit')]";




}
