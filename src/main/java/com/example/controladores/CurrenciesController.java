package com.example.controladores;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CurrenciesController {
    @GetMapping(value = "/currency")
    public String exchange(
      @RequestParam(value = "amount") String amount, Locale locale) {
        return "currencies/currencies";
    }
}