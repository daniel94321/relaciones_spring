package com.example.relaciones.controller;

import com.example.relaciones.entity.Club;
import com.example.relaciones.repository.ClubRepository;
import com.example.relaciones.repository.EntrenadorRepository;
import com.example.relaciones.repository.AsociacionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ClubMvcController {

    private final ClubRepository clubRepo;
    private final EntrenadorRepository entrenadorRepo;
    private final AsociacionRepository asociacionRepo;

    public ClubMvcController(ClubRepository clubRepo,
                             EntrenadorRepository entrenadorRepo,
                             AsociacionRepository asociacionRepo) {
        this.clubRepo = clubRepo;
        this.entrenadorRepo = entrenadorRepo;
        this.asociacionRepo = asociacionRepo;
    }

    // 🔹 Mostrar lista de clubes
    @GetMapping("/clubs")
    public String listClubs(Model model) {
        model.addAttribute("clubs", clubRepo.findAll());
        model.addAttribute("entrenadores", entrenadorRepo.findAll());
        model.addAttribute("asociaciones", asociacionRepo.findAll());

        // 👇 Esto evita error 500 en Thymeleaf
        if (!model.containsAttribute("club")) {
            model.addAttribute("club", new Club());
        }

        return "clubs";
    }

    // 🔹 Crear nuevo club
    @PostMapping("/clubs")
    public String createClub(@ModelAttribute Club club) {
        clubRepo.save(club);
        return "redirect:/clubs";
    }

    // 🔹 Cargar formulario de edición
    @GetMapping("/clubs/edit/{id}")
    public String editClubForm(@PathVariable Long id, Model model) {
        Club club = clubRepo.findById(id).orElse(null);
        if (club == null) {
            return "redirect:/clubs";
        }

        model.addAttribute("club", club);
        model.addAttribute("clubs", clubRepo.findAll());
        model.addAttribute("entrenadores", entrenadorRepo.findAll());
        model.addAttribute("asociaciones", asociacionRepo.findAll());
        return "clubs";
    }

    // 🔹 Actualizar club (después de editar)
    @PostMapping("/clubs/update")
    public String updateClub(@ModelAttribute Club club) {
        if (club.getId() != null && clubRepo.existsById(club.getId())) {
            clubRepo.save(club);
        }
        return "redirect:/clubs";
    }

    // 🔹 Eliminar club (AJAX)
    @DeleteMapping("/api/clubes/{id}")
    @ResponseBody
    public void deleteClub(@PathVariable Long id) {
        clubRepo.deleteById(id);
    }
}
