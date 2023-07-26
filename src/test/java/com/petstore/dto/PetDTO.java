package com.petstore.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
public class PetDTO {
    public Long id;
    public CategoryDTO category;
    public String name = "Unknown";
    public List<String> photoUrls;
    public List<TagDTO> tags;
    public String status;
}
