package com.example.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.entidades.Operaciones;
import com.example.servicios.OperacionService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/")
public class ControladorOperacion {

	@Autowired
	private OperacionService operacionService;

	@GetMapping("/operacion/{id}")
	public String verDetalleOperacion(@PathVariable Long id, Model model) {
	    Operaciones operacion = operacionService.obtenerOperacionPorId(id);
	    model.addAttribute("operacion", operacion);
	    return "detalle-operacion";
	}

	@PostMapping("/guardarOperacion")
	public String guardarOperacion(@Valid Operaciones operacion, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			System.out.println("error de entrada");
			return "listado-operaciones";
		}
		operacionService.guardar(operacion);

		return "redirect:/listado-operaciones";
	}

	@GetMapping("borrarOperacion/{id}")
	public String borrarOperacion(@PathVariable Long id) {
		operacionService.borrar(id);

		return "redirect:/listado-operaciones";
	}

	@GetMapping("/listado-operaciones")
	public String listarOperacions(Model modelo) {
		modelo.addAttribute("operaciones", operacionService.listarOperaciones());
		modelo.addAttribute("operacion", new Operaciones());
		return "listado-operaciones";
	}

	@GetMapping("/editarOperacion/{id}")
	public String editarOperacion(@PathVariable Long id, Model model) {
		Operaciones operacion = operacionService.obtenerOperacionPorId(id);
		model.addAttribute("operacion", operacion);
		return "formulario-edicion-operacion";
	}

	@PostMapping("/guardarCambiosOperacion")
	public String guardarCambiosOperacion(@Valid Operaciones operacion, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			// Manejar los errores de validación si es necesario
			return "formulario-edicion-operacion"; // Volver al formulario de edición
		}
		
		operacionService.modificar(operacion); // Guardar los cambios en el cliente
		
		return "redirect:/listado-operaciones"; // Redirigir al listado de clientes u otra vista apropiada
	}

}
