package com.automation.pages.mci;

import com.automation.pages.appointment_manager.AM_ServicesPage;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import com.automation.pages.common.WebPage;

public class MCIHomePage extends WebPage {
	
	public static String defaultTotal, newTotal = null;  
	
	public void clickButton(String name) {
		switch (name.toUpperCase()) {
		case "NEXT":
			pWait.until(conditionVisible(findElement("$.DFX_MCI.home_btn_next"))).click();
			sleep(5000);			
//			dWait.until(ExpectedConditions.invisibilityOfElementLocated(findLocator("$.DFX_MCI.home_btn_next")));			
			break;
		case "CONFIRM CHECK-IN":
			pWait.until(conditionVisible(findElement("$.DFX_MCI.home_btn_confirmCheckIn"))).click();
			break;		
		case "COMPLETE CHECK-IN":
			pWait.until(conditionVisible(findElement("$.DFX_MCI.home_btn_completeCheckIn"))).click();
			sleep(5000);
			break;			
		default:
			return;
		}
	}
	
	public void markSignature() {
		clickElementWithException(findElement("$.DFX_MCI.home_txt_signature"));
	}
	
	public void validateFactoryServices() {
		String selectedServicesOnMCI = getElementTextWithException(findLocator("$.DFX_MCI.home_lbl_factoryRequired")).trim();
		System.out.println("Selected service on MCI is "+selectedServicesOnMCI);
        Assert.assertEquals(selectedServicesOnMCI, AM_ServicesPage.selectedUnScheduledService);		
	}	

	public void captureDefaultTotal() {
		defaultTotal = fetchMonetoryValue(getElementTextWithException(findLocator("$.DFX_MCI.home_lbl_total")).trim());		
		System.out.println("Default total is "+ defaultTotal);
	}
	
	public void captureNewTotal() {
		newTotal = fetchMonetoryValue(getElementTextWithException(findLocator("$.DFX_MCI.home_lbl_total")).trim());		
		System.out.println("New total is "+ newTotal);		
    	Assert.assertTrue(Float.parseFloat(newTotal) > Float.parseFloat(defaultTotal), "Validate new total is greater than default total");		
	}	

	public void clickRecommendedService() {
		pWait.until(conditionVisible(findElement("$.DFX_MCI.home_btn_AddMoreServices"))).click();	
		sleep(5000);		
		pWait.until(conditionVisible(findElement("$.DFX_MCI.home_chk_recommended"))).click();
		sleep(5000);
	}
		
	public String fetchMonetoryValue(String amount) {
		int startIndex = amount.indexOf("$");
		int endIndex = amount.indexOf(".");
		String str = amount.substring(startIndex + 1, endIndex+3);
		return str.trim();
	}
	
	 
}


