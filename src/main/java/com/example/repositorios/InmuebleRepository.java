package com.example.repositorios;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.entidades.Inmueble;

public interface InmuebleRepository extends CrudRepository<Inmueble, Long> {
	List<Inmueble> findByNombreContainingIgnoreCase(String nombre);
	List<Inmueble> findByDireccionContainingIgnoreCase(String nombre);
	List<Inmueble> findByPropietarioNombreContainingIgnoreCase(String propietario);
	List<Inmueble> findByPropietarioNombreContainingIgnoreCaseOrPropietarioApellidoContainingIgnoreCase(String nombre, String apellido);
	Iterable<Inmueble> findByFechaInmueble(LocalDate fecha);
	Iterable<Inmueble> findByFechaInmuebleOrderByFechaInmuebleDesc(LocalDate fecha);
	Iterable<Inmueble> findAllByOrderByFechaInmuebleDesc();

	// Método para buscar inmuebles dentro de un rango de precios
    List<Inmueble> findByPrecioBetween(BigDecimal precioMin, BigDecimal precioMax);
    List<Inmueble> findByTipo(String tipo);
	Iterable<Inmueble> findByNombreContainingIgnoreCaseOrDireccionContainingIgnoreCase(String nombreODireccion,
			String nombreODireccion2);
}
