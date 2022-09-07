package product.model;

import java.sql.Date;
import java.util.Scanner;

public class ProductDTO {
	// dto = 레코드 1개 저장
	private int productCode;
	private String productName;
	private int productPrice;
	private String productContent;
	private String vendor;
	private Date regiDate;

	public void dataInput(String gubun) {
		Scanner sc = new Scanner(System.in);
		if (gubun.equals("view") || gubun.equals("sujung") || gubun.equals("sakje")) {
			System.out.print("상품 코드: ");
			String productCode_ = sc.nextLine();
			productCode = Integer.parseInt(productCode_);
		}

		if (gubun.equals("chuga") || gubun.equals("sujung")) {
			System.out.print("상품이름 : ");
			this.productName = sc.nextLine();

			System.out.print("상품가격 : ");
			String productPrice_ = sc.nextLine();
			this.productPrice = Integer.parseInt(productPrice_);

			System.out.print("상품설명 : ");
			this.productContent = sc.nextLine();

			System.out.print("제조사 : ");
			this.vendor = sc.nextLine();
		}

	}

	public void display(String gubun) {
		String msg = "";
		msg += productCode + "\t";
		msg += productName + "\t";
		msg += productPrice + "\t";
		// msg += productContent + "\t";

		if (gubun.equals("view")) {
			msg += productContent + "\t";
		}

		msg += vendor + "\t";
		msg += regiDate;
		System.out.printf("%s\n", msg);
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public Date getRegiDate() {
		return regiDate;
	}

	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
}
