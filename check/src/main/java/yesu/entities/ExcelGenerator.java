package yesu.entities;

import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import yesu.models.LoanApplicant;

public class ExcelGenerator {

	public static Workbook generateExcel(List<LoanApplicant> loanApplicant) throws IOException {
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Loan Applicants");

		// Create header row
		Row headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("Loan Applicant ID");
		headerRow.createCell(1).setCellValue("Customer ID");
		headerRow.createCell(2).setCellValue("applied date");
		headerRow.createCell(3).setCellValue("loan type id");
		headerRow.createCell(4).setCellValue("loan amount");
		headerRow.createCell(5).setCellValue("emi months");
		headerRow.createCell(6).setCellValue("cibil score");
		headerRow.createCell(7).setCellValue("status");
		headerRow.createCell(8).setCellValue("remarks");

		int rowNum = 1;
		for (LoanApplicant applicant : loanApplicant) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(applicant.getId());
			row.createCell(1).setCellValue(applicant.getCustomerId());
			row.createCell(2).setCellValue(applicant.getApplicationDate());
			row.createCell(3).setCellValue(applicant.getLoanTypeId());
			row.createCell(4).setCellValue(applicant.getAmount());
			row.createCell(5).setCellValue(applicant.getNoOfMonths());
			row.createCell(6).setCellValue(applicant.getCibilScore());
			row.createCell(7).setCellValue(applicant.getStatus());
			row.createCell(8).setCellValue(applicant.getConclusionRemarks());

		}

		return workbook;
	}
}