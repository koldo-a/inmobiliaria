package com.example.servicios;

import org.springframework.stereotype.Service;

import com.example.entidades.Operaciones;

import jakarta.transaction.Transactional;

@Service
@Transactional
public interface OperacionService {
	
    Iterable<Operaciones> listarOperaciones();
    void guardar(Operaciones operacion);
    void borrar(Long id);
	void modificar(Operaciones operacion);
	Operaciones obtenerOperacionPorId(Long id);
}
