package com.example.servicios;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entidades.Operaciones;
import com.example.repositorios.OperacionRepository;

@Service
public class OperacionServiceImpl implements OperacionService {

	@Autowired
	OperacionRepository operacionRepository;

	private Iterable<Operaciones> operaciones = new ArrayList<>();

	@Override
	public Iterable<Operaciones> listarOperaciones() {
		operaciones = operacionRepository.findAll();
		return operaciones;
	}

//	@Override
//	public void guardar(Operacion operacion) {
//		operacion.setId(null);
//		operacionRepository.save(operacion);
//	}

	@Override
	public void guardar(Operaciones operacion) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void borrar(Long id) {
		operacionRepository.deleteById(id);
	}

	@Override
	public void modificar(Operaciones operacion) {
		operacionRepository.save(operacion);
	}

	@Override
	public Operaciones obtenerOperacionPorId(Long id) {
		return operacionRepository.findById(id).orElse(null);
	}
}
