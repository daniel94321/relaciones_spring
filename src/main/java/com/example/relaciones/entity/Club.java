package com.example.relaciones.entity;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "clubes")
public class Club {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;

    @OneToOne
    @JoinColumn(name = "entrenador_id")
    private Entrenador entrenador;

    @ManyToOne
    @JoinColumn(name = "asociacion_id")
    private Asociacion asociacion;

    @OneToMany(mappedBy = "club", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Jugador> jugadores = new ArrayList<>();

    @ManyToMany
    @JoinTable(
        name = "club_competicion",
        joinColumns = @JoinColumn(name = "club_id"),
        inverseJoinColumns = @JoinColumn(name = "competicion_id"))
    private List<Competicion> competiciones = new ArrayList<>();

    // 🔹 Constructores
    public Club() {}

    public Club(Long id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    // 🔹 Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public Entrenador getEntrenador() { return entrenador; }
    public void setEntrenador(Entrenador entrenador) { this.entrenador = entrenador; }

    public Asociacion getAsociacion() { return asociacion; }
    public void setAsociacion(Asociacion asociacion) { this.asociacion = asociacion; }

    public List<Jugador> getJugadores() { return jugadores; }
    public void setJugadores(List<Jugador> jugadores) { this.jugadores = jugadores; }

    public List<Competicion> getCompeticiones() { return competiciones; }
    public void setCompeticiones(List<Competicion> competiciones) { this.competiciones = competiciones; }
}
