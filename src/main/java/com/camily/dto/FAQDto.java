package com.camily.dto;

import lombok.Data;

@Data
public class FAQDto {
	int faqcode;
    String faqmid;  
    int faqtype;
    String faqtitle;     
    String faqcontents;
    int faqstate;
    String faqdate;
    int faqhits;
}
