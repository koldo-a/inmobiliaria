package com.example.entidades;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "inmueble")
public class Inmueble {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@NotNull
	@NotBlank
	@Size(max = 255, message = "El nombre debe tener como máximo 255 caracteres")
	private String nombre;
	
    @Size(max = 255, message = "La dirección debe tener como máximo 255 caracteres")
	private String direccion;
	
    @Lob
    @Column(name = "inmueble_texto", columnDefinition = "TEXT")
    private String inmuebleTexto;
    
    @Column(name = "fecha_inmueble")
    private LocalDate fechaInmueble;
    
    @Column(name = "imagen_url")
    private String imagenUrl;
    
    @NotNull
    @Column(name = "precio")
    private BigDecimal precio;
    
    @NotNull
    @Column(name = "tipo")
    private String tipo; // "venta" o "alquiler"

//    @NotNull
    @Column(name = "habitaciones")
    private int habitaciones;
    
//    @NotNull
    @Column(name = "banyos")
    private int banyos;
    
//    @NotNull
    @Column(name = "cocina")
    private Boolean cocina;

    // Relación con Propietario
    @ManyToOne
    @JoinColumn(name = "propietario_id")
    private Propietario propietario;
    
    @ManyToMany
    @JoinTable(
        name = "inmueble_servicio",
        joinColumns = @JoinColumn(name = "inmueble_id"),
        inverseJoinColumns = @JoinColumn(name = "servicio_id")
    )
    
    @ToString.Exclude // Excluir la colección de servicios del método toString(). MUY IMPORTANTE.
    private Set<Servicio> servicios;
}