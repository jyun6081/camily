package com.camily.dto;

import lombok.Data;

@Data
public class FAQDto {
	int faqcode;         
    String faqmid;  
    String faqtitle;     
    String faqcontents;
    int faqstate;
    String faqdate;
    int faqhits;
}
