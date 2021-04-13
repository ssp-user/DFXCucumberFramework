package com.automation.pages.communicationdashboard;

import java.util.Random;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.automation.pages.advisor_checkin.ACI_PageHelpPDF;
import com.automation.pages.appointment_manager.AM_DashboardPage;
import com.automation.pages.common.WebPage;

public class CommunicationDashboard extends WebPage {
	
	public void click(String name) {
		switch (name.toUpperCase()) {
		case "INTERNAL":
			pWait.until(conditionVisible(findElement("$.DFX_COMMUNICATION_DASHBOARD.btn_internalChat"))).click();
			pWait.until(ExpectedConditions.visibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_internalScrollContainer")));			
			break;
		case "EDIT":
			pWait.until(conditionVisible(findElement("$.DFX_COMMUNICATION_DASHBOARD.btn_edit"))).click();
			pWait.until(ExpectedConditions.visibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.lst_internalMessage")));
			pWait.until(ExpectedConditions.visibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.lst_messageCustomer")));				
			break;		
		case "SEND INTERNAL MESSAGE":
			pWait.until(conditionVisible(findElement("$.DFX_COMMUNICATION_DASHBOARD.lst_internalMessage"))).click();
			pWait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txtArea_internalScrollContainer")));
			break;	
		case "FORWARD ARROW":
			pWait.until(conditionVisible(findElement("$.DFX_COMMUNICATION_DASHBOARD.btn_arrowforward"))).click();
			pWait.until(ExpectedConditions.visibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_input")));
			break;		
		case "CLOSE":
			pWait.until(conditionVisible(findElement("$.DFX_COMMUNICATION_DASHBOARD.btn_close"))).click();
			pWait.until(ExpectedConditions.invisibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_input")));				
			break;		
		case "CUSTOMER":
			pWait.until(conditionVisible(findElement("$.DFX_COMMUNICATION_DASHBOARD.btn_customer"))).click();
			pWait.until(ExpectedConditions.visibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_customerScrollContainer")));				
			break;	
		case "MESSAGE CUSTOMER":
			pWait.until(conditionVisible(findElement("$.DFX_COMMUNICATION_DASHBOARD.lst_messageCustomer"))).click();
			pWait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_customerUserName")));
			break;	
		case "RO":
			pWait.until(conditionVisible(findElement("$.DFX_COMMUNICATION_DASHBOARD.btn_ro"))).click();
			pWait.until(ExpectedConditions.visibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_roScrollContainer")));			
			break;			
		default:
			return;
		}
	}
	
	public void randomSelectionOfAdvisor() {
		driver.findElement(By.xpath("(//label[@class='ml-5 pt-2 user-name'])["+(int)((Math.random()*(250) + 1))+"]")).click();
		pWait.until(ExpectedConditions.visibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.btn_arrowforward")));			
	}
	

	public void sendAndValidateInternalMessages(int messagesCount) {
		for (int chatMessageCount = 0; chatMessageCount < messagesCount; chatMessageCount++) {
			String requireChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		    StringBuilder actualString = new StringBuilder();
		    Random rnd = new Random();
		    while (actualString.length() < 5) { 
		    	int index = (int) (rnd.nextFloat() * requireChar.length());
		        actualString.append(requireChar.charAt(index));
			}
		    String randomText = actualString.toString();
			System.out.println("<====== Random text to be entered is ======> "+randomText);
			pWait.until(ExpectedConditions.visibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_input")));
			clearAndInput(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_input"), randomText);
			sleep(2000);
			driver.findElement(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_input")).sendKeys(Keys.ENTER);
			sleep(3000);	
			pWait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='message-body me']/p[text()='"+randomText+"']")));
		}		
	}	
		
	public void searchCustomer(String searchParameter) {
        clearAndSend(findElement("$.DFX_COMMUNICATION_DASHBOARD.txt_customerUserName"), searchParameter);   
		pWait.until(ExpectedConditions.visibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.lbl_firstCellCustomer")));        
		pWait.until(conditionVisible(findElement("$.DFX_COMMUNICATION_DASHBOARD.lbl_firstCellCustomer"))).click();	
	}

	public void sendAndValidateCustomerMessages(int messagesCount) {
		String smsPrefix = "Dear ";
		String smsSuffix = ", hope you are doing good. This is sample message from functional automation script. Please ignore. Thanks Dealer-FX";
		String smsText;		
		for (int chatMessageCount = 0; chatMessageCount < messagesCount; chatMessageCount++) {
			String reqChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		    StringBuilder actualString = new StringBuilder();
		     Random rnd = new Random();
		     while (actualString.length() < 5) { 
		     	int index = (int) (rnd.nextFloat() * reqChar.length());
		     	actualString.append(reqChar.charAt(index));
			}
		    String smsCustomerName = actualString.toString();
			System.out.println("<====== Name of customer for SMS is  ======> "+smsCustomerName);
			smsText = smsPrefix.concat(smsCustomerName).concat(smsSuffix);
			System.out.println("<====== SMS to be sent to customer is ======> "+smsText);		
			pWait.until(ExpectedConditions.visibilityOfElementLocated(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_input")));
			clearAndInput(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_input"), smsText);
			sleep(2000);
			driver.findElement(findLocator("$.DFX_COMMUNICATION_DASHBOARD.txt_input")).sendKeys(Keys.ENTER);
			sleep(3000);	
			pWait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='message-body me']/p[text()='"+smsText+"']")));
		}		
	}
	
	public void searchRO() {
        clearAndSend(findElement("$.DFX_COMMUNICATION_DASHBOARD.txt_search"), ACI_PageHelpPDF.getRO());   
        sleep(50000);//To proceed scenario after this step
	}	
	 
}


