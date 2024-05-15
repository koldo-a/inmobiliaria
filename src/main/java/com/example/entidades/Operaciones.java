package com.example.entidades;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Entity
@Table(name = "operaciones")
public class Operaciones {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
	@NotNull(message = "El inmueble no puede ser nulo")
    @ManyToOne
    @JoinColumn(name = "inmueble_id")
    private Inmueble inmueble;
	
	@NotNull(message = "El usuario no puede ser nulo")
    @ManyToOne
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

	@NotNull(message = "La fecha de la operación no puede ser nula")
    private LocalDate fechaOperacion;

}
