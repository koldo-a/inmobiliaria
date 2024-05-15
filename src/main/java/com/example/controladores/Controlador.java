package com.example.controladores;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entidades.Inmueble;
import com.example.entidades.Propietario;
import com.example.entidades.Usuario;
import com.example.repositorios.InmuebleRepository;
import com.example.repositorios.PropietarioRepository;
import com.example.servicios.InmuebleService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/")
public class Controlador {

	private static final String REDIRECT_LISTADO_PRODUCTOS = "redirect:/listado-inmuebles";

	private static final String ATRIBUTO_PRODUCTO = "inmueble";

	@Autowired
	private InmuebleService inmuebleService;

	@Autowired
	private InmuebleRepository inmuebleRepository;
	
	@Autowired
	private PropietarioRepository propietarioRepository;

	@GetMapping("/inmueble/{id}")
	public String verDetalleInmueble(@PathVariable Long id, Model model) {
		Inmueble inmueble = inmuebleService.obtenerInmueblePorId(id);
		model.addAttribute(ATRIBUTO_PRODUCTO, inmueble);
		return "detalle-inmueble";
	}

	@SuppressWarnings("unused")
	@GetMapping("/listado-inmuebles")
	public String listarInmuebles(Model model, @RequestParam(required = false) String nombreODireccion, @RequestParam(required = false) String propietario,
			@RequestParam(required = false) LocalDate fecha, @RequestParam(required = false) String tipo, @RequestParam(required = false) BigDecimal precioMin,
            @RequestParam(required = false) BigDecimal precioMax, @RequestParam(required = false) String direccion) {
		Iterable<Inmueble> inmuebles;

		if (nombreODireccion != null && !nombreODireccion.isEmpty()) {
	        // Buscar por nombre o dirección
	        inmuebles = inmuebleRepository.findByNombreContainingIgnoreCaseOrDireccionContainingIgnoreCase(nombreODireccion, nombreODireccion);
		} else if (direccion != null && !direccion.isEmpty()) {
	        // Buscar por dirección
	        inmuebles = inmuebleRepository.findByDireccionContainingIgnoreCase(direccion);
	    } else if (propietario != null && !propietario.isEmpty()) {
			// Buscar por nombre o apellido del propietario
			inmuebles = inmuebleRepository.findByPropietarioNombreContainingIgnoreCaseOrPropietarioApellidoContainingIgnoreCase(propietario, propietario);
		} else if (fecha != null) {
			// Buscar por fecha
			inmuebles = inmuebleRepository.findByFechaInmueble(fecha);
			
		} else if (tipo != null && !tipo.isEmpty()) {
	        inmuebles = inmuebleService.buscarPorTipo(tipo);
	        
	    } else if (precioMin != null && precioMax != null) {
			
			inmuebles = inmuebleRepository.findByPrecioBetween(precioMin, precioMax);
			
		} else if (fecha != null) {
			// Buscar por fecha
			inmuebles = inmuebleRepository.findByFechaInmuebleOrderByFechaInmuebleDesc(fecha);
		} else {
			// Si no se proporcionan criterios de búsqueda, retornar todos los inmuebles
			// ordenados por fecha descendente
			inmuebles = inmuebleRepository.findAllByOrderByFechaInmuebleDesc();
		}
		
	    // Cargar la lista de propietarioes
	    Iterable<Propietario> propietariosIterable = propietarioRepository.findAll(); 
	    
	 // Convertir el Iterable de propietarioes a una lista y ordenarla alfabéticamente por nombre
	    List<Propietario> propietarios = StreamSupport.stream(propietariosIterable.spliterator(), false)
	                                      .sorted(Comparator.comparing(Propietario::getNombre))
	                                      .collect(Collectors.toList());
	    
		model.addAttribute("inmuebles", inmuebles);
		model.addAttribute("propietarios", propietarios);
		model.addAttribute(ATRIBUTO_PRODUCTO, new Inmueble());
		return "listado-inmuebles";
	}
	
