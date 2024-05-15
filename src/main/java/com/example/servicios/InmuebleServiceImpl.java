package com.example.servicios;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entidades.Inmueble;
import com.example.entidades.Usuario;
import com.example.repositorios.ClienteRepository;
import com.example.repositorios.InmuebleRepository;
import com.example.repositorios.UsuarioRepository;

import jakarta.transaction.Transactional;

@Service
public class InmuebleServiceImpl implements InmuebleService {

	@Autowired
	InmuebleRepository inmuebleRepository;

	private Iterable<Inmueble> inmuebles = new ArrayList<>();

	@Override
	public Inmueble obtenerInmueblePorId(Long id) {
		return inmuebleRepository.findById(id).orElse(null);
	}

	@Override
	public Iterable<Inmueble> listarInmuebles() {
		inmuebles = inmuebleRepository.findAll();
		return inmuebles;
	}

	@Override
	public void guardar(Inmueble inmueble) {
		inmueble.setId(null);
		inmuebleRepository.save(inmueble);
	}

	@Override
	public void borrar(Long id) {
		inmuebleRepository.deleteById(id);
	}

//    comentario
	public InmuebleServiceImpl(UsuarioRepository usuarioRepository, InmuebleRepository inmuebleRepository,
			ClienteRepository clienteRepository) {
		usuarioRepository.save(Usuario.builder().nombre("Javier").apellido("Lete").email("javier@email.net")
				.password("$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO").rol("ADMIN").build());
		usuarioRepository.save(Usuario.builder().nombre("Koldo").apellido("Arretxea").email("koldo@email.net")
				.password("$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO").rol("ADMIN").build());
		usuarioRepository.save(Usuario.builder().nombre("Pepe").apellido("Peponez").email("pepe@email.net")
				.password("$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq").rol("USER").build());
	}

	@Override
	public void modificar(Inmueble inmueble) {
		inmuebleRepository.save(inmueble);
	}

	// Probando servicios iniciados
	@Override
	@Transactional
	public Inmueble obtenerInmuebleConServicios(Long id) {
		Inmueble inmueble = obtenerInmueblePorId(id);
		if (inmueble != null) {
	        // Forzar la inicialización de la colección de servicios
	        inmueble.getServicios().size();
	        // Guardar los cambios en la base de datos
	        inmuebleRepository.save(inmueble);
		}
		return inmueble;
	}

	@Override
	public List<Inmueble> buscarPorTipo(String tipo) {
		return inmuebleRepository.findByTipo(tipo);
	}
}
