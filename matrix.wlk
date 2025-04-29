object nave {
    const pasajeros = []

    method cantidadPasajeros() = pasajeros.size()

    method pasajeroDeMayorVitalidad() = 
            pasajeros.max({pax => pax.vitalidad()}) 

    method estaEquilibrada() {
        return
        self.pasajeroDeMayorVitalidad().vitalidad() < self.pasajeroDeMenorVitalidad().vitalidad()*2
    }
    
    method pasajeroDeMenorVitalidad() = pasajeros.min({pax => pax.vitalidad()})

    method esElElegido() = pasajeros.any({pax => pax.esElElegido()})

    method chocar() {
        pasajeros.forEach({pax => pax.saltar()})
        pasajeros.clear()
    }

    method acelerar(){
        self.pasajerosNoElegidos().forEach({pax => pax.saltar()})
    }

    method pasajerosNoElegidos() = pasajeros.filter({pax => !pax.esElElegido() }) // ! = not

}

object neo {
    var energia = 100

    method esElElegido() = true
    method saltar() {energia = energia / 2}
    method vitalidad() = energia * 0.1 
}

object morfeo {

    var vitalidad = 8
    var estaCansado = false 
    method esElElegido() = false
    method saltar() {
        vitalidad = 0.max(vitalidad - 1)  
        estaCansado = !estaCansado
        }
    method vitalidad() = vitalidad
}

object trinity {
    
    method vitalidad() = 0 
    method esElElegido() = false 
    method saltar() {}
}
