module ApplicationHelper
  def partido_color(partido)
    
    colores_partidos = {
      "Liberal" => "#FFD700",
      "Conservador" => "#0047AB",
      "Verde" => "#00A86B",
      "Centro Democrático" => "#003DA5",
      "Pacto Histórico" => "#E63946",
      "Cambio Radical" => "#FF6B35",
      "Polo Democrático" => "#FFD60A",
      "Alianza Verde" => "#40916C",
      "Partido de la U" => "#00509D"
    }

    return colores_partidos[partido.nombre] if colores_partidos[partido.nombre]

    
    hash = partido.nombre.sum % 10
    
    colores_generados = [
      "#3b82f6", # Azul
      "#10b981", # Verde
      "#f59e0b", # Amarillo
      "#ef4444", # Rojo
      "#8b5cf6", # Púrpura
      "#ec4899", # Rosa
      "#06b6d4", # Cyan
      "#f97316", # Naranja
      "#6366f1", # Índigo
      "#14b8a6"  # Teal
    ]
    
    colores_generados[hash]
  end
end