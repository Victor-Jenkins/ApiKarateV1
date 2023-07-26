package com.petstore.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.petstore.dto.PetDTO;

import java.util.List;
import java.util.Map;

import static java.lang.String.format;
import static java.util.stream.Collectors.*;

public class PetUtils {

    public static String countPetsByName(String responsePayload) throws JsonProcessingException {
        List<PetDTO> petList = JsonMapper.jsonStringToObject(responsePayload, new TypeReference<List<PetDTO>>() {
        });
        Map<String, Long> nameCounter = petList.stream().collect(groupingBy(PetDTO::getName, counting()));
        return nameCounter.keySet().stream()
                .map(petName -> format("\"%s\":%d", petName, nameCounter.get(petName)))
                .collect(joining(",", "{", "}"));
    }

}
