package com.example.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.entidades.Propietario;
import com.example.servicios.PropietarioService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/")
public class ControladorPropietario {

	private static final String ATRIBUTO_AUTOR = "propietario";
	private static final String REDIRECT_LISTADO_AUTORES = "redirect:/listado-propietarios";
	@Autowired
	private PropietarioService propietarioService;

    @GetMapping("/propietario/{id}")
	public String verDetallePropietario(@PathVariable Long id, Model model) {
	    Propietario propietario = propietarioService.obtenerPropietarioPorId(id);
	    model.addAttribute(ATRIBUTO_AUTOR, propietario);
	    return "detalle-propietario";
	}

	@PostMapping("/guardarPropietario")
	public String guardarPropietario(@Valid Propietario propietario, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			System.out.println("error de entrada");
			return "listado-propietarios";
		}
		propietarioService.guardar(propietario);

		return REDIRECT_LISTADO_AUTORES;
	}

	@GetMapping("borrarPropietario/{id}")
	public String borrarPropietario(@PathVariable Long id) {
		propietarioService.borrar(id);

		return REDIRECT_LISTADO_AUTORES;
	}

	@GetMapping("/listado-propietarios")
	public String listarPropietarioes(Model modelo) {
		modelo.addAttribute("propietarios", propietarioService.listarPropietarios());
		modelo.addAttribute(ATRIBUTO_AUTOR, new Propietario());
		return "listado-propietarios";
	}

	@GetMapping("/editarPropietario/{id}")
	public String editarPropietario(@PathVariable Long id, Model model) {
		Propietario propietario = propietarioService.obtenerPropietarioPorId(id);
		model.addAttribute(ATRIBUTO_AUTOR, propietario);
		return "formulario-edicion-propietario";
	}

	@PostMapping("/guardarCambiosPropietario")
	public String guardarCambiosPropietario(@Valid Propietario propietario, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {

			return "formulario-edicion-propietario";
		}
		
		propietarioService.modificar(propietario);
		
		return REDIRECT_LISTADO_AUTORES;
	}

}
