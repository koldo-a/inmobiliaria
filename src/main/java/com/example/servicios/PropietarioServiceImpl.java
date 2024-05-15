package com.example.servicios;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entidades.Propietario;
import com.example.repositorios.PropietarioRepository;

@Service
public class PropietarioServiceImpl implements PropietarioService {

	@Autowired
	PropietarioRepository propietarioRepository;

	private Iterable<Propietario> propietarios = new ArrayList<>();

	@Override
	public Iterable<Propietario> listarPropietarios() {
		propietarios = propietarioRepository.findAll();
		return propietarios;
	}

	@Override
	public void guardar(Propietario propietario) {
		propietario.setId(null);
		propietarioRepository.save(propietario);
	}

	@Override
	public void borrar(Long id) {
		propietarioRepository.deleteById(id);
	}

	@Override
	public void modificar(Propietario propietario) {
		propietarioRepository.save(propietario);
	}

	@Override
	public Propietario obtenerPropietarioPorId(Long id) {
		return propietarioRepository.findById(id).orElse(null);
	}

}
