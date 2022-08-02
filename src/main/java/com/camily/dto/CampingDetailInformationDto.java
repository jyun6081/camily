package com.camily.dto;

import lombok.Data;

@Data
public class CampingDetailInformationDto {
   private String dimid;
   private String dicode;
   private String diname;   
   private String diimage;  
   private String diamount;  
   private String diaddr; 
   private String diprice;
   private int ditotalprice;
   
   private String formatter;
   
   private String gstate; // 상품 활성화 비활성화 확인    
}