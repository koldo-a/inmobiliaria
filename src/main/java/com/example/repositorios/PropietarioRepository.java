package com.example.repositorios;

import org.springframework.data.repository.CrudRepository;

import com.example.entidades.Propietario;

public interface PropietarioRepository extends CrudRepository<Propietario, Long> {

	Propietario findByNombre(String nombreAutor);
}