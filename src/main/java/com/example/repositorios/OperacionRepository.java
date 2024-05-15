package com.example.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.entidades.Operaciones;

@Repository
public interface OperacionRepository extends JpaRepository<Operaciones, Long> {

	List<Operaciones> findByUsuarioNombre(String nombreUsuario);

}
