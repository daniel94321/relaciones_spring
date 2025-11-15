package com.example.relaciones.controller;

import com.example.relaciones.entity.Entrenador;
import com.example.relaciones.repository.EntrenadorRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class EntrenadorMvcController {

    private final EntrenadorRepository entrenadorRepo;

    public EntrenadorMvcController(EntrenadorRepository entrenadorRepo) {
        this.entrenadorRepo = entrenadorRepo;
    }

    // 🔹 Listar entrenadores
    @GetMapping("/entrenadores")
    public String listEntrenadores(Model model) {
        model.addAttribute("entrenadores", entrenadorRepo.findAll());

        // Evita error 500 de Thymeleaf al cargar el form
        if (!model.containsAttribute("entrenador")) {
            model.addAttribute("entrenador", new Entrenador());
        }

        return "entrenadores";
    }

    // 🔹 Crear nuevo entrenador
    @PostMapping("/entrenadores")
    public String createEntrenador(@ModelAttribute Entrenador entrenador) {
        entrenadorRepo.save(entrenador);
        return "redirect:/entrenadores";
    }

    // 🔹 Mostrar formulario de edición
    @GetMapping("/entrenadores/edit/{id}")
    public String editEntrenadorForm(@PathVariable Long id, Model model) {
        Entrenador entrenador = entrenadorRepo.findById(id).orElse(null);
        if (entrenador == null) {
            return "redirect:/entrenadores";
        }

        model.addAttribute("entrenador", entrenador);
        model.addAttribute("entrenadores", entrenadorRepo.findAll());
        return "entrenadores";
    }

    // 🔹 Actualizar entrenador
    @PostMapping("/entrenadores/update")
    public String updateEntrenador(@ModelAttribute Entrenador entrenador) {
        if (entrenador.getId() != null && entrenadorRepo.existsById(entrenador.getId())) {
            entrenadorRepo.save(entrenador);
        }
        return "redirect:/entrenadores";
    }

    // 🔹 Eliminar entrenador (AJAX)
    @DeleteMapping("/api/entrenadores/{id}")
    @ResponseBody
    public void deleteEntrenador(@PathVariable Long id) {
        entrenadorRepo.deleteById(id);
    }
}
