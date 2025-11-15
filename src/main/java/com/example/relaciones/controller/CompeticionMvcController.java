package com.example.relaciones.controller;

import com.example.relaciones.entity.Competicion;
import com.example.relaciones.repository.CompeticionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CompeticionMvcController {

    private final CompeticionRepository competicionRepo;

    public CompeticionMvcController(CompeticionRepository competicionRepo) {
        this.competicionRepo = competicionRepo;
    }

    // 🔹 Listar competiciones
    @GetMapping("/competiciones")
    public String listCompeticiones(Model model) {
        model.addAttribute("competiciones", competicionRepo.findAll());

        // Evita error 500 de Thymeleaf
        if (!model.containsAttribute("competicion")) {
            model.addAttribute("competicion", new Competicion());
        }

        return "competiciones";
    }

    // 🔹 Crear nueva competición
    @PostMapping("/competiciones")
    public String createCompeticion(@ModelAttribute Competicion competicion) {
        competicionRepo.save(competicion);
        return "redirect:/competiciones";
    }

    // 🔹 Mostrar formulario de edición
    @GetMapping("/competiciones/edit/{id}")
    public String editCompeticionForm(@PathVariable Long id, Model model) {
        Competicion competicion = competicionRepo.findById(id).orElse(null);
        if (competicion == null) {
            return "redirect:/competiciones";
        }

        model.addAttribute("competicion", competicion);
        model.addAttribute("competiciones", competicionRepo.findAll());
        return "competiciones";
    }

    // 🔹 Actualizar competición
    @PostMapping("/competiciones/update")
    public String updateCompeticion(@ModelAttribute Competicion competicion) {
        if (competicion.getId() != null && competicionRepo.existsById(competicion.getId())) {
            competicionRepo.save(competicion);
        }
        return "redirect:/competiciones";
    }

    // 🔹 Eliminar (AJAX)
    @DeleteMapping("/api/competiciones/{id}")
    @ResponseBody
    public void deleteCompeticion(@PathVariable Long id) {
        competicionRepo.deleteById(id);
    }
}
