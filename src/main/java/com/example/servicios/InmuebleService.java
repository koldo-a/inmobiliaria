package com.example.servicios;

import java.util.List;

import com.example.entidades.Inmueble;

import jakarta.validation.Valid;

public interface InmuebleService {
	Inmueble obtenerInmueblePorId(Long id);
    Iterable<Inmueble> listarInmuebles();
    void guardar(Inmueble inmueble);
    void borrar(Long id);
	void modificar(@Valid Inmueble inmueble);
	
    // Nuevo método para obtener un inmueble con servicios inicializados
    Inmueble obtenerInmuebleConServicios(Long id);
    List<Inmueble> buscarPorTipo(String tipo);
}
