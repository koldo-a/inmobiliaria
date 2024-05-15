package com.example.servicios;

import org.springframework.stereotype.Service;

import com.example.entidades.Propietario;

import jakarta.transaction.Transactional;

@Service
@Transactional
public interface PropietarioService {
    Iterable<Propietario> listarPropietarios();
    void guardar(Propietario autor);
    void borrar(Long id);
	void modificar(Propietario autor);
	Propietario obtenerPropietarioPorId(Long id);
}
