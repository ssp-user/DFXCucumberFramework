package com.appointmentmanger.testrunner2;

import org.junit.runner.RunWith;

import org.junit.runner.RunWith;
import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import cucumber.api.testng.AbstractTestNGCucumberTests;
@RunWith(Cucumber.class)
@CucumberOptions(
		plugin = {"pretty","html:target1/cucumber-html-report","json:target1/cucumber.json"},
		features = "src/test/resources/com/features/amfeatures/",
		glue = "com.autotest.teststeps",
		tags = "@Default"
		)
public class TAMrunnerTest extends AbstractTestNGCucumberTests{
	
}