package com.example.relaciones.controller;

import com.example.relaciones.entity.Asociacion;
import com.example.relaciones.repository.AsociacionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AsociacionMvcController {

    private final AsociacionRepository asociacionRepo;

    public AsociacionMvcController(AsociacionRepository asociacionRepo) {
        this.asociacionRepo = asociacionRepo;
    }

    // 🔹 Listar asociaciones
    @GetMapping("/asociaciones")
    public String listAsociaciones(Model model) {
        model.addAttribute("asociaciones", asociacionRepo.findAll());

        // 👇 Evita error 500 en Thymeleaf
        if (!model.containsAttribute("asociacion")) {
            model.addAttribute("asociacion", new Asociacion());
        }

        return "asociaciones";
    }

    // 🔹 Crear asociación
    @PostMapping("/asociaciones")
    public String createAsociacion(@ModelAttribute Asociacion asociacion) {
        asociacionRepo.save(asociacion);
        return "redirect:/asociaciones";
    }

    // 🔹 Mostrar formulario de edición
    @GetMapping("/asociaciones/edit/{id}")
    public String editAsociacionForm(@PathVariable Long id, Model model) {
        Asociacion asociacion = asociacionRepo.findById(id).orElse(null);
        if (asociacion == null) {
            return "redirect:/asociaciones";
        }

        model.addAttribute("asociacion", asociacion);
        model.addAttribute("asociaciones", asociacionRepo.findAll());
        return "asociaciones";
    }

    // 🔹 Actualizar asociación
    @PostMapping("/asociaciones/update")
    public String updateAsociacion(@ModelAttribute Asociacion asociacion) {
        if (asociacion.getId() != null && asociacionRepo.existsById(asociacion.getId())) {
            asociacionRepo.save(asociacion);
        }
        return "redirect:/asociaciones";
    }

    // 🔹 Eliminar (AJAX)
    @DeleteMapping("/api/asociaciones/{id}")
    @ResponseBody
    public void deleteAsociacion(@PathVariable Long id) {
        asociacionRepo.deleteById(id);
    }
}
