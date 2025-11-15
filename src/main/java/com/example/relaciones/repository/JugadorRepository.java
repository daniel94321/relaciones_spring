package com.example.relaciones.repository;

import com.example.relaciones.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface JugadorRepository extends JpaRepository<Jugador, Long> {}
