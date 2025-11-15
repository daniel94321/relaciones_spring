package com.example.relaciones.controller;

import com.example.relaciones.entity.Jugador;
import com.example.relaciones.entity.Club;
import com.example.relaciones.repository.JugadorRepository;
import com.example.relaciones.repository.ClubRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class JugadorMvcController {

    private final JugadorRepository jugadorRepo;
    private final ClubRepository clubRepo;

    public JugadorMvcController(JugadorRepository jugadorRepo, ClubRepository clubRepo) {
        this.jugadorRepo = jugadorRepo;
        this.clubRepo = clubRepo;
    }

    // 🔹 Listar jugadores
    @GetMapping("/jugadores")
    public String listJugadores(Model model) {
        model.addAttribute("jugadores", jugadorRepo.findAll());
        model.addAttribute("clubs", clubRepo.findAll());

        // Evita errores si se abre el form sin jugador cargado
        if (!model.containsAttribute("jugador")) {
            model.addAttribute("jugador", new Jugador());
        }

        return "jugadores";
    }

    // 🔹 Crear nuevo jugador
    @PostMapping("/jugadores")
    public String createJugador(@ModelAttribute Jugador jugador) {
        if (jugador.getClub() != null && jugador.getClub().getId() != null) {
            Club club = clubRepo.findById(jugador.getClub().getId()).orElse(null);
            jugador.setClub(club);
        }
        jugadorRepo.save(jugador);
        return "redirect:/jugadores";
    }

    // 🔹 Mostrar formulario de edición
    @GetMapping("/jugadores/edit/{id}")
    public String editJugadorForm(@PathVariable Long id, Model model) {
        Jugador jugador = jugadorRepo.findById(id).orElse(null);
        if (jugador == null) {
            return "redirect:/jugadores";
        }

        model.addAttribute("jugador", jugador);
        model.addAttribute("jugadores", jugadorRepo.findAll());
        model.addAttribute("clubs", clubRepo.findAll());
        return "jugadores";
    }

    // 🔹 Actualizar jugador
    @PostMapping("/jugadores/update")
    public String updateJugador(@ModelAttribute Jugador jugador) {
        if (jugador.getId() != null && jugadorRepo.existsById(jugador.getId())) {
            if (jugador.getClub() != null && jugador.getClub().getId() != null) {
                Club club = clubRepo.findById(jugador.getClub().getId()).orElse(null);
                jugador.setClub(club);
            }
            jugadorRepo.save(jugador);
        }
        return "redirect:/jugadores";
    }

    // 🔹 Eliminar jugador (AJAX)
    @DeleteMapping("/api/jugadores/{id}")
    @ResponseBody
    public void deleteJugador(@PathVariable Long id) {
        jugadorRepo.deleteById(id);
    }
}