	@SuppressWarnings("unused")
	@GetMapping("/listado-inmuebles2")
	public String listarInmuebles2(Model model, @RequestParam(required = false) String nombreODireccion, @RequestParam(required = false) String propietario,
			@RequestParam(required = false) LocalDate fecha, @RequestParam(required = false) String tipo, @RequestParam(required = false) BigDecimal precioMin,
			@RequestParam(required = false) BigDecimal precioMax, @RequestParam(required = false) String direccion) {
		Iterable<Inmueble> inmuebles;
		
		if (nombreODireccion != null && !nombreODireccion.isEmpty()) {
			// Buscar por nombre o dirección
			inmuebles = inmuebleRepository.findByNombreContainingIgnoreCaseOrDireccionContainingIgnoreCase(nombreODireccion, nombreODireccion);
		} else if (direccion != null && !direccion.isEmpty()) {
			// Buscar por dirección
			inmuebles = inmuebleRepository.findByDireccionContainingIgnoreCase(direccion);
		} else if (propietario != null && !propietario.isEmpty()) {
			// Buscar por nombre o apellido del propietario
			inmuebles = inmuebleRepository.findByPropietarioNombreContainingIgnoreCaseOrPropietarioApellidoContainingIgnoreCase(propietario, propietario);
		} else if (fecha != null) {
			// Buscar por fecha
			inmuebles = inmuebleRepository.findByFechaInmueble(fecha);
			
		} else if (tipo != null && !tipo.isEmpty()) {
			inmuebles = inmuebleService.buscarPorTipo(tipo);
			
		} else if (precioMin != null && precioMax != null) {
			
			inmuebles = inmuebleRepository.findByPrecioBetween(precioMin, precioMax);
			
		} else if (fecha != null) {
			// Buscar por fecha
			inmuebles = inmuebleRepository.findByFechaInmuebleOrderByFechaInmuebleDesc(fecha);
		} else {
			// Si no se proporcionan criterios de búsqueda, retornar todos los inmuebles
			// ordenados por fecha descendente
			inmuebles = inmuebleRepository.findAllByOrderByFechaInmuebleDesc();
		}
		
		// Cargar la lista de propietarioes
		Iterable<Propietario> propietariosIterable = propietarioRepository.findAll(); 
		
		// Convertir el Iterable de propietarioes a una lista y ordenarla alfabéticamente por nombre
		List<Propietario> propietarios = StreamSupport.stream(propietariosIterable.spliterator(), false)
				.sorted(Comparator.comparing(Propietario::getNombre))
				.collect(Collectors.toList());
		
		model.addAttribute("inmuebles", inmuebles);
		model.addAttribute("propietarios", propietarios);
		model.addAttribute(ATRIBUTO_PRODUCTO, new Inmueble());
		return "listado-inmuebles2";
	}

	@PostMapping("/guardarInmueble")
	public String guardarInmueble(@Valid Inmueble inmueble, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			System.out.println("error de entrada");
			return "listado-inmuebles";
		}
		inmuebleService.guardar(inmueble);

		return REDIRECT_LISTADO_PRODUCTOS;
	}
	
	@GetMapping("borrarInmueble/{id}")
	public String borrarInmueble(@PathVariable Long id) {
		inmuebleService.borrar(id);

		return REDIRECT_LISTADO_PRODUCTOS;
	}

	@GetMapping("/")
	public String mostrarPaginaPrincipal(Model modelo) {
		// Lógica para preparar el modelo si es necesario
		modelo.addAttribute("usuario", new Usuario());
		return "index";
	}

	@GetMapping("/editarInmueble/{id}")
	public String editarInmueble(@PathVariable Long id, Model model) {
		Inmueble inmueble = inmuebleService.obtenerInmueblePorId(id);
		model.addAttribute(ATRIBUTO_PRODUCTO, inmueble);
		return "formulario-edicion-inmueble";
	}

	@PostMapping("/guardarCambiosInmueble")
	public String guardarCambiosInmueble(@Valid Inmueble inmueble, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			// Manejar los errores de validación si es necesario
			return "formulario-edicion-inmueble"; // Volver al formulario de edición
		}

		inmuebleService.modificar(inmueble); // Guardar los cambios en el cliente
		
		return "redirect:/listado-inmuebles";
		}

	@GetMapping("login")
	public String login() {
		return "login";
	}
}
